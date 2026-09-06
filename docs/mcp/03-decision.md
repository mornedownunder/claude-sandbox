# Decision Record — Which of the Five to Add

**Date:** 2026-09-06 · **Status:** decided, pending two confirmations from Morné

The objective was not "install five MCPs." It was: **work out what each of
these five actually does, and decide — against the stack we already run —
which of them earn a place.**

Verdict up front: **two in, one in scoped, one deferred, one out.**

---

## Method

An MCP earns a place only if it clears three bars:

1. **Capability gap** — it does something the current stack genuinely cannot.
2. **Marginal value** — the gap is one we actually hit in real work.
3. **Cost of carry** — tool-list weight, a new credit pool, a new failure mode
   and a new thing to keep current are all recurring costs, not one-off ones.

Bar 3 is the one people skip. Every connected server injects its tool
definitions on every turn, and a model choosing among 200 tools chooses worse
than one choosing among 20. **An MCP that duplicates an existing capability is
not neutral — it is a net negative.**

## The stack we are measuring against

22 connectors — Airtable, Apollo.io, Canva, Carta, Daloopa, ElevenLabs,
Fellow.ai, Figma, Gmail, Google Calendar, Google Drive, HubSpot, Intercom,
Invideo, Jam, Linear, Luma, Notion, Peec AI, Sendspark, Sentry, Slack — plus
Claude Code's built-in `WebSearch` and `WebFetch`, and the skills library
(`elevenlabs-image-video`, `cogniate-course-composer`,
`website-component-analyzer`, `cogniate-daily-outbound`, and others).

---

## The five

### 1. Apify — **ADD, tightly scoped**

**Function.** A cloud platform of pre-built scrapers ("Actors") — several
thousand of them, for social platforms, search engines, maps, e-commerce,
reviews. Apify runs them on their infrastructure with rotating proxies and
anti-bot handling, and returns structured datasets. Billed per run against
Apify credits. Asynchronous and built for volume.

**Gap it fills.** Structured harvesting at scale from sites that actively
resist it. Nothing in the stack does this. `WebFetch` reads one page as
markdown; it has no proxy rotation and no anti-bot handling.

**Overlap.** Partial, with **Apollo.io** — but on a different axis than it
first appears. Apollo already supplies B2B firmographic and contact data,
job postings and website-visitor tracking. That covers the *lead-data* use
case. Apify's non-duplicative value is **competitor and market content**:
what competitors published, course-marketplace listings, review and social
sentiment. That is a real gap for course-market research and competitive
positioning.

**Decision.** Add — but scope it hard. `?tools=` is mandatory in practice;
unscoped, thousands of actors flood the context window, and upstream states
that the defaults will change without notice. **Do not use it for lead
generation.** Apollo owns that, is already paid for, and is better at it.
Set a spend cap in the Apify account.

### 2. Playwright — **ADD. The strongest of the five.**

**Function.** Microsoft's official server. Gives Claude a real browser it can
drive — navigate, click, type, read the accessibility tree, screenshot,
manage tabs, intercept network. Local, free, no account.

**Gap it fills.** Two, and both are workflows we already run and are already
losing on:

- **`cogniate-course-composer` has a harvest phase** that reads external
  courses on Circle, Teachable and Kajabi. Those are **login-gated**.
  `WebFetch` cannot authenticate, so the harvest is either manual or
  incomplete — and the skill itself says content quality depends on
  harvesting the real source material. Playwright can log in and read.
- **`website-component-analyzer` calls `web_fetch` for full site HTML.** That
  returns the pre-render shell on any JS-driven site — which is most modern
  marketing sites, i.e. exactly the ones worth deconstructing. Playwright
  reads the rendered DOM.

Third, unprompted by the source post but arguably the biggest: **end-to-end
testing of the Cogniate platform itself.** We ship a product. This drives it.

**Overlap.** None. Jam records a screen; it does not automate one.

**Decision.** Add, pinned and isolated. **Caveat that matters:** upstream
states plainly that Playwright MCP is *not a security boundary* — it is
RCE-equivalent against untrusted pages via `browser_run_code_unsafe`, and
`--allowed-origins` is a convenience, not a wall. Never point it at a page we
do not control while it holds a logged-in profile. Harvesting a course we pay
for: fine. Crawling the open web: use Apify.

### 3. Perplexity — **ADD** *(revised 2026-09-06 — was DEFER)*

**Function.** Wraps Perplexity's Sonar and Agent APIs: `perplexity_search`
(ranked results), `perplexity_ask` (fast conversational), `perplexity_reason`
(analysis), `perplexity_research` (deep, slow, expensive). Cited answers.
Paid per call.

**Gap it fills.** In local Claude Code, close to none. **Built-in `WebSearch`
and `WebFetch` already do live research with sources** — this document was
researched with them, and every package version and endpoint in the setup
guide was verified that way. `perplexity_research` is genuinely deeper than a
manual search-and-fetch loop, but that is a difference of degree.

**Overlap.** Substantial, with built-in tooling. Partial with **Peec AI** on
the brand-visibility side.

**The one real argument for it.** In *remote or sandboxed* sessions, `WebFetch`
is subject to an egress policy. During this work, `docs.apify.com`,
`buffer.com` and `higgsfield.ai` all returned 403 at the proxy — three of five
vendor pages unreachable, which is why two rows in the setup guide are marked
secondary-sourced. Perplexity fetches server-side, so it routes around that
entirely.

**Decision — REVISED to ADD.**

The original Defer was a bad call, and the reasoning error is worth recording
because it is a generalisable one: **the tool was evaluated against the task in
front of it rather than against the portfolio of work it would actually
serve.** Looking up MCP setup docs is not citation-critical, so the built-ins
looked sufficient. That is not representative of what we do.

The skills library is unusually citation-heavy, and several skills are built
around *formal source hierarchies*:

- **`lead-source-evaluator`** — its entire job is verifying behavioural
  science claims and citation quality for the LEAD book. It defines a source
  tier table (peer-reviewed journals as high-confidence primary support).
- **`course-content-architect`** — runs a Tier 1/2/3 source hierarchy
  (Tier 1 = peer-reviewed academic, original research) and executes it on
  `web_search` / `web_fetch` today.
- **`cogniate-patent-drafter`** — prior art across USPTO, Google Scholar,
  IEEE, ACM. A missed reference here is materially expensive.
- **`deal-room-researcher` / `deal-room-evaluator`** — "Primary Sources (Must
  Cite)", verification of citation accuracy, APA reference lists in investor
  documents.

Against *that*, the difference is not cosmetic. Built-in `WebSearch` returns
ranked results and a summary — attribution is at the level of "these pages were
consulted." Perplexity's Sonar returns **claim-level citations**, and it is a
**genuinely independent retrieval index**. Two independent indexes is
triangulation, not redundancy — which is exactly what a source-tier framework
needs and cannot get from one index alone.

The egress argument also turned out not to be hypothetical: the session that
produced this analysis *was* a remote one, and three of five vendor pages were
blocked at the proxy.

**Usage rule (this is what keeps it from being waste):**

- Ordinary lookups, package versions, docs → **built-in `WebSearch`/`WebFetch`**.
  Free, and sufficient. Do not reach for Perplexity by reflex.
- A claim heading into something that gets audited — a patent filing, an
  investor document, a published book, course content → **Perplexity**, for
  claim-level attribution and a second index.
- `perplexity_search` by default. `perplexity_research` only when the depth is
  genuinely warranted; it is the expensive one.

**Caveat that still stands.** Perplexity is a *finder*, not an authority. It
does not remove the obligation to verify at primary source — least of all for
patent prior art, where the citation must be confirmed at USPTO or Google
Patents directly. It shortens the path to the source; it is not the source.

**Scope note.** Declared in this repo's `.mcp.json` as the reference
implementation. In practice this is a tool that follows the person rather than
the project — across books, patents, deal rooms and courses — so
`--scope user` is the more honest home for it in day-to-day work.

### 4. Higgsfield — **SKIP**

**Function.** Hosted, OAuth'd endpoint fronting 30+ image and video generation
models — Seedance, Kling, Soul, Nano Banana Pro, Veo, Flux. Reported free tier
of 150 credits/month; video burns tens to hundreds of credits per clip.

**Gap it fills.** **None that is open.**

**Overlap.** Near-total, and this is decisive. The **ElevenLabs** connector is
already live with `creative_generate_image`, `creative_generate_video`,
`creative_edit_image`, lipsync and upscale — and there is already a dedicated
`elevenlabs-image-video` skill that covers roughly 60 models by name,
including Nano Banana, Veo, Sora, Kling, Seedance, Runway, FLUX, LTX, Wan,
Topaz, OmniHuman and HeyGen. That is the *same model families* Higgsfield
fronts. On top of that: **Invideo**, **Canva** and **Figma** are connected, and
`canvas-design` exists for static work.

Higgsfield is not identical — it will carry a model or two ElevenLabs does
not. But the marginal gain is a handful of models, and the cost is a second
credit pool, a second mental model, a duplicate tool surface in every turn,
and a second thing to keep current.

**Decision.** Skip. **This is the row that proves the thesis.** "The point
isn't to install every MCP you can find" — Higgsfield is the one that looks
most exciting in the post and adds least to *this* stack. If ElevenLabs ever
falls short on a specific named model we need, revisit then, with that model
as the reason.

### 5. Buffer — **ADD, conditionally**

**Function.** Official, hosted, OAuth. Creates and schedules posts across
LinkedIn, X, Instagram, Threads, Facebook, TikTok, Pinterest, YouTube,
Bluesky, Mastodon and Google Business Profile; reads account info; saves to
the ideas board. Reported as included on every plan, including Free.

**Gap it fills.** Total, if we publish organically. There is **no social
scheduler in the stack.** Slack is internal. Apollo sends outbound email.
Sendspark does video outreach. Nothing queues a LinkedIn post.

**Overlap.** None.

**Decision.** Add — **conditional on one fact only Morné can supply: does
Cogniate run an organic social calendar?**

- **Yes** → add it. It closes the loop: Apify or Playwright researches,
  Claude drafts, ElevenLabs makes the asset, Buffer queues it. That is the
  whole objective in one chain, and it is the only one of the five that
  completes it.
- **No** → skip. A publishing tool with nothing to publish is pure carry cost.

**Guardrail, non-negotiable.** This is the only one of the five that writes to
the outside world under our name, and a scheduled post is effectively
irreversible — deleting it does not unsee it. Therefore: `--scope local`
only, **never in `.mcp.json`**, never live in an autonomous or headless
session, and drafts go to the **ideas board**, not the queue, with a human
confirming every publish.

---

## Summary

| MCP | Function | Verdict | Reason |
|---|---|---|---|
| **Playwright** | Real browser control | **ADD** | No overlap. Unblocks course harvesting and component analysis today; tests our own product. |
| **Apify** | Scraping at scale | **ADD, scoped** | Real gap for competitor/market content. Not for leads — Apollo owns that. |
| **Buffer** | Social publishing | **ADD if we post** | Clean gap, completes the chain. Needs confirmation. Local scope, human-gated. |
| **Perplexity** | Cited live research | **ADD** *(revised)* | Claim-level citations + an independent second index. The skills library runs formal source-tier frameworks; one index cannot triangulate. |
| **Higgsfield** | Image/video generation | **SKIP** | Near-total overlap with ElevenLabs + `elevenlabs-image-video`. Second credit pool for a handful of models. |

**Net: three servers in `.mcp.json`, one added per-machine when needed, one
not added.**

Which is the finding. Five tools were presented as a set; against this
particular stack, two-and-a-half of them earn their place. The discipline that
produced that answer — check overlap before capability, and price the cost of
carry — is more reusable than any of the five.

## Open questions — resolved 2026-09-06

1. **Does Cogniate run an organic social calendar?** *Unknown.* Resolution:
   **do not add Buffer yet.** It is free, and adding it later is a single
   command — so there is no cost to waiting and a real carry cost to holding a
   publishing tool with nothing to publish. Add it the day there is a post to
   schedule.
2. **How much research work happens in remote sessions?** *Answered by
   observation* — this work was done in one. Folded into the Perplexity
   revision above; it is no longer load-bearing on its own.

## Amendment log

- **2026-09-06 — Perplexity: DEFER → ADD.** Original call weighed it against
  the immediate task instead of the citation-critical portfolio it would serve
  (`lead-source-evaluator`, `course-content-architect`,
  `cogniate-patent-drafter`, the deal-room skills). Raised by Morné, who
  valued it specifically for source trustworthiness. He was right.
