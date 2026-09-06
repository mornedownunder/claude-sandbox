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

### 3. Perplexity — **DEFER**

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

**Decision.** Defer. Not because it is bad — because it is the one most
duplicated by what we already have, and paying per call to duplicate a free
built-in is the exact mistake the source post warns against.

**Revisit if:** we start doing research work primarily in remote sessions and
keep hitting the egress wall; or a research task genuinely needs
`perplexity_research`-grade depth on a recurring basis.

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
| **Perplexity** | Cited live research | **DEFER** | Largely duplicated by built-in WebSearch/WebFetch. Real value only in egress-restricted sessions. |
| **Higgsfield** | Image/video generation | **SKIP** | Near-total overlap with ElevenLabs + `elevenlabs-image-video`. Second credit pool for a handful of models. |

**Net: two servers in `.mcp.json`, one added per-machine, two not added.**

Which is the finding. Five tools were presented as a set; against this
particular stack, two-and-a-half of them earn their place. The discipline that
produced that answer — check overlap before capability, and price the cost of
carry — is more reusable than any of the five.

## Open questions

1. **Does Cogniate run an organic social calendar?** Decides Buffer.
2. **How much research work happens in remote/sandboxed sessions?** If it
   becomes the norm, Perplexity moves from Defer to Add.
