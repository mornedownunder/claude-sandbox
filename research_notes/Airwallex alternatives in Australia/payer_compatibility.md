# Payer compatibility: how Airbnb and royalty payers pay Australian recipients (as of November 2026)

*Research notes. Compiled 15 November 2026. Method caveat for the report writer: in this session WebFetch could not reach airbnb.com.au or kdp.amazon.com (the hosts are outside the session's allowed network domains), the Perplexity MCP tool returned a network error, and reddit.com is not accessible to the search tool. Every finding below therefore comes from WebSearch results: search-engine snippets and short excerpts from the cited pages, not full reads of those pages. Quoted fragments are as they appeared in those excerpts. Verify the high-stakes items (the KDP PSP list, Airbnb's Australian payout methods) on the live pages before relying on them. "Undated" means the search result showed no publication date. Items older than about 12 months are labelled "possibly outdated". Sections 7–10 (Hostaway, other booking channels, upsell tools, Stripe Australia, Xero) were added after the coordinator widened the scope, and were researched the same way.*

## 1. Airbnb host payouts in Australia: methods, timing, currency, and reports of problems with non-bank accounts

### Takeaway
Airbnb's official material lists bank account, Fast Pay, international transfer, Payoneer prepaid Mastercard, PayPal and Western Union as payout methods, with availability "depending on your country". Payout currency is fixed by the country and method chosen when the payout method was added. Australian hosts normally receive AUD to an Australian bank account (a BSB and account number). I found no official statement and no credible report that Airbnb rejects AUD payouts to Wise, Airwallex or Revolut account details, but I also found no official confirmation that it accepts them.

### Cited Findings
- **Methods listed:** bank account, Fast Pay, international transfer, Payoneer prepaid Mastercard, PayPal and Western Union. Available methods depend on country. — [Airbnb Resource Centre (AU), "How you'll get paid for hosting"](https://www.airbnb.com.au/resources/hosting-homes/a/how-youll-get-paid-for-hosting-20) (undated; the search tool reported it was indexed about 500 days ago, so possibly outdated, roughly mid-2025)
- **Stated delivery times once Airbnb releases a payout:**

  | Method | Time |
  |---|---|
  | Fast Pay | 30 minutes or less |
  | Payoneer prepaid Mastercard | 24 hours or less |
  | PayPal | 1 business day |
  | Western Union | 1 business day (varies by country) |
  | Bank transfer | 3–5 business days |
  | International transfer | 3–7 business days |

  — [Airbnb Resource Centre (AU)](https://www.airbnb.com.au/resources/hosting-homes/a/how-youll-get-paid-for-hosting-20) (same date caveat)
- **Fast Pay may be US-only**, so it may not be available in Australia. — third-party claim summarised in search results; see [Houst blog](https://www.houst.com/blog/airbnb-hosting-fees-australia) / [SmartOrder blog](https://www.smartorder.ai/resources/blog/how-do-hosts-get-airbnb-payout/) [unverified]
- **PayPal and Payoneer appear only where supported:** "If PayPal appears as an option for your selected country, you'll be able to connect your existing PayPal account as a payout method". The same applies to Payoneer. — Airbnb Help Centre, payouts topic ([airbnb.com.au/help/topic/1513](https://www.airbnb.com.au/help/topic/1513)). Search excerpt only; the specific article was not confirmed. Whether PayPal or Payoneer is currently offered to Australian hosts was **not confirmed** [unverified].
- **Payoneer details:** the prepaid Mastercard must be approved before it can receive payouts, and its daily limit is USD 50,000. Fast Pay and Payoneer payouts can be processed on weekends and holidays. **International transfer:** "if international money transfer is available for your country or region, it'll be shown as an option". It usually needs an account number or IBAN, fees may apply, and setup can take up to 2 business days. — Airbnb help pages returned by search ([airbnb.com/help/topic/1513/payouts](https://airbnb.com/help/topic/1513/payouts), [airbnb.com.au/help/article/1342](https://airbnb.com.au/help/article/1342/how-do-i-set-up-a-payout-method)). Excerpts only; the search tool reported the AU pages as indexed about 500 to 2,500 days ago, so possibly outdated.
- **Payout currency:** "the currency you're paid in is based on the country and method you selected when you first added your payout method". It cannot be changed once added, but you can add a new payout method in a different currency at any time. — [Airbnb Help article 1516](https://www.airbnb.com/help/article/1516) (undated)
- **Currency limits:** available currencies "may be limited for regulatory or operational reasons based on factors such as your selected Payout Method, your country of residence, and/or your Airbnb contracting entity(ies)". — Airbnb Host/Payments Terms, quoted in search results with [Airbnb Help article 1516](https://www.airbnb.com/help/article/1516) (exact terms page not pinned) [unverified attribution]
- **Western Union** payouts are sent in USD, and Western Union sets the rate to local currency. The minimum payout amount is set in USD, but this does not change the payout currency. — [Airbnb Help](https://www.airbnb.com/help/article/1516) and related help results (undated)
- **Australian hosts are usually paid in AUD:** hosts are told to check Account > Payout preferences and confirm payouts go "to an Australian bank account in AUD". Changing the display currency does not change the payout currency. — [MadeComfy blog (AU property manager)](https://blog.madecomfy.com.au/blog/how-to-change-airbnb-currency-on-web-iphone-and-android) (undated, third party)
- **FX spread when listing and payout currencies differ:** about 3% below mid-market. These are blog estimates, not Airbnb disclosures. — [RentTools](https://renttools.io/blog/airbnb-payout-currency-conversion-fee); [Hometime](https://www.hometime.io/blog/airbnb-currency-conversion-fees) [unverified]
- **Returned payouts:** under Airbnb Payments' Australian terms, Airbnb emails the host when it starts each payout and again "if the Payout is returned to us because of an error". — [Airbnb Payments Terms of Service for Australian Users, June 2024 (PDF)](https://assets.airbnb.com/help/Payments_Terms_of_Service_for_Australian_Users_-_English_June_2024.pdf?disposition=inline) (dated June 2024, so possibly outdated)
- **Wise (vendor guidance):** add your Wise account details "to your Airbnb payment preferences using the appropriate country and currency information". — [Wise US blog](https://wise.com/us/blog/how-do-airbnb-payments-work) (vendor content). Third-party guide on using TransferWise (now Wise) for Airbnb payouts with a Wise AUD BSB and account number: [airbnbase.com](https://airbnbase.com/transferwise/) (undated, anecdotal)
- **Revolut:** the claim that "Revolut offers direct integrations with Amazon, Airbnb and other major marketplaces" appears only in a competitor's (Wise's) article. — [Wise AU: Revolut vs Wise](https://wise.com/au/blog/revolut-wise-transferwise-australia) [unverified]
- **Reported problems (general, not specific to any provider):** a forum thread from some years ago describes Australian hosts whose payouts stopped and whose payout methods were flagged with errors. Airbnb support reportedly called it a known Australian issue with no fix yet. — [AirHostsForum, "Payout problems for Australia"](https://airhostsforum.com/t/payout-problems-for-australia/27380) (several years old, possibly outdated; anecdotal). A community post says new hosts' payouts may be withheld for up to 30 days after the first confirmed reservation. — [Airbnb Community Center](https://community.withairbnb.com/t5/Help-with-your-business/New-host-and-missing-payout/m-p/2070451) (anecdotal) [unverified as policy]

### Inferences
- An Australian host's realistic default is AUD paid by bank transfer to a BSB and account number. A Wise or Airwallex AUD account has a BSB and account number, so it can technically be entered. Airbnb publishes no list of allowed or blocked institutions, so acceptance is "unclear" rather than "yes".
- Because payout currency is fixed per payout method, an Australian listing priced and paid in AUD has no FX step if payouts go to AUD. Using a foreign-currency payout (for example USD by international transfer, if it is offered) would add Airbnb's own conversion spread. For an AUD-priced Australian listing, an AUD payout to a traditional Australian bank is the lowest-FX and lowest-hold-risk route.

### Gaps
- I could not fetch the live Airbnb AU payout-method page to confirm which of PayPal, Payoneer, international transfer and Western Union are offered to Australian hosts in November 2026.
- I found no reports, official or credible, of Airbnb payouts to Airwallex, Wise or Revolut accounts being rejected, returned or held. Reddit, where such reports usually appear, was not accessible. This is absence of evidence, not evidence that it never happens.
- I found nothing on whether Airbnb can pay an Australian host in USD, GBP or EUR to a foreign-currency account.

## 2. Amazon KDP: paying authors with Australian accounts; AUD EFT, foreign marketplace royalties, and Wise/Airwallex/Revolut local receiving accounts

### Takeaway
An Australian bank account can receive KDP royalties by direct deposit (EFT) in **AUD for every marketplace**, with Amazon converting the foreign-currency royalties. Since **1 August 2026**, KDP accepts a payment service provider (PSP) account only if that provider is on its **Payment Service Provider Program list** and its KYC (identity) checks are complete. The KDP help page lists **Airwallex, Payoneer, Wise**, WorldFirst, PingPong, Aspire and Razorpay, among others. Revolut did not appear in the excerpts I saw. Accounts opened directly with a deposit-taking bank are unaffected.

### Cited Findings
- **PSP Program rule:** "Starting August 1, 2026, all publishers who use a Payment Service Provider (PSP) as a bank account must use a participating PSP". Affected publishers were emailed from 15 June 2026. Those who did not update by 1 August 2026 could have royalty payments and publishing ability placed on hold. — [KDP Help: Payment Service Provider Program Updates](https://kdp.amazon.com/en_US/help/topic/G6GLVRHVQZY4V4FX); [KDP Help: PSP Program FAQ](https://kdp.amazon.com/en_US/help/topic/GD9NN4LS8ZDU8XZ7); [KDP Community: PSP Program Update for KDP](https://www.kdpcommunity.com/s/article/Payment-Service-Provider-Program-Update-for-KDP?language=en_US&forum=undefined) (2026, current)
- **Participating PSPs** named in the help page excerpt: Airwallex, Aspire, Payoneer, Wise, WorldFirst, PingPong, Razorpay, Zyla, plus several Chinese banks (Bank of Hangzhou, Bank of Ningbo, China CITIC Bank and Zhejiang banks). — [KDP Help: PSP Program Updates](https://kdp.amazon.com/en_US/help/topic/G6GLVRHVQZY4V4FX) (search excerpt; check the live list). KDP also has a separate page, [PSP Program Risk Management Controls](https://kdp.amazon.com/en_US/help/topic/GH8VNBUJQCM55DM3) (its content was not seen).
- **Deposit-taking banks are exempt:** "If you use a participating PSP or an account which you opened directly with a deposit-taking bank (such as HSBC, First National Bank, Bank of America), no action is required". Personal and business accounts both qualify. — [KDP PSP Program FAQ](https://kdp.amazon.com/en_US/help/topic/GD9NN4LS8ZDU8XZ7) (2026)
- **No published bank list:** KDP reportedly told one user it was "unable to provide a direct list of all qualifying institutions". Eligibility is described as being judged by whether you can deposit cash at a branch or ATM. — [KDP Community thread "Banks for KDP Royalty Payments, Particularly Chase Bank"](https://www.kdpcommunity.com/s/question/0D5at00000qVT1kCAG/banks-for-kdp-royalty-payments-particularly-chase-bank?language=en_US) (anecdotal)
- **Conflict on Payoneer:** a KDP Community post claims "Amazon KDP Removes Payoneer from the PSP List Without an Announcement". — [KDP Community](https://www.kdpcommunity.com/s/question/0D5at00000aly5yCAA/amazon-kdp-removes-payoneer-from-the-psp-list-without-an-announcement-if-you-use-payoneer-act-now?language=en_US) (the search tool dated it about 326 days old, roughly late 2025, so possibly outdated). This is contradicted by the current KDP help excerpt and by 2026 blogs that list Payoneer and Wise as participating "as of September 2026". — [book-business-kdp-amazon.com](https://book-business-kdp-amazon.com/en/blog/amazon-kdp-for-non-us-authors/) (2026 blog, third party)
- **AUD to an Australian bank for every marketplace:** KDP's payment options table for **bank location Australia** shows AUD direct deposit for Amazon.com, .co.uk, .de and the other EU stores, .ca, .co.jp, .in and .com.au. Check payments show as N/A for Australian bank accounts. The scraped table had inconsistent rows (for example a USD row for .com.au), likely scraping artefacts. — [KDP Help: KDP Payment Options (topic G201365170)](https://kdp.amazon.com/help?topicId=G201365170); see also [KDP Payment Options (GJD7DFFX6X88AK46)](https://kdp.amazon.com/en_US/help/topic/GJD7DFFX6X88AK46) and [Countries w/ EFT](https://kdp.amazon.com/help?topicId=G201208420) (undated; verify live)
- **Payment currency follows the bank's location.** KDP pays royalties in the default currency of the bank account's location, and that default cannot be changed. You can, however, use a bank account in another location to receive that location's currency. — [KDP Community "Guidance towards payments from every market place"](https://www.kdpcommunity.com/s/question/0D5f400001ASrJTCA1/guidance-towards-payments-from-every-market-place?language=en_US) (older community post); consistent with [KDP Payment Options](https://kdp.amazon.com/en_US/help/topic/GJD7DFFX6X88AK46)
- **Amazon's conversion:** "In countries where royalties are paid in a currency other than the Sale Currency, Amazon will convert the royalties due … at an exchange rate determined by Amazon … This converted amount will be inclusive of all fees associated with the conversion". Where EFT is available in the sale currency, choosing it means royalties are paid "directly in that currency, with no conversion". — KDP help or terms text in search excerpts returned with [KDP Help: When will I get paid?](https://kdp.amazon.com/en_US/help/topic/GK2MKZUL6U3SFBPZ) (exact page not pinned) [unverified attribution]. The size of Amazon's FX margin is not disclosed in anything found.
- **EFT has no minimum threshold:** — [KDP Community article "Faster Royalty Payments With No Minimum Threshold"](https://www.kdpcommunity.com/s/article/KDPA1308?language=en_US) (undated). Checks reportedly need $100 / £100 / €100 per marketplace. — third-party guides in the [KDP royalties search results](https://bestwriting.com/kdp-royalties) [unverified]
- **Wise route (vendor):** Wise Australia offers local account details in about 10 currencies, including USD. Its guide walks through entering them in KDP and advises **ACH (direct deposit), not wire**, because Wise charges a flat fee on incoming USD wires. — [Wise AU blog: Receive payment from Amazon KDP in Australia](https://wise.com/au/blog/receive-payment-kindle-kdp-wise) (vendor; undated)
- **Account holder name** in KDP must match the name on the bank account. — [KDP Help: Troubleshoot Payment Issues](https://kdp.amazon.com/en_US/help/topic/G4EQZQ73RYEX8RQQ) / [Troubleshooting common bank account errors](https://kdp.amazon.com/en_US/help/topic/GPBBHHZKD3M87U5E) (undated)
- **Author reports (anecdotal):** an Australian author reports "Aussie sales are paid direct to my Australian bank account, but sales from all other markets, including US sales, are paid to my Payoneer account". — [KDP Community "Alternatives to using Payoneer"](https://kdpcommunity.com/s/question/0D5at00000FigmaCAB/alternatives-to-using-payoneer?language=en_US) (about a year old). Further Australian author threads: [why can't I get my payments via Payoneer? how do Australian authors manage?](https://www.kdpcommunity.com/s/question/0D5f400000FHxUKCA1/why-cant-i-get-my-payments-via-payoneer-how-do-australian-authors-manage?language=en_US); [URGENT… I live in Sydney, Australia](https://kdpcommunity.com/s/question/0D58V00008j09JXSAY/urgent-need-of-advice-how-can-i-receive-payments-i-live-in-sydney-australia?language=en_US) (older). Author guides to receiving Amazon, Apple and Kobo royalties with Wise: [Nicole C. W. blog](https://www.nicolecw.com/self-publishing/wise-how-to-receive-amazon-apple-kobo-royalties/), [Raven's Riches](https://www.ravensriches.com/wiseforamazon.html), [Goodreads (NZ authors)](https://www.goodreads.com/topic/show/21903283-a-better-way-for-kiwi-authors-to-get-paid-by-amazon?tab=author) (anecdotal; dates not shown)

### Inferences
- **Two workable KDP setups for an Australian sole trader:**
  - **(a)** A traditional Australian bank account receiving AUD for all marketplaces. Simplest, with no PSP rules or PSP freeze risk, but Amazon converts at an undisclosed rate.
  - **(b)** A per-marketplace mix: the Australian bank for Amazon.com.au, and Wise USD, GBP and EUR local details for .com, .co.uk and the EU stores, so royalties arrive in the sale currency without Amazon's conversion. The community report above suggests KDP allows different accounts per marketplace.
- **Airwallex is on KDP's PSP list**, so it is technically allowed. Given the user's history of 4–6 Airwallex freezes, Wise (also listed) is the in-policy PSP alternative. Note also that KDP itself can put payments on hold if PSP KYC is incomplete.
- **Revolut:** I did not see it in the PSP list excerpt. Using Revolut for KDP would depend on whether KDP treats it as a deposit-taking bank, which I did not establish [unverified].

### Gaps
- I could not read the full live PSP list (the excerpt may be incomplete), or confirm whether Revolut is on it.
- I found no current KDP statement of payment timing (commonly cited as about 60 days after the end of the sales month) [unverified], and no wire threshold for Australian bank locations.
- Amazon's FX margin on AUD conversion is not disclosed anywhere I found.

## 3. IngramSpark, Draft2Digital, Apple Books and Kobo Writing Life: methods, currencies and thresholds for Australian recipients

### Takeaway
- **IngramSpark** pays AUD by direct deposit to an Australia-based bank (minimum AUD 25), 90 days after the end of the sales month.
- **Kobo Writing Life** pays only by direct deposit, supports AUD (BSB required), and has a CAD 50 threshold.
- **Draft2Digital** pays by PayPal (USD 10 minimum), international direct deposit (USD 20), Payoneer (USD 20) or cheque (USD 100); the AUD payout currency is unconfirmed.
- **Apple Books** pays by bank transfer to the publisher's "own bank, not an intermediary". Threshold details for AUD are unconfirmed.

### Cited Findings
- **IngramSpark:** "AUD BACS direct deposit (must be AU based bank, NO NZL banks) - $25.00 minimum". Below-threshold compensation rolls into the next month in which the cumulative total exceeds the threshold. Payment is made "90 days from the end of the month in which sales are reported". The payout currency can be changed only once in a 180-day period. — [IngramSpark User Guide v3.3, dated 24 August 2026 (PDF)](https://www.ingramspark.com/hubfs/downloads/user-guide.pdf) (current)
- **IngramSpark (older, anecdotal):** direct deposit failed because the money was sent to a savings account, and a USD 100 cheque threshold applied at the time. — [Leland Lydecker blog](https://lelandlydecker.com/ingram-spark-compensation-and-unspoken-restrictions/) (2019, possibly outdated)
- **Draft2Digital minimums:** PayPal USD 10, international direct deposit USD 20, Payoneer USD 20, cheque USD 100. Payments go out on or around the 15th of each month. — [Draft2Digital FAQ](https://draft2digital.com/faq/) (undated). The thresholds took effect 1 November 2025. — [Horror Tree](https://horrortree.com/draft2digital-introduces-new-payment-thresholds-for-authors-starting-november-2025/) (2025, about 12 months old)
- **Draft2Digital fees:** PayPal 2.5%, capped at USD 1.50 for US authors and USD 25 outside the US. Non-US cheques cost USD 4.00 each. — [Medium: PayPal and Check Fees Coming to Draft2Digital From May 10, 2025](https://medium.com/readers-club/paypal-and-check-fees-coming-to-draft2digital-from-may-10-2025-2275af486d0b) (May 2025, possibly outdated). Direct deposit and Payoneer: no fee. — [Inkfluence AI D2D review 2026](https://www.inkfluenceai.com/blog/draft2digital-review-2026) (third party)
- **Draft2Digital currency:** the only statement found is a 2017 post saying Payoneer lets you receive D2D payments "in local currency". — [D2D blog 2017](https://draft2digital.com/blog/2017-the-year-of-d2d/) (possibly outdated)
- **Apple Books bank details:** "should apply to your own bank, not an intermediary or correspondent bank, and should have its own routing number". You select a bank account currency, and if yours isn't listed you should ask your bank which supported currencies it can accept. Payments may differ from proceeds because of FX variance and withholding. — [Apple Books Partner Support: Provide banking information](https://itunespartner.apple.com/books/support/4849-provide-banking-information-itunes-connect); [Apple Books Payments](https://itunespartner.apple.com/books/articles/apple-books-payments-2748) (undated; possibly outdated)
- **Apple Books threshold and timing:** for bank territories and currencies not in Apple's threshold table, the minimum is USD 40. Payment is made "no later than 45 days following the first Friday of each month" (excerpt wording). — [Apple Books Partner Support: Payments and financial reports](https://itunespartner.apple.com/books/articles/apple-books-payments-and-financials-2747) (undated). This conflicts with a third-party figure of USD 10 for most markets. — [ScribeCount Apple Books guide](https://scribecount.com/author-resource/troubleshooting-author-resources/apple-books-publishing) [unverified]
- **Kobo Writing Life:** paid "45 days after the end of each monthly sales period", once a CAD 50 threshold is reached. Sales from all countries are combined, and amounts below the threshold carry over. Payments are sent on the 15th of the month. Payment currencies: USD, CAD, GBP, EUR, JPY, AUD, NZD and HKD (otherwise USD). — [Kobo Writing Life Help: How and when do I get paid?](https://kobowritinglife.zendesk.com/hc/en-us/articles/360059385891-How-and-when-do-I-get-paid) (undated)
- **Kobo method:** AUD payments need a valid 6-digit BSB, and "direct deposit remains our only method at this time" (no PayPal or Payoneer). — [Kobo Writing Life Help: How do I add my bank information](https://kobowritinglife.zendesk.com/hc/en-us/articles/43580341403675-How-do-I-add-my-bank-information-to-receive-payment) (undated). Conflicting third-party threshold of USD 50. — [ScribeCount Kobo guide](https://scribecount.com/author-resource/publishing-a-book/How-to-Publish-on-Kobo-Writing-Life) (Kobo's own page takes precedence)
- **Anecdotal:** authors describe receiving Apple and Kobo royalties into Wise. — [Nicole C. W. blog](https://www.nicolecw.com/self-publishing/wise-how-to-receive-amazon-apple-kobo-royalties/) (undated)

### Inferences
- IngramSpark's "must be AU based bank" and Apple's "own bank, not an intermediary" wording create real uncertainty for non-bank providers. Wise and Airwallex AUD details are local BSB accounts, but the funds are held via partner banks. For these payers, a traditional Australian bank is the lowest-risk receiving account.
- Kobo's single combined threshold and its AUD option make an AUD bank account the natural choice. Kobo converts all stores into the chosen payout currency, so there is no FX advantage in holding foreign currency for Kobo unless USD, GBP or EUR is chosen deliberately.

### Gaps
- I could not confirm whether D2D's international direct deposit pays Australians in AUD or in USD.
- I could not confirm Apple's AUD-specific threshold or whether it accepts Wise or Airwallex AUD details.
- I found no first-hand reports of IngramSpark or Apple rejecting EMI-held accounts. EMI here means e-money institutions such as Wise, Airwallex and Revolut, which are not banks.

## 4. Music payers: DistroKid, TuneCore and CD Baby; APRA AMCOS and PPCA payment methods

### Takeaway
- **DistroKid** pays out via Tipalti (PayPal, wire, eCheck or cheque; ACH is US-only).
- **TuneCore** pays non-US artists only through Payoneer, via Believe International (onward to bank, PayPal or a prepaid card).
- **CD Baby** pays by bank transfer (including Australia's NPP real-time payments system), PayPal or Payoneer.
- **APRA AMCOS** pays into the member's nominated bank account.
- **PPCA** pays registered Australian artists through its Artist Direct Distribution Scheme; how it pays was not documented in the results.

### Cited Findings
- **DistroKid:** withdraw at any time via distrokid.com/bank. Options listed are PayPal, ACH, wire, eCheck and paper cheque. Tipalti's fee is deducted on withdrawal. — [DistroKid Help: Withdrawing Your Earnings](https://support.distrokid.com/hc/en-us/sections/360004443773-Withdrawing-Your-Earnings) (undated). Third-party guides say PayPal is usually the cheapest option outside the US and international wires carry significant fees. — [Rexius Records](https://www.rexiusrecords.com/transfer-money-distrokid/) (third party) [unverified]
- **TuneCore process:** TuneCore pays through Payoneer, from which you can send to PayPal, a prepaid Mastercard or a bank account. TuneCore manually reviews every withdrawal, which can take 2–3 business days. — [TuneCore Help: How do I withdraw my money?](https://support.tunecore.com/hc/en-us/articles/115006508087-How-do-I-withdraw-my-money); [Using Payoneer](https://support.tunecore.com/hc/en-us/articles/360059907892-Using-Payoneer) (undated)
- **TuneCore fees:** bank transfer/ACH fee of USD 1, 3 or 5 depending on country. PayPal costs 2%, up to USD 20 (USD 0.25 flat for US users). — [TuneCore Help: Using Payoneer](https://support.tunecore.com/hc/en-us/articles/360059907892-Using-Payoneer) (undated; the excerpt said figures may be out of date)
- **TuneCore non-US artists** are billed through Believe International and must opt into "self billing" to withdraw. Payments show in Payoneer as coming from "Believe International". — [TuneCore Help: TuneCore & Believe International](https://support.tunecore.com/hc/en-us/articles/360049053211-TuneCore-Believe-International) (undated)
- **CD Baby methods and fees:** bank transfer (checking accounts only), PayPal or Payoneer. Non-US bank transfers cost USD 3.00 and PayPal USD 2.50. The minimum listed for NPP is USD 3. Bank transfers outside the US take 5–7 business days; PayPal takes 2–7 business days. — [CD Baby Help: How do I get paid from CD Baby?](https://support.cdbaby.com/hc/en-us/articles/211074743-How-do-I-get-paid-from-CD-Baby) (undated)
- **APRA AMCOS:** royalties "are paid directly into your nominated bank account". Statements are available in the member Portal or app. — [APRA AMCOS: Royalties overview](https://www.apraamcos.com.au/music-creators/membership-explained/royalties-overview) (undated)
- **AMCOS timing:** royalties are processed quarterly, within 60 days of the end of each calendar quarter, and "all amounts over $10 are paid". — [APRA AMCOS royalties overview (AU)](https://www.apraamcos.com.au/music-creators/membership-explained/royalties-overview) (undated)
- **APRA timing (NZ site):** domestic royalties are paid quarterly (domestic major events monthly) and international royalties monthly. — [APRA AMCOS NZ: Distributions](https://www.apraamcos.co.nz/resources/get-paid/distributions) (undated)
- **APRA EFT reference (old):** an affiliated-society royalty is paid outside the quarterly run only "where the distributable amount exceeds $10.00 and the member has an EFT facility". — [APRA Distribution Rules, first published September 2000 (PDF)](https://assets.apraamcos.com.au/images/PDFs/About/APRA-Distribution-Rules.pdf) (possibly outdated)
- **PPCA:** performers register for the **Artist Direct Distribution Scheme** under their real legal name. Registrants must be Australian citizens, protected persons or residents. Registering by 31 August makes an artist eligible for that year's distribution. Songwriters, session musicians, producers and remixers are not eligible. — [PPCA: Artist Registration Information](https://www.ppca.com.au/artist-registration-information); [PPCA Artists FAQs](https://www.ppca.com.au/artists/faqs) (undated)
- **PPCA bank details:** an outstanding payment requires "current bank account details". The distribution team can be contacted at distribution.mail@ppca.com.au or +61 2 8569 1133. — [PPCA Annual Report 2025 (PDF)](https://content.ppca.com.au/documents/ppca-annual-report-2025.pdf) and PPCA pages (excerpt)

### Inferences
- APRA AMCOS and PPCA are domestic AUD payers to a nominated Australian bank account, so FX is not an issue. A traditional Australian bank account is the safe choice for them.
- For TuneCore, Payoneer is unavoidable for non-US artists; the only choice is where Payoneer forwards the money. CD Baby's NPP option means it can pay a domestic Australian account in near real time. DistroKid has no Australia-specific method in the results, so PayPal or wire are the likely routes.

### Gaps
- I could not confirm whether APRA AMCOS or PPCA accept non-bank (EMI) BSB accounts.
- I found no current Australia-specific fee or currency details for DistroKid.

## 5. Traditional publishers: how royalties and advances are paid to Australian authors

### Takeaway
I found almost no sourced material on the payment mechanics: domestic AUD EFT from Australian publishers, and SWIFT wires from foreign publishers. This area is mostly a gap.

### Cited Findings
- The ASA describes an advance as "an advance payment on the future royalties your book is expected to earn". Its guidance on advances covers when they are paid, but nothing about currency or transfer costs was found. — [ASA: What you need to know about book advances](https://www.asauthors.org.au/news/what-you-need-to-know-about-book-advances/) (undated)
- Authors can receive payments collected overseas through the Copyright Agency. The ASA advises keeping bank details current; distribution schedules vary by licence source. — [ASA FAQ: Earning a Living](https://www.asauthors.org.au/faq/earning-a-living/) (undated)
- Some publishers sell or sub-license to overseas associate companies, and some calculate US royalties on their American subsidiary's receipts, which affects the currency and amount authors see. — [Wikipedia: Sheet dealing](https://en.wikipedia.org/wiki/Sheet_dealing) (tertiary source; low weight)
- General guide to how Australian authors get paid. — [Author Services Australia (May 2023)](https://www.authorservicesaustralia.com.au/2023/05/15/how-do-authors-get-paid-in-australia/) (possibly outdated; payment-method detail not surfaced in excerpt)

### Inferences
- [unverified] Australian publishers typically pay royalty statements by domestic AUD EFT to the author or the agent's trust account. Foreign publishers typically pay by international wire (SWIFT) in their home currency, often via the author's agent. For SWIFT receipts, a traditional bank with a SWIFT BIC (or a Wise account that supports SWIFT receipt) would be needed. None of this was confirmed by a source in this session.

### Gaps
- I found no source on foreign publishers' payment methods, SWIFT fees, or whether they will pay into Wise, Airwallex or Revolut local accounts. ASA contract guidance, the Australian Literary Agents' Association, or agency FAQs would be the next places to check.

## 6. US withholding on royalties for Australian residents (W-8BEN and the treaty rate), as far as it affects payer setup

*General information, not tax advice. The user should confirm with a registered tax agent.*

### Takeaway
Without a valid treaty claim, US payers withhold 30% on US-source royalties. The Australia–US treaty, as amended by its 2001 protocol, caps US withholding on royalties at **5%**. An individual (a sole trader is an individual) claims this on **Form W-8BEN**, giving either a US TIN or their Australian foreign TIN.

### Cited Findings
- **The 5% rate:** the protocol to the US–Australia treaty cut the maximum withholding on royalties from 10% to 5%. — [US Treasury press release PO-640 (2001)](https://home.treasury.gov/news/press-releases/po640); [US Congress Joint Committee explanation, JPRT 108-5-03 (2003)](https://www.govinfo.gov/content/pkg/CPRT-108JPRT85198/html/CPRT-108JPRT85198.htm). Original treaty technical explanation: [IRS: US Treasury Technical Explanation (Australia)](https://www.irs.gov/pub/irs-trty/austtech.pdf).
- **ATO confirmation:** Australia's "most recent tax treaties with the United States and the United Kingdom adopt a rate of 5%", whereas most other Australian treaties use 10%. — ATO legal database ruling surfaced in search (likely [TR 2008/7](https://www.ato.gov.au/law/view/document?docid=TXR%2FTR20087%2FNAT%2FATO%2F00001) or [TR 2004/17](https://www.ato.gov.au/law/view/pdf?DocID=TXR%2FTR200417%2FNAT%2FATO%2F00001&filename=law%2Fview%2Fpdf%2Fpbr%2Ftr2004-017.pdf&PiT=20060118000001); exact document not pinned) [unverified attribution]
- **TIN requirement:** a reduced treaty rate applies "only if the foreign person provides a U.S. or foreign Taxpayer Identification Number (TIN)". An individual may give the FTIN issued by their country of tax residence on line 6a instead of a US TIN. — [IRS: Instructions for Form W-8BEN (Rev. October 2021)](https://www.irs.gov/instructions/iw8ben) (the October 2021 revision was the one returned; check for a newer revision)
- **Line 10:** treaty claimants on royalties must complete line 10 if the treaty has different rates for different types of royalties. — [IRS W-8BEN instructions](https://www.irs.gov/instructions/iw8ben) (Oct 2021). See also [IRS: Claiming tax treaty benefits](https://www.irs.gov/individuals/international-taxpayers/claiming-tax-treaty-benefits) and [IRS Publication 515](https://www.irs.gov/pub/irs-pdf/p515.pdf).
- **Which KDP sales are US-source:** one source says KDP applies US withholding (30% unless a treaty rate applies) to Amazon.com ebook sales and to print sales on .com, .co.jp, .com.au and .ca. Another source says non-US marketplaces are not subject to US withholding. The two conflict. — [book-business-kdp-amazon.com](https://book-business-kdp-amazon.com/en/blog/amazon-kdp-for-non-us-authors/) (2026 blog) [unverified]
- **Payer-side process:** TuneCore collects tax forms through Payoneer, not directly. — [TuneCore Help: TuneCore & Taxes](https://support.tunecore.com/hc/en-us/articles/360026353112-Tunecore-Taxes) (undated)

### Inferences
- **Setup implications:**
  - Each US payer (KDP, IngramSpark, D2D, Apple, DistroKid, TuneCore, CD Baby, and US publishers) needs its own W-8BEN, filled in as an individual. A sole trader uses W-8BEN, not W-8BEN-E.
  - The form should claim the Article 12 royalty rate of 5% and give the Australian TFN as the foreign TIN, or obtain an ITIN.
  - Withholding is taken by the payer before payment, so the choice of receiving account does not change it.
- [unverified] The US tax withheld may be creditable against Australian tax as a foreign income tax offset. Confirm with ATO guidance or a registered tax agent.

### Gaps
- I could not pull IRS Publication 901 or Tax Treaty Table 1 to quote the Australia royalty line directly.
- The exact ATO ruling paragraph is not pinned.
- I could not confirm whether there is a newer W-8BEN revision than October 2021.

## 7. Hostaway: how money flows for direct bookings and for other channels (Booking.com, Vrbo)

### Takeaway
Hostaway does not process payments itself. It connects the host's own account with **Stripe, Authorize.net or Braintree**, and Stripe has the most features.
- **Direct bookings** (Hostaway booking engine, payment links, auto-payments) are charged through the host's Stripe account and pay out wherever that Stripe account pays out.
- **Airbnb, Booking.com and Vrbo** pay through their own systems:
  - Airbnb pays the host's payout method (section 1).
  - Booking.com pays by virtual credit card (VCC), which the host then charges through their own processor, or by bank transfer where offered. Outside the EEA, UK and Switzerland, switching from VCC to bank transfer appears not to be available.
  - Vrbo pays out through Payoneer to the owner's nominated bank account, in AUD if chosen.

### Cited Findings
- **Supported gateways:** Hostaway's help centre names Stripe, Authorize.net and Braintree. It points to the providers' own pages for country coverage. — [Hostaway Help: Supported Payment Providers](https://support.hostaway.com/hc/en-us/articles/17817568726683-Hostaway-Supported-Payment-Providers); [Hostaway Help: Payment Providers section](https://support.hostaway.com/hc/en-us/sections/360007657494-Payment-Providers) (undated). I found no Hostaway-branded in-house processor ("Hostaway Payments") in the results.
- **OTA vs direct bookings:** "OTA bookings are processed through the platform's own payment system". Managers taking direct bookings "must use a PCI-compliant payment processor like Stripe". — [Hostaway glossary: Payment processing](https://www.hostaway.com/glossary/payment-processing/) (undated)
- **Stripe-only features:** saving payment details for future use and alternative payment methods (Apple Pay, Klarna and others). Payment links via Authorize.net or Braintree are card-only. Pre-authorisations (damage deposits) work with Stripe and Authorize.net, not Braintree. Stripe is the only provider supported where the listing currency differs from the payment account's currency. — [Hostaway: Stripe Integration – Payment Methods & APMs](https://support.hostaway.com/hc/en-us/articles/47174049104923-Stripe-Integration-Configuring-Payment-Methods-APMs); [Payment Link – Save payment details](https://support.hostaway.com/hc/en-us/articles/47220094296091-Payment-Link-Save-payment-details-for-future-use); [Damage Deposit Pre-Authorizations](https://support.hostaway.com/hc/en-us/articles/40916112725147-Creating-Managing-Damage-Deposit-Pre-Authorizations-Automated-Manual); [Listings: Manage Currency Settings](https://support.hostaway.com/hc/en-us/articles/360052756113-Listings-Manage-Currency-Settings) (undated)
- **Switching or connecting providers:**
  - Hostaway connects to Stripe only if Braintree is not connected.
  - Stored card data and Stripe customer profiles are permanently tied to the original Stripe account.
  - After switching processors, past reservations must still be charged through the previous processor.

  — [Hostaway: Connect and Use Stripe](https://support.hostaway.com/hc/en-us/articles/360002563234-Connecting-and-Using-Stripe); [Hostaway: Automating Guest Payments](https://support.hostaway.com/hc/en-us/articles/360036454133-Guest-Payments-Auto-payments) (undated). The Braintree-or-Stripe-not-both rule comes from an older article; current status unconfirmed.
- **Hostaway fees on direct bookings (third-party, 2026):**
  - A 1.8% "Booking Engine Fee" on US-listing Stripe bookings, paid by the guest by default.
  - Listings outside the US reportedly pay a different rate, described as a 0.5% host processing fee.
  - An application fee of about 1% on Stripe-processed payments, reported by operators but not published by Hostaway.
  - "Booking Website Pro", launched April 2026, at about USD 49 a month plus a 0.5% reservation fee.
  - One review cites a 3.9% processing figure, which conflicts with the others.

  — [Book With Haven: Hostaway direct booking website (2026, competitor)](https://www.bookwithhaven.com/blog/hostaway-direct-booking-website); [RoomMaster: Hostaway pricing 2026](https://www.roommaster.com/blog/hostaway-pricing); [BnB Console: Hostaway pricing 2026](https://bnbconsole.com/blog/hostaway-pricing); [ChargeAutomation guide](https://chargeautomation.com/hostaway-payment-processing-options/) [unverified; confirm in writing with Hostaway]
- **Booking.com methods:** Booking.com pays "either by virtual credit card (VCC) or bank transfer". Bank transfers can run daily, weekly or monthly after check-out, but "some payout frequencies may not be available in every market". — [Booking.com Partner Help: Understanding Payments by Booking.com](https://partner.booking.com/en-us/help/policies-payments/payment-products/understanding-payments-bookingcom); [Payments by Booking.com FAQs](https://partner.booking.com/en-us/help/policies-payments/payment-products/payments-bookingcom-faqs) (undated)
- **Booking.com outside Europe:** for properties outside the EEA, UK or Switzerland, there is "no option to switch from virtual credit card to bank transfer payout in your region"; to stop VCCs the host must opt out of Payments by Booking.com. — [Booking.com Partner Help: eligibility and opting in/out (en-gb)](https://partner.booking.com/en-gb/help/policies-payments/payment-products/understanding-payments-bookingcom) (undated; not confirmed specifically for Australia) [unverified for AU]
- **Booking.com VCCs:** a VCC is a temporary digital Mastercard that the property charges, so the money arrives through the property's own card processor. — [Booking.com Partner Help: virtual credit cards](https://partner.booking.com/en-us/help/policies-payments/payment-products/everything-you-need-know-about-virtual-credit-cards) (undated)
- **Booking.com bank-transfer fee:** 1% to 3.1% depending on property location. — [AirDNA](https://www.airdna.co/blog/booking.com-host-payout) (third party; possibly outdated) [unverified for AU]
- **Vrbo currency:** AUD is among the currencies an owner can choose for rates and payouts. Vrbo warns that third-party providers may deduct foreign-currency processing costs where conversion occurs. — [Vrbo AU Terms of Payments](https://www.vrbo.com/en-au/lp/b/terms-of-payments) (undated)
- **Vrbo payout method:** payouts are disbursed through Payoneer and "can sometimes be converted into another currency before being sent". Owners confirm the payout bank account (last four digits and currency) in the Owner Dashboard. — [Vrbo Help: Bank deposit report](https://help.vrbo.com/articles/What-is-the-Bank-deposit-report); [Vrbo Help: Verify your payout bank account](https://help.vrbo.com/articles/Verify-your-selected-bank-account-for-payouts) (undated)
- **Vrbo commissions** in Australia are paid via BPAY, not credit card. — [Vrbo Help: Update pay-per-booking billing information](https://help.vrbo.com/articles/How-do-I-update-my-pay-per-booking-billing-information) (undated)
- **Conflict on Vrbo fees for Australian properties:** Hospitable says a 2.7% processing fee applies when payouts go through Hospitable's Vrbo Partner connection. A third-party guide says AU, NZ and JP properties pay no processing fee. — [Hospitable Help: Vrbo Partner Connection payments](https://help.hospitable.com/en/articles/14643790-vrbo-partner-connection-payments-payouts); [withdrawaltimes.org](https://withdrawaltimes.org/vrbo-withdrawal-time/) (about 13 months old, possibly outdated) [unverified]

### Inferences
- **Where each channel's money lands:**
  - Airbnb: the Airbnb payout method.
  - Vrbo: via Payoneer to the owner's bank.
  - Booking.com VCC, direct bookings, payment links and damage deposits: all charged through the host's Stripe account (the Hostaway-connected processor), then paid out to the Stripe payout account.
  - The Stripe payout account is therefore the main receiving point for non-Airbnb income. Its compatibility is covered in section 9.
- **FX:** for an Australian listing priced in AUD with AUD payouts, no FX step should arise on any channel. FX costs come from mismatched currencies, for example a USD-priced listing paid out in AUD.

### Gaps
- I could not confirm Hostaway's Australia-specific fee schedule for Stripe bookings.
- I could not confirm whether Payments by Booking.com bank transfer is offered to Australian properties at all.
- I could not confirm whether Vrbo's Payoneer-disbursed AUD payouts can go to a Wise, Airwallex or Revolut BSB.

## 8. Upsell and guest-experience tools connected to Hostaway: how they collect and pay out

### Takeaway
Hostaway's Marketplace lists **Enso Connect, Duve and CheKin** among its guest-experience and upsell partners. Duve and Chekin document collecting guest payments through the **host's own connected Stripe account**; Duve falls back to Payoneer where Stripe is unsupported. Enso Connect's payment rails were not confirmed. Boostly, a direct-booking website, reportedly takes payments through the host's own Stripe account. Its listing on the Hostaway Marketplace was not confirmed.

### Cited Findings
- **Hostaway Marketplace listings** exist for Enso Connect, Duve and CheKin. The guest-experience category covers guidebooks, upsells and concierge services. — [Hostaway Marketplace: Enso Connect](https://www.hostaway.com/marketplace/enso-connect/); [Duve](https://www.hostaway.com/marketplace/duve/); [CheKin](https://www.hostaway.com/marketplace/chekin/); [Marketplace index](https://www.hostaway.com/marketplace/) (undated)
- **Duve and Stripe:** Duve's Stripe integration supports security deposits, guest billing and upsells. It is available to customers in Europe, North America and Australia. Upsell payments go to the host's bank or Stripe account, and "if Stripe is not supported in your country Duve will connect you to Payoneer". The connected Stripe account bears all charges and holds for Duve features. — [Duve Help: Stripe Integration](https://helpcenter.duve.com/hc/en-us/articles/7714255786141-Stripe-Integration); [Duve Help: Duve Upsells](https://helpcenter.duve.com/hc/en-us/articles/7805483603357-Duve-Upsells) (undated)
- **Duve fees:** Duve's upsell service fee excludes Stripe or Payoneer fees. — [Duve Help: Duve Upsells](https://helpcenter.duve.com/hc/en-us/articles/7805483603357-Duve-Upsells) (undated)
- **Duve and Hostaway sync scope:** sync runs one way from Hostaway to Duve (partial two-way for pre-check-in data), and two-way sync of upsell orders is "not yet supported". — [Duve Help: Hostaway Integration Specs](https://helpcenter.duve.com/hc/en-us/articles/15224659707421-Hostaway-Integration-Specs) (undated)
- **Enso Connect:** two-way sync with Hostaway via Hostaway's REST API, covering messaging, check-in and upsells. — [Enso Connect: Hostaway integration](https://ensoconnect.com/hostaway/) (vendor). In Guesty, a different PMS, Enso upsells sync to the guest folio "but will not automatically record a payment". — [Guesty Help: Enso Connect](https://help.guesty.com/hc/en-gb/articles/9361711686173-Enso-Connect) (undated; Hostaway behaviour may differ)
- **Upsell commissions:** Enso about 5%, Duve about 10%. — [Enso Connect comparison page](https://ensoconnect.com/resources/duve-vs-enso-connect-features-pricing-alternatives) (vendor; about 518 days old, possibly outdated) [unverified]
- **Chekin and Stripe:** "connect a Stripe account to send the balance of the payments in Chekin directly to your Stripe account". An existing Stripe account is detected by email. — [Chekin Help: Connect a Stripe account](https://support.chekin.com/en/connect-a-stripe-account-for-payments-chekin-help-center) (undated)
- **Chekin's Hostaway listing** covers registration, ID verification, remote access, upselling, tourist taxes and payments. — [Hostaway Marketplace: CheKin](https://www.hostaway.com/marketplace/chekin/)
- **Boostly** integrates with Hostaway, Guesty, Hospitable, OwnerRez and Lodgify. Its booking engine takes cards "often through Stripe". — [Rakidzich: Boostly review 2026](https://www.rakidzich.com/articles/boostly-direct-booking-website-2026) (third party). A competitor says Boostly processes payments through the host's own Stripe account. — [Book With Haven: Haven vs Boostly](https://www.bookwithhaven.com/compare/haven-vs-boostly) (competitor) [unverified]

### Inferences
- In practice, the upsell tools route money into the same Stripe account Hostaway uses, or into a separate Stripe account if the host connects a different one, and then to that Stripe account's payout bank. Choosing a reliable Stripe payout account therefore covers direct bookings, deposits and upsells at once.
- Because Duve upsell orders do not sync back into Hostaway, upsell revenue may need separate reconciliation in Xero, for example from Stripe payout reports.

### Gaps
- I could not confirm Enso Connect's payment processor for Hostaway users.
- I could not confirm whether any of these tools use Stripe Connect (where a failed payout disables the external account; see section 9) or the host's standard Stripe account.
- I could not confirm whether Boostly is listed in the Hostaway Marketplace.

## 9. Stripe Australia payouts: non-bank AUD accounts (Airwallex, Wise, Revolut BSBs) and reported problems

### Takeaway
Wise states that Stripe can pay out **AUD** to a Wise AUD account (BSB 774001). Stripe's own help explicitly **excludes Wise, Airwallex, "virtual" and neobank accounts** for its **USD/NZD payout** feature for Australian accounts; that feature needs an Australia-based bank account. For plain AUD payouts to Airwallex or Revolut I found no confirmation either way. Stripe's documentation warns of higher payout failures for non-standard accounts.

### Cited Findings
- **Wise:** "you can receive money from Stripe into your Wise account". Wise lists AUD among the currencies it can receive. The receiving account should be in the country of the currency's issue. You cannot fund Wise transfers from Stripe. — [Wise Help: How do I receive money from Stripe with Wise?](https://wise.com/help/articles/2977935/how-do-i-receive-money-from-stripe-with-wise); [Wise Help: Incompatible accounts and payments](https://wise.com/help/articles/2932118/incompatible-accounts-and-payments) (undated; vendor)
- **Stripe's USD/NZD feature:** "We're only able to support USD / NZD bank accounts based in Australia and currently do not support virtual bank accounts like Wise for this feature". Unsupported examples include "Wise, Airwallex, Virtual or Neobank account". — [Stripe Support: Receiving USD, NZD payouts for Australia users](https://support.stripe.com/questions/receiving-usd-nzd-payouts-for-australia-users) (undated)
- **Default payout currency:** Stripe Australia's default is AUD, and foreign-currency charges are converted on payout unless USD/NZD settlement is enabled. — summary of Stripe/Wise pages in search results ([Stripe Support](https://support.stripe.com/questions/receiving-usd-nzd-payouts-for-australia-users); [Wise AU: Stripe fees](https://wise.com/au/blog/stripe-fees)) [unverified wording]
- **Non-standard accounts:** Stripe's payouts docs warn "you might see higher payout failures" when non-standard accounts are used. — [Stripe Docs: Receive payouts](https://docs.stripe.com/payouts.md) (excerpt only)
- **Rejected payouts:** banks may reject a payout if the account details on Stripe don't match what the bank has on file (account holder name, currency). — [Stripe Support: Rejected payouts](https://support.stripe.com/questions/rejected-payouts) (undated)
- **Connect accounts:** when a payout fails, the external account is disabled until it is updated. — [Stripe Docs: Payouts to connected accounts](https://stripe.com/docs/connect/bank-debit-card-payouts); [Stripe error codes](https://docs.stripe.com/error-codes) (`bank_account_bad_routing_numbers` means the account doesn't support the currency)
- **Wise BSB change:** Wise moved its AUD account details to BSB **774001** and asked users to update platforms such as Stripe. The old BSB 802985 worked only until September 2024. — [Wise Help: We're changing your AUD account details](https://wise.com/help/articles/240ocTVUrwPslKhVXZcQ2u/were-changing-your-aud-account-details) (2024; possibly outdated, but explains a known failure mode)
- **Third-party commentary:** failed payouts are generally returned rather than lost, but payouts halt until a different account is supplied. A payout account can pass Stripe's initial checks and still be rejected months later. — [StartGlobal: Which bank accounts can receive Stripe payouts?](https://startglobal.co/learn/banking/stripe-payout-account/) (third party) [unverified]
- I found **no first-hand reports** of AUD Stripe payouts to Wise, Airwallex or Revolut AU accounts being rejected or held. Reddit and Whirlpool were not reachable.

### Inferences
- An AUD Stripe payout to a traditional Australian bank account is the configuration Stripe supports unambiguously. Wise AUD is vendor-confirmed for AUD. Airwallex and Revolut AUD are unclear.
- Because Stripe excludes Wise and Airwallex for USD/NZD settlement, a host wanting to receive USD from Stripe without conversion would need a USD account at an Australian bank.
- The user's Airwallex freezes would affect any Stripe flows paid out to Airwallex. Pointing Stripe at a traditional bank removes that exposure.

### Gaps
- I could not confirm Stripe's own position on AUD payouts to EMI-held BSBs (Wise, Airwallex, Revolut).
- I found no Australia-specific user reports of problems.

## 10. Hostaway and Xero: native integration or third party

### Takeaway
The evidence conflicts. A Hostaway community reply (about 2022) said there was no Xero integration yet, while Capterra lists Xero among Hostaway's integrations. Hostaway does have an official **QuickBooks Online** integration. For Xero, the documented route is **VRPlatform** (listed in Hostaway's Marketplace, accounting category), which syncs Hostaway to QBO, Xero or Intacct. Zapier also offers a Hostaway–Xero connector. **Link My Books** does not list Hostaway or any vacation-rental channel.

### Cited Findings
- **Older Hostaway position:** "we don't have an integration with Xero yet", with users pointed to the API. A later thread requests a Xero integration, and a reseller offers a custom build. — [Hostaway Community: Reconciling reservation payouts](https://support.hostaway.com/hc/en-us/community/posts/10413177466523-Reconciling-reservation-payouts); [Hostaway Community: Xero integration please](https://support.hostaway.com/hc/en-us/community/posts/30549422583323-Xero-integration-please) (about 2022 and about 2025 respectively; which thread holds which quote was not pinned) [unverified attribution]
- **Conflicting listing:** Capterra lists Xero among Hostaway's 50+ integrations ("reviewer-confirmed"). — [Capterra: Hostaway](https://www.capterra.com/p/152433/Hostaway/) (2026). Zapier lists a Hostaway–Xero connector. — [Zapier: Hostaway integrations](https://zapier.com/apps/hostaway/integrations)
- **Native QuickBooks Online integration:** reservations go across as invoices, but individual Hostaway expenses cannot be sent as bills and owner-statement totals cannot be sent. — [Hostaway: QuickBooks Online FAQs](https://support.hostaway.com/hc/en-us/articles/27435948215323-QuickBooks-Online-FAQs); [Hostaway QuickBooks integration](https://www.hostaway.com/features/quickbooks-integration/) (undated)
- **VRPlatform:** syncs Hostaway to QBO, Xero or Intacct, with automated journal entries and owner statements. It connects via an API key generated from the Accounting category of the Hostaway Marketplace. — [Hostaway blog: Best accounting software for vacation rentals](https://www.hostaway.com/blog/best-accounting-software-for-vacation-rentals/) (about 13 months old, possibly outdated); [Hostaway Marketplace: VRPlatform](https://www.hostaway.com/marketplace/vrplatform/); [VRPlatform: Connect your PMS – Hostaway](https://support.vrplatform.app/en/articles/11164536-connect-your-pms-hostaway-vrtrust)
- **VRTrust and Xero:** VRTrust can replace Xero, or be configured to post GL activity and statement financials to Xero. It is used in Australia. Its Plaid bank connection is US-only, so international clients upload bank data manually. — [VRPlatform FAQs](https://www.vrplatform.app/resources/faqs); [VRPlatform integrations](https://www.vrplatform.app/integrations) (vendor)
- **Link My Books** connects Xero to Amazon, Etsy, eBay, TikTok and Shopify, and posts summary entries that match bank deposits, in the original currency where relevant. No Hostaway or vacation-rental channel is listed. — [Xero App Store: Link My Books](https://apps.xero.com/us/app/link-my-books); [Link My Books](https://linkmybooks.com/) (undated)

### Inferences
- For a single-owner sole trader, an Australian bank feed into Xero, plus Stripe and Airbnb payout reports, may be simpler than VRPlatform's trust-accounting product, which targets property managers. Treat this as an option to evaluate, not a recommendation from a source.
- Link My Books is built for Amazon Seller Central-style settlements; whether it handles KDP royalties was not established. It is not a Hostaway solution.

### Gaps
- I could not confirm the current (November 2026) Hostaway Marketplace accounting listings.
- I did not research Xero bank-feed availability for Wise, Airwallex, Revolut or Stripe here.

## 11. Summary table: payer, methods, currencies, non-bank compatibility, notes

### Takeaway
For the user's goals (low FX cost, avoiding provider freezes):
- **Traditional AU bank, AUD:** fits Airbnb, Kobo, IngramSpark, APRA AMCOS, PPCA, CD Baby (via NPP) and Vrbo (AUD via Payoneer disbursement). It should also be the **Stripe payout account**, which collects Hostaway direct bookings, Booking.com VCC charges, damage deposits and Duve or Chekin upsells.
- **Wise, in-policy for KDP:** a Wise USD, GBP or EUR account (on KDP's PSP list) is the documented way to avoid Amazon's conversion on foreign marketplaces.
- **Payoneer, unavoidable for TuneCore:** TuneCore pays non-US artists only through Payoneer.
- **Airwallex:** technically allowed by KDP, but the user has reason to avoid it.

### Cited Findings

| Payer | Methods for an AU recipient | Currencies | Works with non-bank multi-currency accounts (Airwallex/Wise/Revolut/Payoneer)? | Notes and sources |
|---|---|---|---|---|
| **Airbnb** | Bank account (AU BSB); listed globally: PayPal, Payoneer card, international transfer, Western Union, Fast Pay (availability by country) | AUD for AU bank; currency fixed per payout method; Western Union in USD | **Unclear.** Wise vendor guide says yes; no Airbnb statement; no rejection reports found | 3–5 business days for bank transfer, 3–7 for international. Airbnb emails if a payout is returned. [Resource Centre](https://www.airbnb.com.au/resources/hosting-homes/a/how-youll-get-paid-for-hosting-20) (about mid-2025, possibly outdated); [Help 1516](https://www.airbnb.com/help/article/1516); [AU Payments Terms, June 2024](https://assets.airbnb.com/help/Payments_Terms_of_Service_for_Australian_Users_-_English_June_2024.pdf?disposition=inline) |
| **Hostaway direct bookings** (booking engine, payment links, auto-payments, damage deposits) | Charged via the host's own Stripe, Authorize.net or Braintree account; Hostaway has no in-house processor | Listing currency; Stripe is the only provider supporting a listing currency that differs from the payment account | **Depends on the processor's payout account** (see the Stripe row) | Third-party reports of a 1.8% guest-paid fee (US), 0.5% non-US, about 1% application fee; all [unverified]. [Hostaway providers](https://support.hostaway.com/hc/en-us/articles/17817568726683-Hostaway-Supported-Payment-Providers); [Hostaway glossary](https://www.hostaway.com/glossary/payment-processing/) |
| **Stripe (Australia)** | Payout to a bank account | AUD default; USD/NZD only to an Australia-based bank account | **Wise AUD: yes** (Wise help). **Wise and Airwallex for USD/NZD: no** (Stripe help). **Airwallex and Revolut AUD: unclear** | Stripe warns of higher failures for non-standard accounts; Wise BSB is now 774001. [Stripe USD/NZD for AU](https://support.stripe.com/questions/receiving-usd-nzd-payouts-for-australia-users); [Wise–Stripe](https://wise.com/help/articles/2977935/how-do-i-receive-money-from-stripe-with-wise); [Stripe payouts docs](https://docs.stripe.com/payouts.md) |
| **Booking.com** | Payments by Booking.com: VCC (charged through the host's processor, so it lands in Stripe) or bank transfer; outside EEA/UK/CH no switch from VCC to bank transfer | Not confirmed for AU | **Unclear** (bank transfer to EMIs not addressed) | Bank-transfer fee 1–3.1% by location [unverified]. [Booking.com: Understanding Payments](https://partner.booking.com/en-us/help/policies-payments/payment-products/understanding-payments-bookingcom); [VCC guide](https://partner.booking.com/en-us/help/policies-payments/payment-products/everything-you-need-know-about-virtual-credit-cards) |
| **Vrbo** | Payout to the owner's bank account, disbursed via Payoneer; commission billed via BPAY in AU | AUD selectable for rates and payouts | **Unclear** | Payoneer may convert currency; conflicting fee info for AU. [Vrbo AU terms](https://www.vrbo.com/en-au/lp/b/terms-of-payments); [Vrbo bank deposit report](https://help.vrbo.com/articles/What-is-the-Bank-deposit-report) |
| **Duve** (upsells, deposits) | Host's connected Stripe account; Payoneer where Stripe is unsupported | Per Stripe account | **Via Stripe's payout account** (see the Stripe row); Payoneer fallback | Available in Australia; upsell orders don't sync back to Hostaway. [Duve Stripe](https://helpcenter.duve.com/hc/en-us/articles/7714255786141-Stripe-Integration); [Duve–Hostaway specs](https://helpcenter.duve.com/hc/en-us/articles/15224659707421-Hostaway-Integration-Specs) |
| **Chekin** (check-in, upsells, payments) | Host's connected Stripe account | Per Stripe account | **Via Stripe's payout account** | [Chekin: connect Stripe](https://support.chekin.com/en/connect-a-stripe-account-for-payments-chekin-help-center); [Hostaway Marketplace: CheKin](https://www.hostaway.com/marketplace/chekin/) |
| **Enso Connect** (upsells, guest app) | Payment rails not confirmed | Not confirmed | **Unclear** | Two-way Hostaway sync; about 5% upsell fee (vendor, about 518 days old) [unverified]. [Hostaway Marketplace: Enso](https://www.hostaway.com/marketplace/enso-connect/) |
| **Boostly** (direct booking site) | Reportedly the host's own Stripe account | Per Stripe account | **Via Stripe's payout account** [unverified] | Hostaway integration reported by third parties; marketplace listing not confirmed. [Rakidzich review](https://www.rakidzich.com/articles/boostly-direct-booking-website-2026) |
| **Amazon KDP** | EFT (direct deposit); no cheques for AU bank location; wire limited | AUD for all marketplaces to an AU bank (Amazon converts); or sale currency (USD/GBP/EUR) to an account in that currency's country | **Yes for listed PSPs** (Airwallex, Wise, Payoneer, WorldFirst and others) after KYC, required since 1 Aug 2026. **Revolut unclear.** Deposit-taking banks exempt | EFT has no minimum. Name must match. [PSP Updates](https://kdp.amazon.com/en_US/help/topic/G6GLVRHVQZY4V4FX); [PSP FAQ](https://kdp.amazon.com/en_US/help/topic/GD9NN4LS8ZDU8XZ7); [Payment Options](https://kdp.amazon.com/help?topicId=G201365170); [Wise AU guide](https://wise.com/au/blog/receive-payment-kindle-kdp-wise) |
| **IngramSpark** | Direct deposit | AUD (must be AU-based bank); other currencies exist (details not confirmed) | **Unclear.** "Must be AU based bank" wording | Minimum AUD 25; paid 90 days after month end; currency change once per 180 days. [User Guide v3.3, Aug 2026](https://www.ingramspark.com/hubfs/downloads/user-guide.pdf) |
| **Draft2Digital** | PayPal, international direct deposit, Payoneer, cheque | USD-denominated thresholds; AUD payout not confirmed | **Payoneer: yes** (native option). Wise/Airwallex/Revolut: unclear | Minimums: PayPal USD 10, direct deposit and Payoneer USD 20, cheque USD 100 (from 1 Nov 2025). PayPal fee 2.5% (max USD 25 non-US). [D2D FAQ](https://draft2digital.com/faq/); [Horror Tree](https://horrortree.com/draft2digital-introduces-new-payment-thresholds-for-authors-starting-november-2025/) |
| **Apple Books** | Bank transfer | Choose bank account currency from Apple's supported list | **Unclear.** Must be "own bank, not an intermediary or correspondent bank" | USD 40 minimum where no table entry; conflicting third-party USD 10. [Apple banking info](https://itunespartner.apple.com/books/support/4849-provide-banking-information-itunes-connect); [Apple Payments](https://itunespartner.apple.com/books/articles/apple-books-payments-and-financials-2747) (undated, possibly outdated) |
| **Kobo Writing Life** | Direct deposit only (no PayPal or Payoneer) | AUD (BSB), USD, CAD, GBP, EUR, JPY, NZD, HKD | **Unclear.** Wise anecdotally works; no Kobo statement | CAD 50 combined threshold; paid on the 15th, 45 days after month end. [Kobo: when paid](https://kobowritinglife.zendesk.com/hc/en-us/articles/360059385891-How-and-when-do-I-get-paid); [Kobo: bank info](https://kobowritinglife.zendesk.com/hc/en-us/articles/43580341403675-How-do-I-add-my-bank-information-to-receive-payment) |
| **DistroKid** | Via Tipalti: PayPal, wire, eCheck, cheque (ACH US only) | Mainly USD (AU details not confirmed) | **Unclear** | Tipalti fee deducted. [DistroKid Help](https://support.distrokid.com/hc/en-us/sections/360004443773-Withdrawing-Your-Earnings) |
| **TuneCore** | Payoneer only, then onward to bank, PayPal or prepaid Mastercard | USD balance; Payoneer converts | **Payoneer: required.** Others: only as Payoneer's onward destination | Manual review 2–3 business days; fees USD 1/3/5 by country; non-US artists via Believe International with self-billing. [TuneCore withdraw](https://support.tunecore.com/hc/en-us/articles/115006508087-How-do-I-withdraw-my-money); [Believe Intl](https://support.tunecore.com/hc/en-us/articles/360049053211-TuneCore-Believe-International) |
| **CD Baby** | Bank transfer (checking accounts only; NPP in Australia), PayPal, Payoneer | Not confirmed | **Payoneer: yes** (native). Others: unclear | Non-US bank fee USD 3; PayPal USD 2.50; bank 5–7 business days. [CD Baby Help](https://support.cdbaby.com/hc/en-us/articles/211074743-How-do-I-get-paid-from-CD-Baby) |
| **APRA AMCOS** | Nominated bank account (EFT) | AUD | **Unclear** (no statement found) | AMCOS quarterly, within 60 days, amounts over AUD 10. [APRA AMCOS royalties overview](https://www.apraamcos.com.au/music-creators/membership-explained/royalties-overview) |
| **PPCA** | Artist Direct Distribution Scheme; bank details held by distribution team | AUD (inferred) | **Unclear** | Legal name; register by 31 Aug for that year. [PPCA artist registration](https://www.ppca.com.au/artist-registration-information) |
| **Traditional publishers** | AU publishers: domestic EFT; foreign: wire or SWIFT [unverified] | AUD domestic; foreign currency for overseas publishers [unverified] | **Unclear** | No primary source found; see section 5 |

### Inferences
- **Low-FX, low-freeze setup suggested by the evidence:**
  1. A traditional Australian bank transaction account as the primary AUD receiver for Airbnb, Vrbo, the Stripe payout account (covering Hostaway direct bookings, Booking.com VCCs, deposits and Duve or Chekin upsells), Kobo (AUD), IngramSpark (AUD), APRA AMCOS, PPCA, CD Baby (NPP) and the KDP Amazon.com.au marketplace.
  2. A Wise account, which is on KDP's PSP list, holding USD, GBP and EUR local details for KDP's foreign marketplaces, to avoid Amazon's undisclosed conversion margin. Optionally also for Kobo or Apple if paid in USD or GBP.
  3. Payoneer only where it is mandatory (TuneCore).
- This also spreads the freeze risk: no single EMI holds all income. Moving AUD flows into a traditional bank keeps the core income stream away from any EMI's compliance holds.
- **Xero:** a single traditional-bank feed for most AUD income simplifies Xero reconciliation. Hostaway has no confirmed native Xero sync (section 10). I did not research Xero bank feeds for Wise, Payoneer or Stripe here; that belongs to a different research strand.

### Gaps
- The "yes / no / unclear" for Airbnb, IngramSpark, Apple, Kobo, APRA AMCOS and PPCA is "unclear" mainly because I could not read the primary pages in full and found no first-hand reports (Reddit was inaccessible). If confirmation is needed, the next step is a direct fetch of airbnb.com.au/help and kdp.amazon.com/help with those hosts allowed in the session's network settings.
