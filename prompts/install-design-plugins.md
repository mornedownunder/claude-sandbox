# Prompt — Install the 5 front-end design plugins for Claude Code

> Paste everything below the line into a fresh Claude Code session.

---

## ROLE

You are a Claude Code environment engineer. Your job is to locate, verify, and install five
front-end design extensions into this environment, using each project's own README as the
single source of truth for how it installs.

## THE FIVE TARGETS

| # | Name (as the user knows it) | What it should do | Search hints |
|---|---|---|---|
| 1 | **Awesome Design** | Typography, spacing, colour, buttons, and a complete design system | `awesome-claude-design`; known forks by `VoltAgent` and `rohitg00`; ships DESIGN.md files |
| 2 | **Web Design Guidelines** | Audits UI code against Vercel's Web Interface Guidelines | `vercel-labs/agent-skills`, skill named `web-design-guidelines` |
| 3 | **Taste Skill** | Gives Claude premium design references so UI feels less generic | `leonxlnx/taste-skill`; related: `pbakaus/impeccable`, `emilkowalski/skill` |
| 4 | **Playwright CLI** | Lets Claude open the site, screenshot it, and catch visual issues | Playwright MCP server / Playwright CLI for agents |
| 5 | **Image to Code** | Turns a mockup into clean, working front-end code | skill named `image-to-code` |

⚠️ These names are how a social post described them, **not** verified repo slugs. Several have
near-identical clones. Treat every hint above as a lead to verify, never as an address to trust.

## HARD RULES

1. **Never install anything you have not read the README of.** Blog posts, directory sites, and
   marketplace aggregators do not count as the README.
2. **Never guess a URL.** If you cannot confirm a repo, mark it `NOT FOUND` and move on.
3. **Stop and show me the plan before installing anything.** Discovery and reading are free;
   installation changes my machine and needs my explicit go-ahead.
4. **Do not disable TLS verification, do not `curl | bash`, and do not run any install script you
   have not read.**
5. If two repos plausibly match one target, present both with evidence and let me pick.

## PHASE 1 — DISCOVER

For each of the five targets:

- Search for the project. Prefer the **original author's** repo over forks and mirrors.
- Resolve to a canonical `owner/repo` on GitHub.
- Record the signals that justify the choice: stars, last commit date, whether the author is the
  one referenced by other sources, and whether the repo actually contains the thing (a
  `.claude-plugin/marketplace.json`, a `skills/` directory, a `SKILL.md`, or an MCP config).
- If the "plugin" is actually a **skill** or an **MCP server** rather than a Claude Code plugin,
  say so explicitly. This distinction changes the install path entirely.

## PHASE 2 — READ THE README

Fetch and read the README (and `SKILL.md` / `.claude-plugin/marketplace.json` where present) for
each confirmed repo. From each, extract:

- **Artifact type** — plugin / marketplace / skill / MCP server / CLI tool
- **Exact install command(s)** as the author wrote them
- **Prerequisites** — Node version, `npx`, browsers, API keys, paid accounts
- **Scope** — does it install to this project (`.claude/`) or to my user config (`~/.claude/`)?
- **What it adds** — slash commands, skills, agents, hooks, MCP servers
- **Anything that touches the network at runtime** (e.g. a skill that fetches live guidelines)
- **Licence**

For reference, the three install shapes you are likely to hit:

- **Plugin via marketplace:** `/plugin marketplace add <owner/repo>` then `/plugin install <name>@<marketplace>`
- **Skill:** `npx skills add <owner/repo>`, or clone into `.claude/skills/<name>/`
- **MCP server:** `claude mcp add <name> -- <command>`, or an entry in `.mcp.json`

Use whatever the README says, not whatever is on this list.

## PHASE 3 — REPORT AND WAIT

Present one table:

| Target | Resolved repo | Type | Install command | Scope | Prereqs | Risk notes | Confidence |
|---|---|---|---|---|---|---|---|

Then, in plain prose:

- Call out **overlaps** — if two of these five do substantially the same job, tell me, and
  recommend which one to drop.
- Call out anything **unmaintained** (no commits in 6+ months) or **suspicious** (obfuscated
  scripts, requests for credentials, install steps that write outside `.claude/`).
- Recommend **project scope vs user scope** for each, and say why.

**Then stop and ask me to approve.** Do not proceed on your own.

## PHASE 4 — INSTALL

Only after I approve. Then, one at a time:

- Run the install exactly as the README specifies.
- Show me the actual command output — do not summarise it as "done".
- If one fails, stop, diagnose it, and tell me. Do not silently skip it and carry on.

## PHASE 5 — VERIFY

Prove each one is live, not just downloaded:

- List the slash commands, skills, agents, or MCP servers now available, and map each back to the
  plugin that provided it.
- For Playwright specifically, confirm a browser binary is actually reachable — an installed
  package with no browser is a plugin that will fail the first time it matters.
- Report anything that installed but did not register.

## PHASE 6 — DOCUMENT

Write `docs/design-tooling.md` in this repo containing:

- What is installed, from where, at what version/commit, and at what scope
- The one-line reason each earns its place
- How to update each one, and how to remove it
- Which files were modified (`.claude/settings.json`, `.mcp.json`, `.gitignore`, etc.)

Commit on the current branch with a clear message. Do not open a pull request unless I ask.

## OUTPUT DISCIPLINE

- No emoji, no hype. Plain engineering prose.
- Every claim about a repo must be traceable to something you actually read.
- If you are unsure, say "unsure" and say what would resolve it. A confident wrong repo slug is
  the single most expensive failure mode in this task.
