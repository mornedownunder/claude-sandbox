# Front-end design tooling — decided stack

Decision record from the Phase 1–3 evaluation of five candidate design plugins.

Constraints applied:
- No Microsoft-authored tooling.
- Anthropic-native preferred where an equivalent exists.
- Vercel skills wanted; no existing Vercel account.

## Layer 1 — Already enabled, Anthropic-native (use before installing anything)

These are live on the account today and cover more of the brief than expected.

| Skill / connector | Covers | Replaces candidate |
|---|---|---|
| `design` | Claude Design canvas inside Claude Code — multi-artboard visual design, published as an editable Artifact | Awesome Design |
| `artifact-design` | Design calibration pass before writing any artifact | Awesome Design |
| `theme-factory` | Theme and token generation | Awesome Design |
| `brand-guidelines` | Brand colour and typography application | Awesome Design |
| `web-artifacts-builder` | Building web artifacts | — |
| `website-component-analyzer` | Deconstructing existing sites into components | — |
| Figma MCP | Design-to-code and code-to-design, both directions | Image to Code (partly) |

**Action: none. Use `/design` before reaching for a third-party design-opinion skill.**

## Layer 2 — Install: the audit layer

```bash
npx skills add vercel-labs/agent-skills
```

- **Type:** skill bundle, 8 skills, MIT, project scope
- **The one that matters:** `web-design-guidelines` — audits UI code against 100+ accessibility,
  performance and UX rules, reported at `file:line`
- **No Vercel account required.** It reads local files and fetches a public rulebook from GitHub.
  Only `vercel-optimize` and `vercel-deploy-claimable` need a Vercel login; ignore them.
- **Runtime network dependency:** fetches fresh rules from
  `raw.githubusercontent.com/vercel-labs/web-interface-guidelines/main/command.md` on every run.
  Verify that host is reachable from the environment before relying on it.
- **Also worth having from the same bundle:** `react-best-practices`, `composition-patterns`

## Layer 3 — Install: one taste source, selectively

```bash
npx skills add https://github.com/Leonxlnx/taste-skill --skill "image-to-code"
npx skills add https://github.com/Leonxlnx/taste-skill --skill "design-taste-frontend-v1"
```

- **Type:** skill bundle, 13 skills available, MIT, project scope
- **Take two, not thirteen.** The bundle ships competing aesthetic instructions
  (`minimalist-ui`, `industrial-brutalist-ui`, `high-end-visual-design`, `gpt-taste`,
  two versions of `design-taste-frontend`). Loading them together degrades output.
- `image-to-code` was candidate #5 on the original list — it lives here, not in a separate repo.
- **Caution:** 84.6k stars against 154 commits is an anomalous ratio for a markdown repo.
  Content is legitimate and MIT; treat the popularity signal as unreliable.

## Layer 4 — Browser inspection (constraint conflict)

Original candidate was Playwright. **Playwright is Microsoft-authored on both install paths**,
including the Anthropic-curated official plugin — excluded by constraint.

Substitute:

```bash
claude mcp add chrome-devtools npx chrome-devtools-mcp@latest
```

- **Type:** MCP server, from `ChromeDevTools/chrome-devtools-mcp`, built on Puppeteer, user scope
- **Provides:** ~29 tools — screenshots, console messages with source-mapped stack traces,
  network request inspection, performance traces
- **Trade-off:** Google rather than Microsoft. Not Anthropic-native; no Anthropic-native
  equivalent exists.
- Also listed in the official Anthropic plugin marketplace; check `/plugin` for a
  `chrome-devtools-mcp` entry, which is the cleaner install if present.

## Dropped

**Awesome Design** (`VoltAgent/awesome-claude-design`, `rohitg00/awesome-claude-design`) —
not installable. Reference collections of `DESIGN.md` files aimed at Claude Design on the web,
not Claude Code. Layer 1 covers this natively. If a specific brand direction is wanted, download
one `DESIGN.md` and pass it as context for that task only.

## Install order

One at a time, testing between each. Design-opinion skills conflict silently rather than erroring.

1. Vercel skills — run an audit on an existing page, confirm the rulebook fetch succeeds
2. Chrome DevTools MCP — confirm a screenshot actually returns
3. Taste Skill — build one component, check it does not fight the house style

## Removal

- Skills installed by `npx skills add` live in `.claude/skills/<name>/` — delete the directory
- MCP servers — `claude mcp remove chrome-devtools`
