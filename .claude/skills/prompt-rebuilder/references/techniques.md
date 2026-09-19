# Technique ladder

Anthropic's recommended techniques, with when each earns its place and when it is
overhead. Sourced from *Prompting best practices* (platform.claude.com) as of
September 2026 — re-check before treating any specific claim as current.

**Order matters.** The first three fix most failing prompts. Reach further down
only when the problem is still there.

## 1. Be clear and direct

Claude responds to explicit instruction. Being specific about the desired output
improves results, and "above and beyond" behaviour has to be asked for — it will
not be inferred from a vague prompt.

The mental model from the docs: *a brilliant but new employee who lacks context
on your norms and workflows.* Competent, no background.

**Golden rule:** show the prompt to a colleague with minimal context and ask them
to follow it. If they would be confused, so will Claude.

- Be specific about output format and constraints.
- Use numbered lists for steps when order or completeness matters.

*Always applies.* If you do nothing else, do this.

## 2. Add context — explain why

Giving the motivation behind an instruction outperforms the bare instruction,
because Claude generalises from the explanation to cases the rule did not cover.

> Weak: `NEVER use ellipses`
> Strong: `Your response will be read aloud by a text-to-speech engine, so never
> use ellipses since the engine will not know how to pronounce them.`

*Always applies*, and it is the highest-leverage habit on this list. When you
catch yourself writing an all-caps MUST, you are usually missing a why.

## 3. Use examples (few-shot)

The most reliable lever on output format, tone and structure. Three to five works
best.

- **Relevant** — mirror the actual use case.
- **Diverse** — cover edge cases, and vary enough that no unintended pattern gets
  picked up. Three examples that all share an accidental trait will teach that
  trait.
- **Structured** — wrap in `<example>` tags, multiple in `<examples>`.

*Use when* format, tone or structure matter, or output must be consistent across
many runs. *Skip when* the task is pure reasoning and the shape is obvious —
examples cost tokens and can anchor the model onto their surface form.

## 4. Structure with XML tags

Tags let Claude parse a prompt that mixes instructions, context, examples and
variable input without guessing where one ends and the next begins.

- Consistent, descriptive tag names.
- Nest where there is real hierarchy — `<documents>` containing
  `<document index="n">`.

*Use when* the prompt has three or more distinct content types, or interpolates
user-supplied text (tags also make injection boundaries legible). *Skip for*
short single-purpose prompts, where tags are noise.

## 5. Give a role

One sentence in the system prompt focuses tone and behaviour.

*Use when* the task has a clear professional frame and the default register is
wrong. *Skip when* the task is mechanical — a role adds nothing to "extract these
fields as JSON" and can add unwanted flavour.

## 6. Control format and verbosity

State the format you want. For length, prompt explicitly rather than relying on a
setting: **Claude Opus 5 runs longer by default than earlier models, and changing
`effort` does not reliably change visible response length.** Claude Fable 5.1 runs
the opposite way during agentic work — it writes fewer user-facing updates, so ask
for progress text explicitly and remove any instruction telling it to be brief.

## 7. Chain prompts — the self-correction pattern

Current models handle most multi-step reasoning internally, so explicit chaining
is worth it mainly when you need to *inspect* intermediate output or enforce a
pipeline.

The one pattern that consistently pays: **generate a draft → review it against
stated criteria → refine based on the review.** Separate calls, so each step can
be logged, evaluated or branched.

This is the mechanism behind step 6 of the main loop. It works because the review
step is graded against explicit criteria — chaining a vague "make it better" pass
adds cost and drifts.

---

## Anti-patterns

| Pattern | Why it hurts | Instead |
|---|---|---|
| `ALWAYS` / `NEVER` in caps, no reason | Brittle; breaks on cases the rule did not anticipate | Give the reason and let it generalise |
| "If in doubt, use \[tool]" | Causes overtriggering on current models | "Use \[tool] when it would enhance your understanding of \[X]" |
| "Default to using \[tool]" | Blanket defaults over-fire | Targeted, conditional guidance |
| Ten constraints of equal weight | They conflict; the model picks arbitrarily | Two to five, ranked, with the trade-off stated |
| Examples that share an accidental trait | The trait gets learned as the rule | Vary deliberately along every axis but the one you are teaching |
| Padding a simple ask into a page | Buries the actual instruction | Match investment to stakes |
