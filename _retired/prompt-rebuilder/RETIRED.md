# Retired — 19 September 2026

**Retired on Morné's decision.** Kept here rather than deleted: it no longer
loads (nothing under `_retired/` is read as a skill), but the reasoning and the
test outputs are worth keeping.

## Why

It substantially duplicates two skills that already existed in
`mornedownunder/cogniate-agents`:

| Existing skill | Covers |
|---|---|
| `prompt-clarify` | The contract at the open — outcome, sources of truth, constraints, output shape, done-test, at most three questions. This is steps 1–3 of the retired skill's loop. |
| `prompt-optimise` (Ahsoka) | Eval-first improvement — 5–10 cases with one-line pass criteria, baseline, structural hygiene pass, re-run, fix one failing case at a time. This is steps 5–7. |

Both are better than what replaced them, because they are integrated with the
chain and the ledger rather than standing alone.

`prompt-clarify` even opens with *"Most requests are already clear enough to act
on. The job is not to interrogate"* — which is precisely the right-sizing rule
this skill had to learn from a failed test case, already stated more plainly.

## How it happened

It was built without reading `cogniate-agents`, which the Chief of Staff rules
forbid: **"Registry first: read what already exists before producing anything."**
The repo was one `add_repo` call away and was never requested.

The same error recurred three times in the session that produced this skill:

1. **Perplexity marked "defer"** as duplicative of built-in search — judged
   against the immediate task rather than the citation-heavy work it would
   serve. Reversed after Morné pushed back.
2. **The Playwright justification overstated** — claimed
   `cogniate-course-composer` was blocked on authentication; the skill already
   drove Claude in Chrome. Narrowed after reading the file.
3. **This skill built at all** — two better versions already existed, unread.

The pattern: **reasoning about a skill from its description instead of opening
the file.** Which is, uncomfortably, the exact failure this skill's own
overlap-check rule was written to prevent.

## What is worth salvaging

If anything here is folded into the existing two, these are the candidates —
each is a judgement call for whoever owns those skills, not a recommendation:

- **The Light/Full sizing gate** (`SKILL.md`, step 2) — an explicit early
  decision about how much apparatus to produce, with a table of what each mode
  emits. Added after a test showed the rule failed when stated only as a
  caution. `prompt-clarify` achieves the same end differently.
- **Three stopping conditions for the correction loop** — including "two rounds
  without improvement means the criterion or the task is wrong, not the
  wording."
- **`references/failure-modes.md`** — current model behaviours (overeagerness,
  overthinking, Opus 5 verbosity not responding to `effort`, blanket-default
  overtriggering) with the counter-prompts, sourced and dated from
  platform.claude.com.

## Account copy — removed

It was saved to the account skills on 19 Sep and **deleted from there on 19 Sep**,
confirmed by its absence from the session skill list on the following turn. No
copy of this skill loads anywhere now: not in this repo, not in the account.

Retirement is complete. What remains here is the record.
