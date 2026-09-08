# Failure modes and counter-prompts

Behaviours seen on current Claude models, with the prompt-side fix. From
Anthropic's *Prompting best practices*, September 2026.

Address these **in the rebuilt prompt**, not by correcting after the fact —
correction costs a round trip and often does not stick.

## Overeagerness / over-engineering

Extra files, unnecessary abstractions, flexibility nobody asked for. Common in
coding tasks.

```
Avoid over-engineering. Only make changes that are directly requested or clearly
necessary. Keep solutions simple and focused:

- Scope: Don't add features, refactor code, or make "improvements" beyond what was
  asked. A bug fix doesn't need surrounding code cleaned up.
- Documentation: Don't add docstrings, comments, or type annotations to code you
  didn't change. Only comment where the logic isn't self-evident.
- Defensive coding: Don't add error handling or validation for scenarios that
  can't happen. Only validate at system boundaries.
- Abstractions: Don't create helpers for one-time operations. Don't design for
  hypothetical future requirements.
```

## Overthinking

Extensive upfront exploration on tasks that did not need it. Usually helps, but
inflates cost and latency when it does not.

```
When you're deciding how to approach a problem, choose an approach and commit to
it. Avoid revisiting decisions unless you encounter new information that directly
contradicts your reasoning. If you're weighing two approaches, pick one and see it
through. You can always course-correct later if the chosen approach fails.
```

Lowering the `effort` setting is the fallback if prompt guidance is not enough.

## Verbosity

**Claude Opus 5 runs longer than prior models by default, and `effort` does not
reliably change visible response length.** Ask for concision explicitly — do not
assume a setting covers it.

Conversely, current models may skip summaries after tool calls. If you want
visibility:

```
After completing a task that involves tool use, provide a quick summary of the
work you've done.
```

Claude Fable 5.1 needs this more than most during agentic work, and any
instruction telling it to keep updates brief should be removed.

## Blanket defaults causing overtriggering

Tools that undertriggered on older models trigger appropriately now, so
instructions written to push them fire too often.

- Replace "Default to using \[tool]" with "Use \[tool] when it would enhance your
  understanding of the problem."
- Delete "If in doubt, use \[tool]" outright.

## Test-passing and hardcoding

On coding tasks, a prompt that emphasises passing tests can produce code that
targets the tests rather than the problem. State that the goal is correct
behaviour and that the tests are evidence, not the target.

## Scratch files

Temporary files are often *good* — they act as a scratchpad and improve outcomes
in agentic coding. If you want them cleaned up, say so; do not forbid them:

```
If you create any temporary new files, scripts, or helper files for iteration,
clean up these files by removing them at the end of the task.
```
