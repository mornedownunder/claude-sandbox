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
scripts/agent-reach-preflight.sh           # is the capability ready?
scripts/install-agent-reach.sh --dry-run   # inspect first
scripts/install-agent-reach.sh             # install into ~/.agent-reach/venv
export PATH="$HOME/.agent-reach/venv/bin:$PATH"
agent-reach doctor
```

Permissions and an optional `SessionStart` preflight hook are templated in
[`.claude/settings.example.json`](.claude/settings.example.json) — copy it into
`.claude/settings.json` after reading it.

> **Do not run `pip install agent-reach`** — that PyPI name is an unrelated
> project. Use the installer above, which pins the correct GitHub commit.

The engineered prompt behind this integration is kept at
[prompts/agent-reach-integration.md](prompts/agent-reach-integration.md).

## MCP toolchain

This repo declares the MCP servers the project uses in [`.mcp.json`](.mcp.json).

| Doc | What it covers |
|---|---|
| [`docs/mcp/00-BRIEF.md`](docs/mcp/00-BRIEF.md) | The brief — intent, research, scope, constraints |
| [`docs/mcp/01-build-vs-connect.md`](docs/mcp/01-build-vs-connect.md) | When to build vs. install vs. connect, and what belongs in git |
| [`docs/mcp/02-setup-guide.md`](docs/mcp/02-setup-guide.md) | Verified per-MCP setup, staged in three waves |
| [`docs/mcp/03-decision.md`](docs/mcp/03-decision.md) | **What each of the five does, and which we adopted — read this first** |

> **This repo is a reference implementation, not the live config.**
> The workflows these servers serve — course composition, deal rooms, the
> books — do not run in this repo, and a project-scope `.mcp.json` only loads
> for sessions inside it. So the servers are installed at **`--scope user`**,
> where they load everywhere. `.mcp.json` here shows the shape and pins the
> versions; it is not what your day-to-day sessions read.

Install at user scope (do this once, on your own machine):

```bash
npx playwright install chromium
export PERPLEXITY_API_KEY="pplx-..."          # add to your shell profile

claude mcp add playwright --scope user -- \
  npx -y @playwright/mcp@0.0.80 --isolated --headless
claude mcp add perplexity --scope user \
  -e PERPLEXITY_API_KEY="$PERPLEXITY_API_KEY" \
  -- npx -y @perplexity-ai/mcp-server@1.2.1
claude mcp add --transport http --scope user apify \
  "https://mcp.apify.com?tools=actors,docs,apify/rag-web-browser"

/mcp    # then make ONE real call per server — connected only means it started
```

To try the project-scope pattern in this repo instead:

```bash
cp .env.mcp.example .env.mcp   # fill in your keys — gitignored
set -a && . ./.env.mcp && set +a
claude                          # approve the project servers when prompted
```

**Playwright**, **Apify** and **Perplexity** are declared. Of the five
evaluated: **Buffer is deferred** until there is a social calendar to publish
to — it writes to live accounts, so when added it goes per-machine at
`--scope local`, human-gated. **Higgsfield is rejected** — it duplicates the
ElevenLabs creative stack. Reasoning in the decision record.
