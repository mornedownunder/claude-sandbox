---
name: prompt-rebuilder
description: Rebuild a rough, underspecified or underperforming request into a high-quality prompt, using Anthropic's prompt engineering guidance. Works out what is actually being asked and what "done" looks like, rewrites the prompt, and ships it with success criteria, test cases (including edge and failure cases) and a bounded self-correction loop — then confirms before anything executes. Use this whenever someone asks to write, improve, rewrite, tighten, debug or "make a better" prompt; whenever they hand over a prompt that is not working, produces inconsistent results, or gets ignored; whenever they are about to kick off a large or expensive run and want the instruction right first; and whenever a request is vague enough that guessing the intent would waste the work — even if they never use the word "prompt". Also use it for system prompts, agent and subagent instructions, skill bodies, and eval or grading rubrics. Not for one-off questions you can simply answer.
---

# Prompt Rebuilder

Rough asks fail for boring reasons: the goal is implied rather than stated, "done"
is never defined, and nobody wrote down how they would know it worked. Rebuilding
means fixing those three things and *then* applying technique.

Anthropic's own guidance is explicit that prompt engineering assumes you already
have success criteria, a way to test against them, and a draft. Most people have
none of the three. **Establishing them is the job here — the rewrite is the easy
part.**

## The loop

```
1 ASK      → what is actually wanted, separated from how it was phrased
2 OUTCOME  → what "done" looks like, checkable by someone else
3 REBUILD  → the prompt itself
4 VALIDATE → how the output gets checked, and against what
5 TEST     → cases it must survive, including one edge and one failure
6 CORRECT  → critique against criteria, revise, stop
7 CONFIRM  → show the rebuilt prompt and the assumptions; get sign-off
```

Work them in order. Steps 1 and 2 are where the value is; skipping to 3 produces
a nicely-formatted prompt for the wrong task.

---

## 1 · Read the ask

Separate **what they want** from **how they said it**. People describe the
solution they imagined rather than the outcome they need, so take the request at
face value first, then look for the gap.

Answer three questions before writing anything:

- **What is the real deliverable?** A summary, a decision, a working script, a
  rewritten paragraph? Name it concretely.
- **Who consumes it?** A person reading once, a downstream program parsing it, a
  reviewer checking it. This decides format more than anything else.
- **What is deliberately out of scope?** Cheap to state, and it prevents the
  single most common failure — a rebuilt prompt that quietly widens the job.

**Surface ambiguity rather than resolving it silently.** If two readings lead to
materially different work, say so in one line and state which you took. Silently
picking one is how a rebuild produces confident, wrong output.

If something is genuinely unresolvable and would make the work useless if
guessed wrong, ask. Otherwise assume, label the assumption, and keep going.

## 2 · Define the outcome

Write what "done" looks like in terms a third party could check without asking
you. Vague criteria are the reason prompts cannot be evaluated or improved.

Anthropic's framing is **SMART** — specific, measurable, achievable, relevant.
In practice, for each criterion ask: *could someone else look at the output and
agree it passed?* If not, sharpen it.

| Instead of | Write |
|---|---|
| "a good summary" | "under 200 words, covers all five findings, no new claims" |
| "clean code" | "passes the repo's linter, no function over 40 lines" |
| "professional tone" | "no exclamation marks, no second person, reads as neutral to a reviewer" |

Most real tasks need **several criteria at once** — task fidelity plus tone plus
format. Two to five is usually right. One is rarely enough; ten means you have
not decided what matters.

## 3 · Rebuild the prompt

Now apply technique. `references/techniques.md` has the full ladder with when to
use and when to skip each — read it if you are unsure which apply. The core:

- **Be clear and direct.** The golden rule from Anthropic's docs: *show the
  prompt to a colleague with minimal context and ask them to follow it. If they
  would be confused, so will Claude.* Treat that as the acceptance test for the
  rewrite.
- **Explain why, not just what.** "Never use ellipses" performs worse than "this
  will be read aloud by a text-to-speech engine, which cannot pronounce
  ellipses." Claude generalises from the reason, so a stated rationale covers
  cases your rule did not anticipate.
- **State the format and constraints** rather than hoping they are inferred.
- **Sequence the steps** with a numbered list when order or completeness matters.
- **Use examples** when format, tone or structure matter more than logic — three
  to five, wrapped in `<example>` tags, deliberately varied so no unintended
  pattern gets learned.
- **Use XML tags** when the prompt mixes instructions, context, examples and
  input, so the boundaries are unambiguous.
- **Set a role** in one sentence when the task has a clear professional frame.
- **Ask explicitly for "above and beyond"** if you want it. It is not the default
  and will not be inferred from a vague prompt.

### Right-size it

**The failure mode of this skill is turning a one-line ask into a page of
scaffolding.** A prompt is not better for being longer, and every unnecessary
constraint is another thing to conflict with the real goal.

Match the investment to the stakes: a one-off request needs a clear sentence and
maybe a format note. A prompt that will run a thousand times, cost real money, or
feed a pipeline earns examples, XML structure and a full test set.

**When the original prompt is already clear, say so and stop.** Returning "this
is fine as written, here is the one thing I would add" is a complete and correct
answer. Rebuilding for the sake of it wastes the user's time and buries the
signal.

## 4 · Build the check

State how the output will be verified — this is what makes iteration possible.
Pick the lightest method that actually discriminates:

| Method | Use when |
|---|---|
| **Exact match** | The answer is categorical: a label, a number, a chosen option |
| **Rule check** | You can write the test: it compiles, it validates, it is under N words, the schema parses |
| **Model grading** | The dimension is real but subjective: tone, empathy, clarity. Grade it on a stated scale with the scale points defined |
| **Human review** | Taste, brand voice, strategic judgement. Say so plainly rather than faking a metric |

Do not force a number onto something genuinely subjective — a fake metric is
worse than an honest "this needs your eye", because it launders a guess as
evidence.

## 5 · Write the test cases

Three is usually enough to catch real problems:

1. **A typical case** — the thing it will mostly do.
2. **An edge case** — long input, empty input, multiple topics at once, an
   ambiguous or sarcastic phrasing, a field that is missing.
3. **A failure case** — an input it *should* refuse, flag, or handle gracefully.
   This is the one people skip, and it is where prompts break in production.

For each, state the input and what a pass looks like. If the prompt will run at
volume, say that a larger held-out set is worth building and why — but do not
build one unasked.

## 6 · Correct, with a stopping condition

Critique the output against the criteria from step 2 — *not* against a general
sense of quality, which is unbounded and never converges.

Each round: name what failed and which criterion it failed, change the prompt to
address that specific gap, re-run.

**Stop when any of these is true:**
- Every criterion passes.
- Two consecutive rounds produce no improvement on a failing criterion — the
  problem is the criterion, the model, or the task, not the wording. Say which.
- Three rounds total. Beyond that you are tuning noise, and the honest move is to
  report what still fails and why.

Diminishing returns are the signal to stop, not to try harder. A rebuild that
reports "criterion 3 still fails, here is my read on why" is more useful than one
that quietly claims success.

## 7 · Confirm before executing

Present the rebuilt prompt, the criteria, the test cases, and any assumptions —
then get sign-off before running anything expensive, irreversible or long.

This is not ceremony. The whole point is to catch a misread of the ask *before*
it is multiplied across a large run.

Use the template in `assets/output-template.md`. Keep the presentation tight: the
rebuilt prompt is the deliverable, and the surrounding apparatus should be
scannable in under a minute.

If the user says "just run it", run it — the confirmation exists to serve them,
not to gate them.

---

## Common failure modes

`references/failure-modes.md` covers these in full, with the counter-prompts that
address each. In brief:

- **Overeagerness** — the model adds features, abstractions and defensive code
  that were not asked for. Counter it in the prompt, not afterwards.
- **Overthinking** — extensive exploration on a task that did not need it.
- **Verbosity** — Claude Opus 5 in particular runs long by default; ask for
  concision explicitly rather than assuming a setting will handle it.
- **Blanket defaults** — "always use X" and "if in doubt, use X" cause
  overtriggering on current models. Prefer "use X when it would help with Y".

## Worked example

**Original ask:** "write me a prompt to summarise customer feedback"

**Rebuilt:**

> **Ask** — Turn raw support tickets into something a product lead can act on.
> Not a neutral summary; a prioritised read.
> **Consumer** — A person, reading weekly. Prose, not JSON.
> **Out of scope** — Individual ticket replies; per-customer follow-up.
>
> **Prompt** — "You are summarising a week of customer support tickets for a
> product lead who will use this to decide what to fix next. Work through the
> tickets and produce: (1) the three most frequent themes, each with a count and
> one representative quote; (2) any issue mentioned fewer than three times that
> looks severe, flagged separately — rare-but-serious matters more here than
> common-but-minor; (3) anything you could not categorise. Under 300 words.
> Do not propose solutions — the reader wants the problem space, not your fixes."
>
> **Criteria** — Under 300 words · exactly three themes with counts and quotes ·
> severe-rare issues in their own section · no solutions proposed
> **Tests** — A typical week · a week with one dominant issue drowning the rest ·
> a batch containing sarcasm and a duplicate-submitted ticket
> **Assumption** — Weekly cadence. Say if it is daily; the thresholds change.

Note what carried the weight: naming the consumer, stating what *not* to do, and
explaining *why* rare-but-severe outranks common-but-minor. The formatting is
almost incidental.
