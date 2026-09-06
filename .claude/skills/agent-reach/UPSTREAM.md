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

## Re-vendoring / upgrading

1. Pick the new upstream commit SHA and read its diff for `agent_reach/skill/`.
2. Copy `SKILL_en.md` to `SKILL.md` and `references/*.md` into `references/`.
3. Update the pin in this file **and** in `scripts/install-agent-reach.sh`.
4. Run `agent-reach doctor` and open a PR — the skill diff is the review.
