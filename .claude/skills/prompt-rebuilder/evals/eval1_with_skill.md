Your two failures have one cause each, and both are fixable in the prompt.

- **Invented renewal dates** — "important terms" doesn't say what to do when a term is absent, so the model fills the gap rather than leaving it. The fix is a fixed field list plus an explicit "not stated" rule, and a verbatim-quote column that makes a fabricated value impossible to write without exposing itself.
- **Prose instead of a table** — "into a table" describes the shape but not the format, the columns, or where the output is going. Naming the delimiter and the exact columns removes the choice.

**The ask** — Pull a fixed set of commercial terms out of a supplier contract, with each value traceable to the clause it came from, in a form that pastes straight into a spreadsheet.
**Consumer** — A spreadsheet first, a human reviewer second. That makes strict format non-negotiable and makes a blank cell far cheaper than a wrong one.
**Out of scope** — Risk assessment, redlining, or advice on whether the terms are good. Extraction only.

## Rebuilt prompt

> You are extracting contract terms for a procurement analyst who will paste your output directly into a spreadsheet.
>
> Accuracy matters more than completeness. A blank cell costs a minute to fill in by hand; a wrong renewal date can let a contract auto-renew unnoticed. So report only what the document states — never infer, calculate, or estimate a value.
>
> `<contract>`
> {{CONTRACT_TEXT}}
> `</contract>`
>
> Extract these fields, in this order, one row each:
>
> 1. Counterparty legal name
> 2. Effective date
> 3. Initial term length
> 4. Expiry date
> 5. Renewal type (auto-renew / renew by agreement / none)
> 6. Renewal notice deadline
> 7. Termination for convenience (yes + notice period, or no)
> 8. Contract value or pricing basis
> 9. Payment terms
> 10. Liability cap
> 11. Governing law
> 12. Assignment / change-of-control restriction
>
> Rules:
>
> - If the document does not state a field, write `NOT STATED` in Value and leave Source Text empty.
> - Do not derive one field from another — do not compute an expiry date from the effective date plus the term, and do not treat a renewal period ("renews for successive 12-month periods") as a renewal date. A derived value is indistinguishable from a stated one once it is in a spreadsheet, so nobody downstream can catch it.
> - Source Text must be a verbatim quote of 25 words or fewer, copied character-for-character from the contract. If you cannot produce such a quote, the value is `NOT STATED`.
> - If two clauses conflict or the wording is genuinely ambiguous, put your best reading in Value and begin Source Text with `CONFLICT:` followed by a quote from each clause.
>
> Output format: this text is pasted straight into a spreadsheet, so output the table and nothing else — no preamble, no commentary, no summary afterwards. Pipe-delimited, one header row, then one row per field in the order above:
>
> `Field | Value | Source Text | Clause Reference`
>
> Clause Reference is the section or clause number the quote came from, or `UNNUMBERED`.

## Success criteria

1. The response begins with `Field | Value | Source Text | Clause Reference` and ends with the last data row — no prose anywhere.
2. Exactly 13 lines, 4 pipe-separated columns each, field names and order matching the list.
3. Every Source Text entry appears verbatim in the source document.
4. Every field absent from the document reads `NOT STATED` with an empty Source Text.

## How it gets checked

Criteria 1, 2 and 4 are rule checks — a five-line script over the output. Criterion 3 is also a rule check: substring-search each quote against the contract text, which is the whole reason the quote column exists. It turns "did it hallucinate" from a judgement call into a string comparison. Only the reading of ambiguous clauses needs your eye, and the CONFLICT marker tells you where to look.

## Test cases

| # | Input | Pass looks like |
|---|---|---|
| 1 | Typical 3-year MSA, auto-renews, 90-day notice | 13 rows, every value quoted, notice deadline expressed as the contract expresses it |
| 2 | Contract with no renewal clause at all | Rows 5 and 6 read `NOT STATED` with empty Source Text — not "12 months from expiry" or any date |
| 3 | Signature pages plus a pricing exhibit only | Nearly every row `NOT STATED`; no counterparty details inferred from the letterhead or file name |

Case 2 is the one that was breaking. Run it first, and run it against a contract whose answers you already know.

## Assumptions

- **The 12 fields are my guess at your spreadsheet's columns.** Replace them with your actual column headers before you use this — the field list is the part that has to match your register, and everything else works unchanged.
- **One row per field, not one row per contract.** This carries the quote and clause reference, which is what stops the fabrication. If your register is one row per contract, run this as-is and paste the Value column across; keep the extraction output as your audit trail.
- Pipe-delimited because commas appear constantly in contract values. Switch to tab if your paste target prefers it.

Confirm the field list and I can adjust it, or run it against a couple of contracts you already know the answers to before you point it at the stack.
