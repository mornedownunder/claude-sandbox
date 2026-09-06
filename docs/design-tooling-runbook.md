# Runbook — installing the design stack, step by step

Follow this in the real front-end repo, not in a sandbox. Each step has a verification.
Do not move to the next step until the current one is verified.

---

## Step 0 — Understand scope before you install anything

Two places things can land:

| Scope | Location | Applies to | Commits to git? |
|---|---|---|---|
| Project | `.claude/` in the repo | This repo only | Yes — the team gets it too |
| User | `~/.claude/` in your home dir | Every project on this machine | No — yours alone |

**Rule of thumb:** rules about *this product's code* go in project scope. Tools about
*how you work* go in user scope.

So: design skills → project. Browser automation → user.

Why it matters: put a design skill in user scope and it starts giving opinions on unrelated
projects. Put it in project scope and it commits, so your team and every future Claude session
on this repo inherit the same rules. That second property is the whole point.

---

## Step 1 — Capture a baseline FIRST

**Do not skip this.** It is the step everyone skips and the reason nobody can tell whether
their plugins helped.

Before installing anything, ask Claude to build one representative component — a lesson card,
a pricing table, a course hero section. Save the output:

```bash
mkdir -p docs/design-baseline
# save the generated component + a screenshot into that folder
git add docs/design-baseline && git commit -m "Capture pre-plugin design baseline"
```

**Why:** every one of these tools claims it improves output. Without a control you are
judging on vibes, and vibes will tell you the newest thing you installed is working.
With a baseline you can answer "did this help?" with evidence.

**Verify:** you have a committed before-state you can point at.

---

## Step 2 — Install the audit layer

```bash
npx skills add vercel-labs/agent-skills
```

**Verify — three checks, in order:**

1. The directory exists and has content:
   ```bash
   ls .claude/skills/
   cat .claude/skills/web-design-guidelines/SKILL.md | head -20
   ```
2. Claude can see it. In a fresh Claude Code session, run `/help` or ask
   "what skills do you have available for design review?" — `web-design-guidelines`
   should be listed.
3. **The network dependency works.** This skill fetches its rulebook live on every run:
   ```bash
   curl -sI https://raw.githubusercontent.com/vercel-labs/web-interface-guidelines/main/command.md | head -1
   ```
   Expect `HTTP/2 200`. If this is blocked, the skill degrades silently — it will still
   run and still produce output, just without the current rules. That is the worst
   failure mode there is, so confirm it now.

---

## Step 3 — Run the first audit against the baseline

```
Review docs/design-baseline/ against the web design guidelines.
```

**Verify:** you get findings in `file:line` format. Read them. Ask yourself whether they
are real problems. If every finding is trivial or wrong, the tool is not earning its context
and you should say so rather than keeping it out of politeness.

**This is the moment to judge the whole exercise.** If the audit finds genuine accessibility
and UX problems in your existing UI, the stack is worth building. If not, stop here.

---

## Step 4 — Move the audit into a subagent

Create `.claude/agents/design-reviewer.md` (contents in the repo alongside this runbook).

**Verify:**
```
/agents
```
`design-reviewer` should be listed. Then trigger it:
```
Use the design-reviewer agent to review src/components/
```

**Verify it actually isolated:** the findings come back as a summary, and your main
conversation did not fill up with 100+ guideline rules. That is the whole benefit.

---

## Step 5 — Browser inspection

```bash
claude mcp add chrome-devtools npx chrome-devtools-mcp@latest
```

**Verify — do not trust the install message:**
```
/mcp
```
`chrome-devtools` should show as connected. Then prove it end to end:
```
Open http://localhost:3000 and take a screenshot.
```

An MCP server that registers but cannot reach a browser is the classic silent failure.
A returned screenshot is the only proof that counts.

---

## Step 6 — Taste Skill, only if still needed

Use the stack for a week first. Then ask: does the output still look generic?

If yes:
```bash
npx skills add https://github.com/Leonxlnx/taste-skill --skill "image-to-code"
npx skills add https://github.com/Leonxlnx/taste-skill --skill "design-taste-frontend-v1"
```

**Verify:** rebuild the same component from Step 1. Put it next to the baseline.
If you cannot see a difference, remove it — `rm -rf .claude/skills/design-taste-frontend-v1`.

**Two skills, not thirteen.** The bundle ships competing aesthetic instructions and loading
them together makes output worse.

---

## Step 7 — Record what you did

Update `docs/design-tooling.md` with what is actually installed, at what version, and why.
Commit. Six weeks from now something will conflict and you will need this.

---

## The rule that governs all of it

**One tool at a time, with a verification between each.**

If you install four things on Tuesday and your UI is better on Friday, you have learned
nothing — you cannot attribute the change, cannot remove what is not helping, and cannot
debug it when it conflicts. Installing slowly is not caution. It is the only way to end up
with a stack you understand.
