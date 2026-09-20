# Handover — design stack and brand alignment

Written 2026-09-20 at the close of the session that set this up. Read this
before picking the work up; it is the whole context in one file.

## Where things stand

| Repo | `main` | State |
|---|---|---|
| `mornedownunder/landingpage` | `638a85a` | Live site, aligned to the brand kit |
| `mornedownunder/claude-sandbox` | `66e9598` | Tooling, prompts, skills, docs |

Nothing is pending. No open pull requests, nothing uncommitted, no scheduled
jobs, no PR watches.

## What happened, in one paragraph

The session started from a social post recommending five Claude plugins to fix
a "design problem". Investigating them found two were not what they claimed:
**Awesome Design** is not installable (it is a collection of `DESIGN.md`
reference files aimed at Claude Design on the web), and **Image to Code** is not
a separate project (it is a skill inside the Taste Skill repo). **Playwright
CLI** is Microsoft-authored on every install path including the Anthropic
curated plugin, so it was excluded on a vendor constraint and substituted with
Chrome DevTools MCP. The two that were real and useful were installed. Along the
way the site got two rounds of genuine accessibility fixes, and then the actual
cause of the "design problem" turned up: **Cogniate had a complete brand system
that the landing page was not using.**

## What is installed on `landingpage`

| Thing | What it does |
|---|---|
| `DESIGN.md` | The brand system, extracted from `Cogniate_Master_Kit.html`. Violet scale, ink ramp, Neue Montreal type scale, 4px space scale, radii, ink-tinted elevation, motion curves, two voice registers. |
| `fonts/` + `@font-face` | Neue Montreal, four woff2 uprights, 93 KB. Self-hosted, no Google Fonts. **Licence is held** — purchased through the branding agency, confirmed 2026-09-20. |
| `.mcp.json` | Chrome DevTools MCP. Lets Claude open the site, screenshot it, read console and network. Needs Google Chrome installed locally. |
| `.claude/skills/web-design-guidelines` | Vercel's UI audit. Fetches its rulebook live from GitHub on every run. No Vercel account needed. |
| `.claude/skills/writing-guidelines` | Came in the same bundle. |
| `.claude/skills/design-taste-frontend` | Taste Skill v2. React-leaning; see caveat below. |
| `.claude/skills/image-to-code` | Taste Skill. Expects an image generator; see caveat below. |

## What is in `claude-sandbox`

- `prompts/install-design-plugins.md` — the phased prompt that drove the plugin investigation
- `docs/design-tooling.md` — the decision record: what was installed, dropped, and why
- `docs/design-tooling-runbook.md` — install runbook, verification gate at each step
- `.claude/agents/design-reviewer.md` — read-only subagent that runs guideline audits in its own context
- `.claude/skills/repo-hygiene/` — verified merged-branch cleanup

## Carry these into a rebuild, skip the rest

1. **`DESIGN.md` — in the first commit, before any CSS.** This is the single
   most valuable artefact. The whole drift problem happened because the site was
   built first and the brand retrofitted. Build from the system and there is no
   drift to find.
2. **`fonts/` and the `@font-face` block.** Licence is settled.
3. **`.mcp.json`.** Four lines, gives the agent eyes.
4. **`repo-hygiene`.** A rebuild generates branches.

**Reassess before carrying:** `design-taste-frontend` mentions React 32 times
and `vanilla` zero times; `image-to-code` states "image generation is mandatory
first" and is written for Codex. Both were installed on request and are safe,
but neither has demonstrated value on this codebase. A real brand spec is a
better input than a generic taste skill — judge them on output, not on faith.

## Open items

- **Ten merged branches** across both repos, all verified safe. Use
  `repo-hygiene`. Needs a `settings.json` permission rule; the skill documents
  it. Untidy, not harmful — deprioritise freely.
- **Canva connector** needs authorising at claude.ai → Settings → Connectors.
- **Three reference sites** — apple.com, boc.studio/work, boonglobal.io — were
  supplied as aesthetic direction and **all three were blocked by the sandbox
  egress proxy**. Nothing in `DESIGN.md` is derived from them. If that direction
  matters, supply screenshots instead of links.
- **Never tested with a screen reader.** Roles and properties are verified
  present and correctly synced in the DOM; how NVDA or VoiceOver announce them
  is a separate, unmade claim.

## Two things this session got wrong, worth not repeating

**A shallow clone lies about mergedness.** `git merge-base --is-ancestor`
reported a merged branch as unmerged on a `--depth 1` checkout, and the user was
told not to delete work that was already safe. Deepen history before trusting
any ancestry check. This is now encoded in `repo-hygiene`.

**An audit rule firing is not a bug.** The Vercel skill correctly flagged a
missing `scroll-margin-top`; that got reported to the user as "your nav links
are broken", which testing disproved — section padding already cleared the fixed
nav, and `main.js` offsets anchor clicks anyway. The rule was real, the impact
was invented. Verify the consequence, not just the violation.

## Verification habits that paid off

- Compare renders, not intentions. Establish a noise floor first: two loads of
  the *unmodified* page differed by 1.695% because of the animated particle
  canvas, which made the 1.585% from the accessibility work provably invisible.
- An install is not a capability. `chrome-devtools-mcp` completed an MCP
  handshake and advertised 29 tools while being unable to launch a browser.
  Drive the thing end to end — a returned screenshot is the only proof.
- Check the remote, not the tool's success message. A pull request reported
  merged by the API was still open; `git ls-remote` settled it.
