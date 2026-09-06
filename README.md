# claude-sandbox
Sandbox repo for Claude Code sessions

## hello.py

A minimal Python script that prints a greeting. `greet(name)` builds the
greeting string (defaulting to `"World"`), and `main()` prints it when the
file is run directly.

Run it with:

```bash
python hello.py
```

Expected output:

```
Hello, World!
```

## Capabilities

Agent capabilities available to Claude Code sessions in this repo.

| Capability | What it does | Docs |
|---|---|---|
| **Agent Reach** | Read & search 15 internet platforms (web, GitHub, YouTube, Reddit, Twitter/X, Bilibili, XiaoHongShu, RSS, …) from one CLI, no per-platform API keys | [docs/capabilities/agent-reach.md](docs/capabilities/agent-reach.md) |

Agent Reach is wired in as a version-controlled skill at
`.claude/skills/agent-reach/`, vendored from
[Panniantong/Agent-Reach](https://github.com/Panniantong/Agent-Reach) (MIT) and
pinned to commit `da5044d2`. To install the CLI:

```bash
scripts/install-agent-reach.sh --dry-run   # inspect first
scripts/install-agent-reach.sh             # install into ~/.agent-reach/venv
export PATH="$HOME/.agent-reach/venv/bin:$PATH"
agent-reach doctor
```

> **Do not run `pip install agent-reach`** — that PyPI name is an unrelated
> project. Use the installer above, which pins the correct GitHub commit.

The engineered prompt behind this integration is kept at
[prompts/agent-reach-integration.md](prompts/agent-reach-integration.md).
