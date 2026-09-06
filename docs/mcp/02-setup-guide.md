# Setup Guide — Five MCPs

> **Read [`03-decision.md`](03-decision.md) first.** Not all five were
> adopted: Playwright and Apify are in `.mcp.json`, Buffer is conditional and
> per-machine, Perplexity is deferred, and Higgsfield was rejected as
> duplicative. The sections below remain accurate as setup reference for
> whichever you enable.

Run these **on your own machine**, not in a remote Claude Code session. Each
needs either a browser OAuth handshake or a local subprocess, and a remote
container has neither a browser nor a lifetime.

**Prerequisites:** Node.js 18+ (`node --version`), Claude Code 2.x
(`claude --version`), and an account with each vendor you enable.

## Verification status

Everything below was checked from this session. Two items could not be
confirmed against the vendor's own page because the session's egress policy
blocks those hosts — they are corroborated by multiple independent sources
instead, and are marked. Confirm them once on your machine; `/mcp` showing
`connected` is the confirmation.

| MCP | Verified how | Confidence |
|---|---|---|
| Apify | Upstream repo `apify/apify-mcp-server` + npm registry | Primary |
| Playwright | Upstream repo `microsoft/playwright-mcp` + npm registry | Primary |
| Perplexity | Upstream repo `perplexityai/modelcontextprotocol` + npm registry | Primary |
| Higgsfield | Multiple independent sources; `higgsfield.ai` blocked from here | **Secondary** |
| Buffer | Multiple independent sources; `buffer.com` blocked from here | **Secondary** |

---

## Do it in waves

Do not enable five at once. You will not know which one broke, and the tool
list will bloat before you have felt the benefit.

- **Wave 1 — adopted, no spend:** Playwright
- **Wave 2 — adopted, costs money:** Apify (scoped)
- **Wave 3 — conditional, writes to the world:** Buffer

Perplexity (deferred) and Higgsfield (rejected) are documented below for
reference only — do not enable them without revisiting the decision record.

Verify with `/mcp` after each wave. Use the next wave only once the previous
one has actually earned its place in a real task.

---

## Wave 1

### Playwright — a real browser  *(ADOPTED)*

Microsoft's official server. Free, local, no account.

```bash
claude mcp add playwright --scope user -- \
  npx -y @playwright/mcp@0.0.80 --isolated --headless --browser chrome
```

- `--isolated` — profile in memory, nothing persisted to disk between runs.
- `--headless` — no window. Drop it while debugging so you can watch.
- Pinned to `0.0.80` (latest as of 2026-09-01). `@latest` in a shared config
  means a teammate silently gets a different tool surface than you.

Add `--allowed-origins "example.com;api.example.com"` to fence it to known
hosts. Treat that as a seatbelt, not a wall — see the security note in
`01-build-vs-connect.md`. Never combine a logged-in profile
(`--storage-state`) with navigation to pages you do not control.

Tools: `browser_navigate`, `browser_click`, `browser_type`, `browser_snapshot`,
plus tabs, network mocking, and storage. Optional capability groups behind
`--caps` (vision, pdf, devtools, network, storage, testing) — leave off until
needed.

### Perplexity — live research with citations  *(DEFERRED — reference only)*

Needs a key from <https://console.perplexity.ai>. Paid per call.

```bash
export PERPLEXITY_API_KEY="pplx-..."     # put this in your shell profile
claude mcp add perplexity --scope user \
  -e PERPLEXITY_API_KEY="$PERPLEXITY_API_KEY" \
  -- npx -y @perplexity-ai/mcp-server@1.2.1
```

Hosted alternative, no key in local config:

```bash
claude mcp add --transport http perplexity https://api.perplexity.ai/mcp
```

Tools: `perplexity_search` (ranked results), `perplexity_ask` (fast
conversational), `perplexity_research` (deep, slow, expensive),
`perplexity_reason` (analysis). Optional env: `PERPLEXITY_TIMEOUT_MS`
(default 5 min), `PERPLEXITY_BASE_URL`, `PERPLEXITY_LOG_LEVEL`.

**Cost discipline:** `perplexity_research` is the one that runs up a bill. Say
which tool you want, or you will get the deep one for a question `search`
would have answered.

---

## Wave 2

### Apify — scraping at scale  *(ADOPTED, scoped)*

OAuth, no key needed:

```bash
claude mcp add --transport http --scope project apify \
  "https://mcp.apify.com?tools=actors,docs,apify/rag-web-browser"
```

Or local, with a token from your Apify account settings:

```bash
claude mcp add apify --scope user \
  -e APIFY_TOKEN="apify_api_..." \
  -- npx -y @apify/actors-mcp-server@0.15.4
```

**The `?tools=` parameter is not optional in practice.** Apify reaches
thousands of actors; unscoped it will dominate your context window. Upstream
says plainly: *for production use, always explicitly specify the tools
parameter,* because the defaults will change under you.

Scope it to what you actually run. To add a specific scraper:

```
?tools=actors,docs,apify/rag-web-browser,apify/instagram-scraper
```

Note `https://mcp.apify.com/sse` is **removed** — streamable HTTP only. Billing
is per actor run against your Apify credits; set a spend cap in your Apify
account, not in a prompt.

### Higgsfield — image and video generation  *(REJECTED — reference only)*

> Secondary-sourced. Confirm on first connect.

```bash
claude mcp add --transport http --scope user \
  higgsfield https://mcp.higgsfield.ai/mcp
```

OAuth, no API key. Reported free tier of 150 credits/month. Exposes 30+ models
(Seedance, Kling, Soul, Nano Banana Pro, Veo, Flux and others). Video burns
credits fast — tens to hundreds per clip depending on model, duration and
resolution.

**Practice:** iterate the prompt on a cheap still image first; only render
video once the composition is right. The difference is roughly two orders of
magnitude of credits.

---

## Wave 3

### Buffer — social publishing  *(CONDITIONAL)*

> Secondary-sourced. Confirm on first connect.

```bash
claude mcp add --transport http --scope local \
  buffer https://mcp.buffer.com/mcp
```

Official, OAuth, reported as included on every plan including Free. Covers
LinkedIn, X, Instagram, Threads, Facebook, TikTok, Pinterest, YouTube,
Bluesky, Mastodon, Google Business Profile. Create and schedule posts, read
account/organisation info, save to the ideas board.

**`--scope local` is deliberate.** This is the only server here that writes to
the outside world under your name. Keep it out of `.mcp.json` so it cannot be
picked up by a session you are not watching, and out of `--scope user` so it is
not live in every project by default.

**Working rule: draft to the ideas board, never straight to the queue.** A
scheduled post is effectively irreversible — deleting it does not unsee it.
Confirm every queue action yourself.

---

## Verify

```
/mcp
```

You want each server `connected` with its tools listed. If one hangs on OAuth,
the callback did not land — you are almost certainly in a remote or headless
session. Run it locally.

```bash
claude mcp list          # what is configured, and at which scope
claude mcp remove <name> # back it out cleanly
```

## Sources

- [Apify MCP server (upstream)](https://github.com/apify/apify-mcp-server) · [docs](https://docs.apify.com/platform/integrations/mcp)
- [Playwright MCP (upstream)](https://github.com/microsoft/playwright-mcp) · [Playwright docs](https://playwright.dev/docs/getting-started-mcp)
- [Perplexity MCP (upstream)](https://github.com/perplexityai/modelcontextprotocol) · [docs](https://docs.perplexity.ai/docs/getting-started/integrations/mcp-server)
- [Higgsfield MCP](https://higgsfield.ai/mcp)
- [Buffer MCP](https://buffer.com/mcp) · [Buffer + Claude](https://buffer.com/integrations/claude)
