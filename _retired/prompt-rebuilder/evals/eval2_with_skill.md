**The ask** — A reusable prompt that produces blog post ideas you'd actually write, not a generic listicle. The hard part isn't asking for ideas; it's that idea quality is almost entirely a function of context the model doesn't have — your audience, your angle, what you've already published. So the prompt below is built with slots for that.

**Consumer** — You, skimming a list and picking one or two. Prose/table, not JSON.

**Out of scope** — Writing the posts, SEO keyword research, publishing schedule.

## Rebuilt prompt

> You are helping me generate blog post ideas for the blog described below. I will pick one or two to actually write, so I need ideas I can start drafting today — not broad topic areas.
>
> ```
> Blog: <what the blog is about>
> Audience: <who reads it, and what they already know — this determines whether an idea is obvious or interesting>
> My angle: <what I can say that most people writing about this can't — experience, data, contrarian view, access>
> Already published: <3-5 recent post titles, so you don't repeat them>
> Goal for these posts: <e.g. attract new readers / go deep for existing ones / support a launch>
> ```
>
> Generate 10 ideas. For each, give me:
> 1. A working title (the actual title, not a description of one)
> 2. One sentence on the specific claim or story the post makes — if you can't name the claim, the idea isn't ready, so drop it
> 3. Why this audience would click it *and* finish it
>
> Then vary them deliberately across these shapes so I'm choosing between different kinds of post, not ten flavours of the same one: personal experience or case study, contrarian take, practical how-to, analysis of something happening now, and a "here's what I got wrong" post. At least one of each.
>
> Two rules on quality:
> - Prefer specific over broad. "Why we moved off Postgres after 400k rows" beats "Choosing the right database." Specificity is what makes a post worth reading rather than skimming.
> - Skip any idea where the post could be written by someone without my angle. Those are the ones that read as filler.
>
> Finally, flag the 2 ideas you think are strongest and say why in one line each. If fewer than 10 ideas clear the bar above, give me fewer and say so — I'd rather have 6 good ones than 10 padded.

## Success criteria

- 10 ideas (or fewer, with an explicit note saying why), each with title + claim + rationale
- All five post shapes represented at least once
- No idea repeats or lightly rewords a post in "Already published"
- Every title names something specific, not a category
- Two ideas flagged as strongest, each with a stated reason

## How it gets checked

Rule check for the first three (count them, match against the shape list, compare against your published titles). The last two need your eye — "specific enough" and "actually strongest" are taste calls, and putting a number on them would launder a guess as evidence.

## Test cases

| # | Input | Pass looks like |
|---|---|---|
| 1 | A well-filled brief: niche B2B blog, clear angle, 5 recent titles | 10 ideas, five shapes covered, none overlapping the recent titles |
| 2 | Angle field left blank | It says the angle is missing and that ideas will be generic without it — rather than quietly producing ten generic ideas |
| 3 | A brief so broad it can't be worked with ("Blog: technology. Audience: everyone.") | It pushes back and asks for a narrower audience instead of generating 10 ideas nobody would click |

Cases 2 and 3 are the ones that matter — a prompt like this fails by being agreeable, not by erroring.

## Assumptions

- **You want ideas across a range, not variations on one topic.** If you have a single topic in mind and want 10 angles *on that*, tell me and I'll narrow it — it's a different prompt and mostly a simpler one.
- **You're the writer.** If this feeds a content team or a pipeline, it earns examples and stricter output structure; a one-off doesn't.

Want me to run it against your actual blog? Fill in the brief and I'll generate the first batch.
