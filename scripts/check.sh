#!/usr/bin/env bash
#
# Repo checks. Run locally exactly as CI runs them:
#
#   scripts/check.sh
#
# CI calls this same script, so a green run here means a green run there.
#
set -uo pipefail
cd "$(dirname "$0")/.." || exit 1

fails=0
pass() { printf '  \033[32mok\033[0m   %s\n' "$1"; }
fail() { printf '  \033[31mFAIL\033[0m %s\n' "$1"; fails=$((fails + 1)); }

echo "==> Shell scripts"
shopt -s nullglob
for f in scripts/*.sh; do
  if bash -n "$f" 2>/dev/null; then pass "$f parses"; else fail "$f has a syntax error"; fi
  if [ -x "$f" ]; then pass "$f is executable"; else fail "$f is not executable (chmod +x)"; fi
done

if command -v shellcheck >/dev/null 2>&1; then
  echo "==> shellcheck"
  for f in scripts/*.sh; do
    if shellcheck -S warning "$f"; then pass "$f clean"; else fail "$f has shellcheck warnings"; fi
  done
else
  echo "==> shellcheck"
  printf '  \033[33mSKIP\033[0m shellcheck is not installed locally, but CI runs it and\n'
  printf '       will fail on warnings this run cannot see. Install it:\n'
  printf '         macOS: brew install shellcheck\n'
  printf '         Debian/Ubuntu: apt-get install shellcheck\n'
fi

echo "==> JSON"
while IFS= read -r f; do
  if python3 -c "import json,sys; json.load(open(sys.argv[1]))" "$f" 2>/dev/null; then
    pass "$f is valid JSON"
  else
    fail "$f is not valid JSON"
  fi
done < <(find . -name '*.json' -not -path './.git/*')

# A malformed SKILL.md frontmatter makes the skill silently fail to load —
# no error, it just never triggers. Worth catching in CI.
echo "==> Skill frontmatter"
while IFS= read -r f; do
  if python3 - "$f" <<'PY'
import re, sys
try:
    import yaml
except ImportError:
    yaml = None
path = sys.argv[1]
text = open(path, encoding="utf-8").read()
m = re.match(r"^---\n(.*?)\n---\n", text, re.S)
if not m:
    sys.exit("missing --- frontmatter block")
if yaml is None:
    sys.exit(0)
try:
    data = yaml.safe_load(m.group(1))
except Exception as exc:
    sys.exit(f"frontmatter is not valid YAML: {exc}")
if not isinstance(data, dict):
    sys.exit("frontmatter is not a mapping")
for key in ("name", "description"):
    if not data.get(key):
        sys.exit(f"frontmatter is missing required key: {key}")
expected = path.split("/")[-2]
if data["name"] != expected:
    sys.exit(f"name '{data['name']}' does not match directory '{expected}'")
PY
  then pass "$f frontmatter"; else fail "$f frontmatter"; fi
done < <(find . -name 'SKILL.md' -not -path './.git/*')

# The pinned commit is the audit boundary for vendored content. If UPSTREAM.md
# and the installer drift apart, we no longer know what we ship.
echo "==> Vendored pin consistency"
up=".claude/skills/agent-reach/UPSTREAM.md"
inst="scripts/install-agent-reach.sh"
if [ -f "$up" ] && [ -f "$inst" ]; then
  a=$(grep -oE '[0-9a-f]{40}' "$up" | head -1)
  b=$(grep -oE '[0-9a-f]{40}' "$inst" | head -1)
  if [ -n "$a" ] && [ "$a" = "$b" ]; then
    pass "pinned commit matches in UPSTREAM.md and installer (${a:0:12})"
  else
    fail "pinned commit mismatch: UPSTREAM.md='$a' installer='$b'"
  fi
fi

echo
if [ "$fails" -eq 0 ]; then
  echo "All checks passed."
else
  echo "$fails check(s) failed."
fi
exit $(( fails > 0 ? 1 : 0 ))
