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

## MCP toolchain

This repo declares the MCP servers the project uses in [`.mcp.json`](.mcp.json).

| Doc | What it covers |
|---|---|
| [`docs/mcp/00-BRIEF.md`](docs/mcp/00-BRIEF.md) | The brief — intent, research, scope, constraints |
| [`docs/mcp/01-build-vs-connect.md`](docs/mcp/01-build-vs-connect.md) | When to build vs. install vs. connect, and what belongs in git |
| [`docs/mcp/02-setup-guide.md`](docs/mcp/02-setup-guide.md) | Verified per-MCP setup, staged in three waves |

Quick start:

```bash
cp .env.mcp.example .env.mcp   # fill in your keys — gitignored
set -a && . ./.env.mcp && set +a
claude                          # approve the project servers when prompted
/mcp                            # confirm they are connected
```

Buffer is intentionally **not** in `.mcp.json` — it publishes to live social
accounts, so it is added per-machine at `--scope local`. See the setup guide.
