# Proposed skill edits — teach the skills to use Playwright

Adding an MCP changes nothing until the skills that need it know to reach for
it. These are the exact edits required, held here because the skills live at
`~/.claude/skills/synced/<uuid>/` — synced down from the Claude account, not
in this repo, and wiped when an ephemeral container is reclaimed. Apply them
where the skills actually live.

**Correction first.** An earlier draft of `03-decision.md` claimed Playwright
would unblock the harvest phase of `cogniate-course-composer` because
`WebFetch` cannot authenticate. **That was overstated.** Reading the skill
shows it already has a browser strategy: Phase 1 deploys "browser-harvest
agents (Claude in Chrome)" and the Source access ladder prefers driving *the
user's already-open, logged-in Chrome*. For an attended run that is strictly
better than Playwright — the session is already authenticated in the real
browser. Playwright's role there is a **fallback**, not an unblock.

Net effect on the decision: **Playwright still earns its place, but on one
strong case rather than two.**

| Skill | Playwright's role | Strength |
|---|---|---|
| `website-component-analyzer` | Replaces a raw-HTML fetch that returns pre-render shells on JS-driven sites | **Strong — this is the real win** |
| `cogniate-course-composer` | Fallback tier when Claude in Chrome cannot be driven (unattended, remote, headless) | Modest but worth wiring |
| Cogniate platform E2E testing | Net-new capability | Strong, and unprompted by the source post |

---

## Patch 1 — `website-component-analyzer/SKILL.md`

The skill's whole purpose is deconstructing marketing sites into components.
Those are overwhelmingly JS-driven, and `web_fetch` returns the pre-render
shell — so the analysis silently runs against a near-empty DOM. The skill even
carries "Dynamic content" as a known caveat. This closes it.

### 1a — Step 1 (around line 23)

**Replace:**

````
Use `web_fetch` to retrieve the full website HTML:

```bash
web_fetch url="https://www.example.com"
```

Then systematically scan from top to bottom, identifying distinct visual and functional sections.
````

**With:**

````
Retrieve the page. **Choose the method deliberately — this decides whether the
analysis is real or runs against an empty shell.**

**Default: Playwright.** Most sites worth deconstructing are JS-driven, and a
raw HTML fetch returns the pre-render shell — you would classify components
that are not there and miss every one that is.

```
browser_navigate  url="https://www.example.com"
browser_snapshot                                  # rendered accessibility tree
```

`browser_snapshot` is preferred over a screenshot: it returns structure and
text, which is what component classification needs. Add
`browser_take_screenshot` only when visual layout genuinely matters.

**Only use `web_fetch`** when the page is confirmed static (server-rendered
docs, plain marketing pages) and speed matters.

```bash
web_fetch url="https://www.example.com"
```

**How to tell you got a shell:** the fetch returns a near-empty `<body>`, a
lone `<div id="root">`, or a "please enable JavaScript" notice. If so, switch
to Playwright and re-run — do not analyse the shell.

**Before classifying, scroll the full page** (`browser_press_key key="End"`,
or `browser_evaluate`) so lazy-loaded sections mount. A component that never
entered the viewport will not be in the snapshot.

Then systematically scan from top to bottom, identifying distinct visual and functional sections.
````

### 1b — Example Use Cases (around line 195)

**Replace:** `1. Fetch website with web_fetch`

**With:** `1. Fetch website with browser_navigate + browser_snapshot (scroll to the end first so lazy sections mount)`

### 1c — Notes (around line 217)

**Replace:**

```
- **Dynamic content:** Capture state at time of analysis; note if content rotates/changes
```

**With:**

```
- **Dynamic content:** Capture state at time of analysis; note if content rotates/changes.
  Use `browser_snapshot` rather than a raw fetch so rendered content is actually present.
- **Lazy-loaded sections:** Scroll the full page before snapshotting, or components below the
  fold will be missing entirely.
- **Cookie/consent overlays:** These frequently mask the hero. Dismiss with `browser_click`
  before snapshotting, and say so in the output if content stayed obscured.
```

---

## Patch 2 — `cogniate-course-composer/SKILL.md`

Small and deliberately conservative. Claude in Chrome stays the preferred
path; Playwright slots in one rung below it, so an unattended run degrades to
an authenticated browser instead of straight to "ask the user to paste".

### 2a — Source access ladder (around line 117)

**Replace:**

```
- **Source access.** Preferred: drive the user's already-open, logged-in Chrome (they keep the
  Wit & Wire community open). Fallbacks in order: user pastes/export; public research
  (podcasts, sales pages, show notes) with every reconstructed item labelled CONFIRMED vs
  INFERRED. Never fabricate proprietary lesson content.
```

**With:**

```
- **Source access.** Preferred: drive the user's already-open, logged-in Chrome (they keep the
  Wit & Wire community open) — for an attended run this beats every alternative, because the
  session is already authenticated. Fallbacks in order: (1) **Playwright MCP**, for unattended,
  remote or headless runs where Chrome cannot be driven — `browser_navigate` +
  `browser_snapshot`, with a saved `--storage-state` for gated courses; never enter the user's
  credentials, and stop and ask if a login wall is hit without saved state; (2) user
  pastes/export; (3) public research (podcasts, sales pages, show notes) with every
  reconstructed item labelled CONFIRMED vs INFERRED. Never fabricate proprietary lesson content.
```

### 2b — Phase 1 (around line 73)

**Append to the Phase 1 paragraph**, after "If the browser can't be reached, fall back to public research + ask the user to paste":

```
   — but try Playwright first (`browser_navigate` + `browser_snapshot`) before falling back to
   asking, so an unattended run still harvests real source material rather than stalling.
```

---

## Safety note carried into both

Playwright MCP is **not a security boundary** — upstream states this plainly,
and it is RCE-equivalent against untrusted pages via `browser_run_code_unsafe`.

- Harvesting a course we pay for, or analysing a named client site: fine.
- Crawling the open web at volume: use Apify, which is built for it.
- **Never** combine a saved logged-in `--storage-state` with navigation to
  pages we do not control.

## Verify after applying

1. Run `website-component-analyzer` against a known JS-driven marketing site.
   It should classify real components — if it reports a nearly empty page, the
   fetch path is still wrong.
2. Confirm `cogniate-course-composer` still prefers Claude in Chrome on an
   attended run, and only reaches for Playwright when Chrome is unavailable.

---

## Anchor verification

**2026-09-06 — all five replacement blocks verified against the live skill
files.** Each "replace this" block was matched byte-for-byte and found
**exactly once** in its target file:

| Block | Target | Result |
|---|---|---|
| 1a Step 1 fetch block | `website-component-analyzer/SKILL.md` | unique match |
| 1b Example Use Cases line | `website-component-analyzer/SKILL.md` | unique match |
| 1c Dynamic content note | `website-component-analyzer/SKILL.md` | unique match |
| 2a Source access ladder | `cogniate-course-composer/SKILL.md` | unique match |
| 2b Phase 1 anchor | `cogniate-course-composer/SKILL.md` | unique match |

So these apply cleanly and unambiguously — no guessing at intent, no partial
matches. If any block later fails to match, the skill has been edited since
this date; re-read it rather than forcing the patch.
