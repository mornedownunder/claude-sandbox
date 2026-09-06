# Upstream provenance — Agent Reach skill

This directory is **vendored** (copied) from the upstream Agent Reach project.
Do not hand-edit `SKILL.md` or `references/` — re-vendor instead (see below).

| Field | Value |
|---|---|
| Upstream repo | https://github.com/Panniantong/Agent-Reach |
| Pinned commit | `da5044d26fc6adddb6554d5679c94ac22e76e428` |
| Upstream version | `1.5.0` |
| Commit date | 2026-09-01 |
| License | MIT — see `LICENSE.upstream` |
| Source path | `agent_reach/skill/SKILL_en.md` + `agent_reach/skill/references/` |

## Why vendored rather than fetched

* The skill is reviewable in pull requests — an upstream change to agent
  instructions cannot land in this repo silently.
* Every session gets the capability with no network fetch and no
  `npx skills add` step.
* The pin above is the single source of truth, shared with
  `scripts/install-agent-reach.sh`.

## Do not install `agent-reach` from PyPI

The PyPI name `agent-reach` belongs to a **different, unrelated project**
(`jgalea/agent-reach`). Installing it will not give you this capability.
Always install from the pinned GitHub commit above, which is what
`scripts/install-agent-reach.sh` does.

## Local divergences

This vendored copy is **not** byte-for-byte upstream. A security review of
PR #2 found upstream instructions that route around this repo's own controls,
so they were changed. Each divergence is marked `LOCAL DIVERGENCE` in place.

**Re-apply every one of these after a re-vendor** — a plain copy from upstream
silently reverts them all.

| # | File | Divergence | Why |
|---|---|---|---|
| 1 | `SKILL.md` (rule 5) | Removed the paste-back update link to `docs/update.md` on `main` | An unreviewed instruction channel into this repo; upgrades go through a PR |
| 2 | `SKILL.md` ("Configure a channel") | Pinned `docs/install.md` to the audited SHA; demoted from script to reference | Upstream said "the agent does the rest" — executing a document fetched from a mutable branch |
| 3 | `references/social.md` | Dropped the auto-upgrade of twitter-cli from the search-failure retry chain | An unattended package upgrade triggered by a transient 404 |
| 4 | `references/social.md` ×2, `references/video.md` | `twitter-cli`, `rdt-cli`, `bilibili-cli` installs changed from agent-run to user-run | Unpinned third-party package names — the same supply-chain risk we guard against for `agent-reach` itself |
| 5 | `references/finance.md` | Removed `configure --from-browser chrome`; manual cookie export only | Contradicted the standing rule that the agent never reads browser cookies |
| 6 | `SKILL.md`, all `references/*.md` | Single-quoted every URL/ID placeholder | Double quotes do not stop `$(...)`, and these values come from search results |
| 7 | `references/web.md` | Added the r.jina.ai boundary (public URLs only) | Full URLs, including any embedded tokens, are sent to a third party |

Divergences 1 and 4 are enforced mechanically by `scripts/check.sh`, so CI
catches a re-vendor that reverts them. **2, 3, 5, 6 and 7 are not** — they need
a human on the re-vendor diff.

## Re-vendoring / upgrading

1. Pick the new upstream commit SHA and read its diff for `agent_reach/skill/`.
   Look specifically for: URLs pointing at `main`/`master`/`HEAD`, new package
   installs, new `--from-browser` or other credential-reading flags, and new
   command templates that interpolate a URL or ID. "Read the diff" is easy to
   satisfy without catching these.
2. Copy `SKILL_en.md` to `SKILL.md` and `references/*.md` into `references/`.
3. **Re-apply every divergence in the table above.**
4. Update the pin in this file **and** in `scripts/install-agent-reach.sh`.
5. Run `scripts/check.sh`, then `agent-reach doctor`, and open a PR — the skill
   diff is the review.
