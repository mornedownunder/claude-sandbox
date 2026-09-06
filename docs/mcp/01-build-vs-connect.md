# Build, Install, or Connect — and What Goes in Git

The question you asked: *when does something get built and version-controlled
in GitHub, and when is it a simple connection?*

Short answer, then the detail.

> **Version-control the contract. Never version-control the connection.
> Only build when nobody has built it for you.**

---

## The three tiers

There are exactly three things people mean by "installing an MCP", and they
have completely different homes.

### Tier 1 — Connect (someone else runs it)

A hosted MCP server at a URL. You authorise once via OAuth in a browser. No
code runs on your machine, no package is downloaded, nothing is built.

*Here:* Buffer, Higgsfield, Apify (hosted), Perplexity (hosted).

| | |
|---|---|
| What you do | Paste a URL, click Allow |
| What runs locally | Nothing |
| Credential | An OAuth session held by Claude, in your OS keychain |
| **In git** | **One line naming the URL — that's all** |
| Breaks when | The vendor changes their API. Not your problem to fix. |

### Tier 2 — Install (you run someone else's code)

A published npm package that Claude launches as a local subprocess over stdio.
You are not building anything — you are declaring a dependency, exactly like
adding a line to `package.json`.

*Here:* Playwright, and the local variants of Apify and Perplexity.

| | |
|---|---|
| What you do | `claude mcp add <name> -- npx -y <package>@<version>` |
| What runs locally | A Node process, spawned and killed with your session |
| Credential | An env var read at launch |
| **In git** | **The declaration and the pinned version — never the key** |
| Breaks when | The package publishes a breaking change. Pinning is why you pin. |

### Tier 3 — Build (you author the server)

You write an MCP server. This is a real software project and gets the full
treatment: repo, tests, CI, semver, release, deploy, on-call.

*Here: none of the five.* Which is the point.

| | |
|---|---|
| What you do | Author, test, review, release |
| **In git** | **Everything — it *is* the repo** |
| Breaks when | You break it. Hence tests. |

---

## When building is actually justified

Build only when one of these is true. If none are, you are writing code you
will have to maintain forever in exchange for nothing.

1. **Nothing exists.** The system you need — an internal API, a legacy
   database, a bespoke pipeline — has no MCP server and never will, because
   only you have it.

2. **What exists is too broad to expose safely.** This is the common one and
   the one most people miss. Apify's hosted server can reach thousands of
   actors. If your team should only ever call three of them, with a spend cap
   and an audit log, you write a thin **façade server**: six tools, your
   guardrails, calling Apify underneath. That is a build, and it is worth it.

3. **It must run inside your network.** The data cannot leave. A hosted
   connector is not an option, so you run your own.

4. **You need the call log.** Compliance, billing attribution, or you simply
   need to answer "who scraped what, when". Hosted servers will not give you
   that; a façade will.

5. **You are composing several into one workflow.** When "research → generate →
   publish" should be a *single* tool call with the sequencing and validation
   baked in, rather than three calls Claude has to orchestrate correctly every
   time.

For everything else: connect, and spend the saved week on the work.

> When you do hit a real case, the `mcp-builder` skill in your account covers
> it end to end. That is the moment it earns its keep — not before.

---

## Where configuration lives

Four surfaces. People conflate them and then wonder why a teammate's setup
does not work.

| Surface | File | Scope | In git? |
|---|---|---|---|
| `claude mcp add --scope local` | `~/.claude.json`, keyed by project path | You, this project | **No** |
| `claude mcp add --scope user` | `~/.claude.json`, top level | You, every project | **No** |
| `claude mcp add --scope project` | `.mcp.json` in the repo root | **Everyone who clones** | **Yes** |
| claude.ai Connectors | Your Claude account | You, in chat, on any device | **No — not a file** |

Three rules that follow:

**1. `--scope project` is the only one that is version control.** It writes
`.mcp.json` to the repo root. It is the artefact of this whole exercise. When
a teammate clones and opens Claude Code, they are prompted to approve the
servers the project declares — reviewable in a diff, like any other dependency.

**2. `--scope user` is for tools that follow you, not the project.** Playwright
and Perplexity are arguably yours-everywhere. Apify's tool scoping is
project-specific. Pick deliberately; the default is `local`, which is almost
never what you want.

**3. claude.ai connectors are account-level and cannot be version-controlled
at all.** Your 22 existing connectors — Notion, HubSpot, Gmail, Airtable — live
in your Claude account. Perfect for chat. Invisible to a repo. If a *workflow*
depends on a tool, that tool belongs in `.mcp.json`, not only in your account
settings, or the workflow is not reproducible.

### The credential rule

Configuration goes in git. Credentials go in the environment. Never the reverse.

`.mcp.json` supports `${VAR}` expansion, so the file names the variable and the
shell supplies the value:

```json
"env": { "PERPLEXITY_API_KEY": "${PERPLEXITY_API_KEY}" }
```

The repo carries `.env.mcp.example` listing the *names*. `.env.mcp` carrying
the values is gitignored. If you ever find yourself about to commit a token,
you have skipped a step — and a token in git history is compromised even after
you delete it. Rotate it, don't rewrite history and hope.

---

## Applying it to your five

| MCP | Tier | Why | Git |
|---|---|---|---|
| Apify | Connect (hosted) or Install (local) | Thousands of scrapers already built. Building your own scraper infra is the classic wasted quarter. | URL + **tool scope** in `.mcp.json` |
| Playwright | Install | Microsoft publishes and maintains it. | Package + **pinned version** + flags |
| Perplexity | Connect or Install | It is an API wrapper. Nothing to add. | URL, or package + env var name |
| Higgsfield | Connect | Hosted, OAuth, 30+ models behind one endpoint. | URL |
| Buffer | Connect | Official, hosted, OAuth, free tier. | URL |

Zero builds. That is the correct answer for this set, and recognising it is
worth more than any of the five.

**The build case that would apply to you:** if the "competitor research →
draft → queue" loop becomes something you run weekly and hand to someone else,
the thing worth building is not an MCP server for any of these tools. It is a
**skill** that orchestrates them — and you already have the pattern for that
in your account. Skills are cheap, live in git, and compose the connectors you
already have. Reach for a skill first; reach for a server only when a skill
cannot get at the data.

---

## Two traps

**Tool-list bloat.** Every connected server injects its tool definitions into
context on every turn. Five unscoped servers can cost thousands of tokens
before you type anything, and a model choosing among 200 tools chooses worse
than one choosing among 20. Apify's `?tools=` parameter exists for exactly
this. Scope aggressively; add on demand.

**Blast radius.** These are not read-only.

- **Playwright is explicitly not a security boundary** — upstream says so. It
  can execute arbitrary code via `browser_run_code_unsafe`, which is
  RCE-equivalent against untrusted pages. `--isolated` and `--allowed-origins`
  are conveniences, not walls. Never point it at a page you do not trust while
  it holds a logged-in profile.
- **Buffer publishes to live social accounts.** Outward-facing and effectively
  irreversible — a deleted post was still seen. Keep it out of any autonomous
  or headless session; a human confirms before anything queues.
- **Apify, Perplexity and Higgsfield spend real money per call.** A retry loop
  is a bill. Set spend caps at the vendor, not in the prompt.
