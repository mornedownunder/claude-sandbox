---
name: repo-hygiene
description: Audit and clean up merged branches across GitHub repos. Use when asked to tidy branches, delete merged branches, clean up a repo, or check what is safe to remove after merging pull requests. Verifies every branch is fully merged before proposing deletion and never deletes unmerged work.
---

# Repo hygiene — merged branch cleanup

Deleting a branch that only *looks* merged loses commits. This skill exists so
that never happens: it proves mergedness before it proposes anything, and it
never deletes without showing the list first.

## Step 1 — list the branches

```bash
git ls-remote --heads origin | sed 's/\t/  /'
```

## Step 2 — prove mergedness on FULL history

**This is the step that goes wrong.** `git merge-base --is-ancestor` gives a
false "not merged" on a shallow clone, because the history it needs is missing.
A `--depth 1` clone — which is what most automated checkouts produce — will lie
to you.

Always deepen first:

```bash
git fetch --depth=200 origin main -q
git fetch --depth=200 origin "$BRANCH" -q
test -f .git/shallow && echo "STILL SHALLOW — deepen further before trusting the result"
```

Then check each branch two independent ways and require both to agree:

```bash
sha=$(git ls-remote --heads origin "$BRANCH" | cut -f1)

# (a) is the tip an ancestor of main?
git merge-base --is-ancestor "$sha" origin/main && echo "ancestor: yes"

# (b) are there zero commits on the branch that main lacks?
git log --oneline "origin/main..$sha" | wc -l   # must be 0

# (c) belt and braces: does main contain the commit object?
git branch -r --contains "$sha" | grep -q 'origin/main' && echo "contained: yes"
```

A branch is safe **only** when all three agree. Anything else: leave it, and say
why.

## Step 3 — show the list, then stop

Print two groups — SAFE and KEEP (with the reason) — and wait for approval.
Never delete on your own initiative. Branch deletion is the kind of thing a
person should say yes to once, out loud.

## Step 4 — delete

### The method that works

`git push origin --delete` is frequently blocked in sandboxed environments: the
git proxy rejects ref deletion with `403` or `send-pack: unexpected disconnect`.
The REST API is the reliable path where a token is present:

```bash
curl -s -o /dev/null -w "%{http_code}\n" -X DELETE \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  "https://api.github.com/repos/OWNER/REPO/git/refs/heads/BRANCH"
```

`204` is success. Anything else, print the body and stop.

### The permission it needs

Both routes are classed as destructive git operations and will be refused by
the auto-mode classifier unless the user has allowed them. If you are blocked
with `[Git Destructive]`, do **not** hunt for a workaround — say so and point
the user at the rule below.

Add to `.claude/settings.json` (project) or `~/.claude/settings.json` (global):

```json
{
  "permissions": {
    "allow": [
      "Bash(git push origin --delete:*)",
      "Bash(curl -s -X DELETE https://api.github.com/repos/*/git/refs/heads/*)"
    ]
  }
}
```

Grant this only if you are comfortable with branch deletion running without a
prompt. It is a real loosening — merged branches are cheap to restore from
GitHub's Restore button, but the rule does not distinguish merged from not,
which is why Step 2 exists.

## Step 5 — verify

Never report success from an exit code. Re-list and confirm the branches are
actually gone:

```bash
git ls-remote --heads origin | sed 's/\t/  /'
```

## What this skill will not do

- Delete a branch that fails any of the three merge checks
- Delete `main`, `master`, or the repository's default branch
- Force-push, rewrite history, or delete tags
- Touch a branch with an open pull request against it

## Worth saying to the user

Merged branches are untidy, not harmful. They cost nothing and affect no deploy.
If cleanup is turning into a fight with permissions, the honest advice is to
leave them and spend the time elsewhere.
