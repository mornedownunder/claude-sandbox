#!/usr/bin/env bash
#
# Preflight check for the Agent Reach capability.
#
# Why this exists: the skill at .claude/skills/agent-reach/ is committed to the
# repo, so it loads in EVERY session — including sessions where the CLI behind
# it was never installed. Without this check an agent confidently reaches for a
# tool that is not there and fails mid-task. Fail loudly and early instead.
#
# Exit codes:
#   0  CLI present and on PATH        -> capability is usable
#   1  CLI installed but not on PATH  -> recoverable, prints the export line
#   2  CLI not installed              -> prints the install command
#
set -uo pipefail

VENV_BIN="${AGENT_REACH_HOME:-$HOME/.agent-reach}/venv/bin"

if command -v agent-reach >/dev/null 2>&1; then
  echo "OK: agent-reach $(agent-reach version 2>/dev/null || echo '(version unknown)')"
  echo "Run 'agent-reach doctor --json' to see which backend serves each platform."
  exit 0
fi

if [ -x "$VENV_BIN/agent-reach" ]; then
  echo "PARTIAL: agent-reach is installed but not on PATH."
  echo
  echo "  export PATH=\"$VENV_BIN:\$PATH\""
  exit 1
fi

cat <<MSG
MISSING: the agent-reach CLI is not installed.

The Agent Reach skill is loaded (it ships with this repo), but the CLI it
drives is absent, so its commands will fail. Install it:

  scripts/install-agent-reach.sh --dry-run   # inspect first
  scripts/install-agent-reach.sh
  export PATH="$VENV_BIN:\$PATH"

Do NOT 'pip install agent-reach' — that PyPI name is an unrelated project.
See docs/capabilities/agent-reach.md.
MSG
exit 2
