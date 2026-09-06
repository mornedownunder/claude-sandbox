# Brief — Give Claude the Tools, Not More Chat

> **Status:** awaiting confirmation from Morné before execution.
> **Branch:** `claude/mcp-setup-workflow-dweppn`
> **Written:** 2026-09-06

---

## Note on method

You asked me to use the prompt-building skill to write the brief before
execution. The available skill (`lyra-prompt-engineering`) is scoped to the
Cogniate course-creation wizard — course name, level, teaching style,
duration, language. Those inputs do not exist for an infrastructure task, so
I did not force them.

What I did take from it is the part that transfers: **research the domain
first, then state the intent as a single flowing brief that implicitly
carries WHY / HOW / WHAT / WHOM, then confirm before building.** That
structure is below. If you want a genuinely general-purpose prompt-builder
skill for non-course work, that is a ten-minute `skill-creator` job and worth
doing — flag it and I will.

---

## Research performed

| Question | Finding |
|---|---|
| Are any of the five already connected to your Claude account? | No. Your 22 connectors cover CRM, comms, docs and design — none cover scraping, browser control, live research, generative media, or social publishing. |
| Are any in the Claude connector directory? | No. All five are configured outside it — four via `claude mcp add`, and Buffer/Higgsfield/Apify additionally as custom connectors on claude.ai. |
| Do the packages/endpoints actually exist? | Yes — all five verified (npm registry + upstream repos). Details and verification status in `02-setup-guide.md`. |
| Can I install them from this session? | **No.** See "Constraint" below. |

## Constraint discovered during research

This is an ephemeral remote container behind an egress policy. All five MCP
hosts — `mcp.apify.com`, `mcp.buffer.com`, `mcp.higgsfield.ai`,
`api.perplexity.ai`, and the OAuth callbacks they need — return **403 at the
proxy**. Even if they did not, the container is reclaimed after inactivity and
a browser-based OAuth handshake has nowhere to land.

So "execute the installation" cannot honestly happen here. It has to happen on
your machine. That constraint is not an obstacle to the objective — it *is*
the objective's central lesson, and it is what the coaching guide is about.

---

## The brief

Give Claude a working toolchain across the five capabilities it currently
lacks — harvesting data at scale, driving a real browser, researching with
citations, generating media, and publishing — so that a request like *"find
what our three competitors shipped this quarter, verify it, make the carousel,
and queue it for Tuesday"* runs end to end instead of stopping at the first
thing a chat window cannot do.

This will be done by **connecting** rather than building: four of the five are
hosted services or published packages, so the correct artefact is a declared,
reviewable, version-controlled *contract* — `.mcp.json` in this repo naming
which servers the project uses and which of their tools are permitted — with
every credential held in the environment and never in git. Nothing is
authored, nothing is deployed, and no MCP server is built, because building
one is only warranted when no server exists for a system you must reach, or
when an existing one is too broad to expose safely and needs a narrow façade
in front of it.

What you get is a repo that carries the toolchain definition, a setup guide
verified against upstream sources, and a decision rule you can apply to the
next MCP without asking me — plus the guardrails that matter: Apify's tool
list scoped so it does not flood the context window, Playwright pinned and
isolated because it is explicitly not a security boundary, and Buffer kept
behind a human confirmation because it writes to live social accounts.

This is for you, working in Claude Code and on claude.ai, and for anyone who
later clones this repo and needs the same tools without a Slack thread asking
which ones and why.

---

## Scope

**In:**
1. Verified per-MCP setup guide, with auth method, cost model, and risk noted.
2. `.mcp.json` — the version-controlled contract, staged in three waves.
3. `.env.mcp.example` — secret *names* only, never values.
4. Coaching guide: build vs. install vs. connect, and where each lands in git.
5. Guardrails: tool scoping, version pinning, publish gating.

**Out:**
- Running `claude mcp add` in this container (blocked; would be discarded).
- Authoring any MCP server (nothing here justifies it — see the guide).
- Paid account signup on your behalf (Apify, Perplexity, Higgsfield, Buffer).

## Success test

You clone this repo on your laptop, export three env vars, run one wave of
setup commands, and `/mcp` shows the servers connected. A new team member
does the same without asking a question.
