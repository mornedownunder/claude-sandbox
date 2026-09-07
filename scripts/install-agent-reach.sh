#!/usr/bin/env bash
#
# Install the Agent Reach CLI for this repo's agent capability.
#
# Best-practice choices baked in:
#   * Pinned to an exact upstream commit (reproducible, auditable).
#   * Installed from GitHub, NOT PyPI — the PyPI name `agent-reach` is an
#     unrelated project (jgalea/agent-reach).
#   * Isolated in its own venv under $AGENT_REACH_HOME; never touches system
#     site-packages and never needs sudo.
#   * Read-only environment probe by default; `--system` is opt-in only.
#
# Usage:
#   scripts/install-agent-reach.sh              # install + read-only probe
#   scripts/install-agent-reach.sh --dry-run    # show what would happen
#   scripts/install-agent-reach.sh --system     # allow system-level deps
#
set -euo pipefail

# Keep this SHA in sync with .claude/skills/agent-reach/UPSTREAM.md
AGENT_REACH_COMMIT="da5044d26fc6adddb6554d5679c94ac22e76e428"
AGENT_REACH_REPO="https://github.com/Panniantong/agent-reach"
AGENT_REACH_HOME="${AGENT_REACH_HOME:-$HOME/.agent-reach}"
VENV="$AGENT_REACH_HOME/venv"
BIN="$VENV/bin/agent-reach"

MODE="default"
for arg in "$@"; do
  case "$arg" in
    --dry-run) MODE="dry-run" ;;
    --system)  MODE="system" ;;
    -h|--help) sed -n '2,18p' "$0"; exit 0 ;;
    *) echo "unknown argument: $arg" >&2; exit 2 ;;
  esac
done

require_python() {
  local py
  for py in python3.12 python3.11 python3.10 python3; do
    if command -v "$py" >/dev/null 2>&1 &&
       "$py" -c 'import sys; raise SystemExit(0 if sys.version_info >= (3,10) else 1)'; then
      echo "$py"; return 0
    fi
  done
  echo "error: Agent Reach requires Python >= 3.10" >&2
  exit 1
}

PYTHON="$(require_python)"
echo "==> Python:  $PYTHON ($("$PYTHON" -V 2>&1))"
echo "==> Target:  $VENV"
echo "==> Source:  $AGENT_REACH_REPO @ ${AGENT_REACH_COMMIT:0:12}"

if [ "$MODE" = "dry-run" ]; then
  echo "==> --dry-run: no changes made."
  exit 0
fi

mkdir -p "$AGENT_REACH_HOME"
[ -d "$VENV" ] || "$PYTHON" -m venv "$VENV"

"$VENV/bin/python" -m pip install --quiet --upgrade pip
"$VENV/bin/python" -m pip install --quiet \
  "agent-reach @ git+${AGENT_REACH_REPO}@${AGENT_REACH_COMMIT}"

echo "==> Installed: $("$BIN" version 2>/dev/null || echo 'version unavailable')"

# Read-only environment probe. --system is only ever passed when the operator
# explicitly asked for it.
if [ "$MODE" = "system" ]; then
  "$BIN" install --env=auto --system
else
  "$BIN" install --env=auto
fi

"$BIN" doctor || true

cat <<NOTE

==> Done. Add the CLI to your PATH for this shell:

      export PATH="$VENV/bin:\$PATH"

    Optional channels (Twitter, Reddit, XiaoHongShu, ...) need credentials.
    Configure them yourself — never let an agent log in on your behalf:

      agent-reach configure <platform>-cookies

    See docs/capabilities/agent-reach.md for the full capability contract.
NOTE
