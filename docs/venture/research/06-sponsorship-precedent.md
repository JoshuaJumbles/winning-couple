# 06 — Sponsorship and partnership precedent

- Date:              2026-09-29
- Run by:            subagent
- Question:          Has anyone in board gaming ever run app sponsorships or
                     partnerships, and what did they actually look like? Is
                     sponsorship a realistic channel for a free app with no
                     budget, or a distraction?
- Confidence:        Medium-high on the negative, high on the economics.
                     BoardGameGeek's full rate card, Board Game Quest's prices,
                     Apple's affiliate terms, Shut Up & Sit Down's ad policy and
                     two retailer affiliate rates are all quoted from primary
                     pages and re-checkable. The weak points: BGG's live
                     advertising site returns HTTP 403, so its rates come from an
                     Internet Archive snapshot dated 2026-08-12 and could have
                     changed; every rate below is an *asking price*, not a
                     transaction price; and "no precedent found" is bounded by
                     what is publicly indexed — sponsor reads inside audio and
                     video are largely invisible to search, so a handful of small
                     app deals could exist without leaving a trace I could find.

## Summary

**No board game creator, podcast, newsletter or site was found to have taken
money from a tabletop utility app — a tracker, scorekeeper, or companion — ever.**
The buyers of board game media are physical-game publishers, crowdfunding
campaigns, retailers, and furniture/accessory makers, and the outlets' own
marketing says so: all seven advertiser testimonials BoardGameGeek publishes are
game publishers, and Meeple Mountain lists 60+ clients without a single digital
product among them. The closest precedents are adjacent, not applicable: one
B2B design SaaS bought a labelled sponsored article on the trade outlet
BoardGameWire (Boardssey, 6 May 2025); board game channels do take money from
*general-market* apps like Surfshark and Rocket Money, which are large
advertisers buying reach through agencies; and publishers do partner with apps —
but with studios (Dized with CMON, Steve Jackson Games, IELLO; Cephalofair with
Lucky Duck Games), and in one documented case a solo developer's popular
companion app was withdrawn precisely *because* he started charging for it.

The economics settle it independently of precedent. The cheapest meaningful
paid slot in this niche found with a published price is Board Game Quest
advertising at **$30/month**; the cheapest thing with real reach is a
BoardGameGeek podcast mid-roll at **$400**, with BGG's suggested entry package
starting at **$800** and a produced sponsored video starting at **$1,400**. Those
are prices for a $40–$120 physical product with a crowdfunding deadline, and
they are defensible at that margin. A free iOS app with no IAP has no revenue
per install to amortise them against.

**The affiliate alternative does not exist as a mechanism.** Apple removed
commissions on iOS apps and in-app content from its affiliate programme on
1 October 2018, and the successor Performance Partners programme covers music,
TV, books and audiobooks — not app downloads. There is no way to pay a board
game creator a percentage of anything a free, local-only, account-less app
generates. Chess.com, the one app that genuinely runs a creator programme in an
adjacent hobby, pays **15% of subscription revenue including renewals** — which
is exactly the lever Winning Couple has deliberately chosen not to have.

**Recommendation: treat paid sponsorship as out of scope for launch.** The
realistic version of this channel is unpaid: the only coverage found of the exact
app class Winning Couple belongs to is an editorial listicle whose author
volunteered that "*NONE* of the above links are affiliate links of any kind."

## Findings

### Method and scope

Worked four surfaces: (1) published rate cards and advertise/partner pages for
board game sites, newsletters and conventions; (2) sponsor disclosures on board
game YouTube channels, via a third-party sponsor-detection tool and targeted
searches of video descriptions; (3) app-to-publisher partnership cases in trade
press; (4) affiliate programme terms on both sides — retailers who pay creators,
and Apple, who would have to be the payer for an app.

Blocked or partial, recorded so the gaps are visible: **boardgamegeek.com,
rpggeek.com and videogamegeek.com all return HTTP 403** to automated fetching,
including with a browser user agent, so BGG's rate card was recovered from the
Internet Archive and its API terms are summarised from search snippets only;
**Kickstarter returned 403** on the Frosthaven update that documents the
Gloomhaven Helper licence dispute; the Dice Tower West media kit PDF downloaded
but its text was not extractable. No BGG forum threads were read. Full list of
failures in `06-sponsorship-precedent-data.json`.

### Observation: board game media sells ads, and none of the buyers are apps

BoardGameGeek runs the most professional ad operation in the hobby and publishes
everything. From the archived rate card (snapshot 2026-08-12,
`advertising.boardgamegeek.com`):

| Product | Price | Notes |
|---|---|---|
| Site-wide banners | **$100 per 100k impressions** | $500 minimum buy; 20k/day minimum burn |
| Home Page Hero (one day, 50% of top banner) | **$300/day** | "often fully booked out 3-4 weeks" |
| Geek Weekly email feature | **$350** | ~35,000 subscribers; image + 650 characters |
| Gone Cardboard email feature | **$400** | 40,000 opens/mailing; "only for games currently available" |
| Crowdfunding Weekly email feature | **$450** | active crowdfunding projects only |
| Podcast mid-roll (60s host-read) | **$400** | episodes "averaging 14,000+ downloads over the last 30 days" |
| Podcast pre-roll (60s host-read) | **$500** | up to 650 characters of approved text; runs 2 weeks |
| Crowdfunding Countdown feature | **$2,000** | one week, home page module |
| "In Focus" sponsored video (2–5 min, made in-house) | **from $1,400** | BGG YouTube 163,000+ subscribers |
| "How to Play" sponsored video (in-house, multi-camera) | **from $2,000** | |
| Suggested packages "The D4" → "The D20" | **$800 → $3,200** | |
| Affiliate links ("Buy a Copy") | **5% of all orders generated** | **retailers only** |

Claimed reach: 4.2–4.7M unique monthly visitors, ~80M monthly banner
impressions, 4M registered users; audience "spends over $500/year on gaming",
"average of 200 games owned", "92% have crowdfunded a project".

Two things in that page matter more than the numbers. First, the four
advertising categories are **Crowdfunding, Product & Event, Sponsored Video, and
Retailer Promotion & Integrations**. There is no app or digital category, and the
affiliate programme is explicitly for retailers wanting their store in the "Buy a
Copy" box. Second, the eligibility language is broad — "tailored to fit your
unique board game *or gaming-related product*" — so an app is probably not
*refused*; it is simply not a segment they sell to. Every one of the seven
testimonials BGG publishes is a physical-game publisher: Portal Games, Gamelyn,
Stonemaier, Druid City, Awaken Realms, Board & Dice, Thunderworks.

Smaller outlets tell the same story with smaller numbers:

- **Board Game Quest** — advertising "starting at $30/month"; reviews of
  published games free ("We never charge for reviews of published games");
  Kickstarter/Gamefound prototype preview **$350**. Review scope is stated as
  "games that have been published and are currently available for retail sale."
- **Meeple Mountain** — 180,000+ monthly views, 150,000+ monthly visitors, 12–15
  articles a week; lists Asmodee, Fantasy Flight and Stonemaier among "60+" game
  companies it works with. Options include newsletter sponsorship and gift-guide
  placement. **No prices published, and no mention of apps or digital products.**
- **Board Game Authority** — ~25,000 monthly visits, banner ads and press
  releases, no published prices.
- **The Dice Tower** — no public rate card for the channel or podcasts; an
  "adkit" is sent on request. Convention sponsorship is priced: Dice Tower West's
  top "Premier Sponsor" tier is **$7,500** (from search summary of their 2026
  media kit PDF; I could not read the PDF directly).

*Inference:* rates in this niche are mostly private and negotiated, and the
public ones are priced for a product with a retail margin and a launch date.
Nothing here is priced for a free app, and nothing here is structured to sell to
one.

### Observation: the only software found buying board game editorial is B2B

**Boardssey**, an all-in-one platform for board game designers, ran a sponsored
article on **BoardGameWire** on **6 May 2025** — "Boardssey: The All-in-One
Platform Reshaping How Board Games Get Made **[sponsored]**", with the
sponsorship marked in the headline and stated in the opening paragraph. Price not
disclosed. BoardGameWire's audience is industry professionals — designers,
publishers, developers. A tag search of the site surfaced no other sponsored
posts.

*Inference:* this is a real precedent that a software product can buy board game
media, but it is a B2B subscription tool addressing the trade, with revenue per
customer to justify the spend. It says nothing about selling a consumer app to
players.

### Observation: when board game channels take app money, the app is a general-market brand

Sponsor detections for **No Rolls Barred** (453k subscribers, 71.9k average
views): Geeknson (game tables, 13 videos), Game Nerdz (retailer, 12), AEG
(publisher, 5), Zatu (retailer, 4) — and then **Surfshark (VPN), Rocket Money,
Boot.dev and Freecash**. Estimated $719–$1.8k per sponsored video; sponsorship
estimated at 77% of the channel's revenue.

For **The Dice Tower**: Allplay (186 videos — a publisher that also makes game
tables, formerly BoardGameTables.com), Board Game Bliss (retailer, 16), Great
Tables Games & Bags (12), and **one** detected Board Game Arena video. Estimated
$90–$225 per sponsored video. For **BoardGameCo** (69.7k subscribers, 5.9k
average views): Allplay (137), Top Shelf Gamer (16), two one-offs. Estimated
$59–$147 per sponsored video.

Three caveats. These come from **SponsorRadar**, a third-party tool that infers
sponsors algorithmically from public video data — the brand attributions may be
wrong and **every dollar figure is an estimate, not a disclosed deal value**. I
use them only to characterise which *categories* of brand appear. I could not
identify the single Board Game Arena video, so treat that one as unconfirmed.
And note the contrast it sits next to: BoardGameCo publishes extensive
multi-game Board Game Arena review videos organically, while being sponsored by
Allplay — the digital platform gets free coverage, not paid placement.

*Inference:* the app money that reaches board game creators comes from
advertisers with large budgets and broad targeting, routed through agencies. That
is the opposite end of the market from a solo developer with a free app.

### Observation: the paid format in this hobby is the crowdfunding preview, and it is for physical games

The norm, stated by Jamey Stegmaier of Stonemaier Games in "Kickstarter Lesson
#188: No Money Changed Hands for This Review": reviews of released games are
unpaid, **previews of unreleased crowdfunding products are the thing people pay
for** — "You pay for the exposure." He cites Rahdo as the model for disclosing
when a preview was paid.

Prices, in descending order of reliability:

- **$350** — Board Game Quest's published prototype preview fee.
- **$500–$800** — "there are reviewers who ask $500-$800 for a Kickstarter
  preview", a commenter on the Stonemaier post. Unverified.
- **$25–$100** — typical preview fee with reviews free; a BGG forum claim
  surfaced via search. Unverified.

The dominant non-cash consideration is the review copy. Meeple Shelter (14 March
2022) estimates **$10,000–$20,000 a year** in gifted games for a channel covering
~150 titles annually, and notes that Alex Radcliffe of BoardGameCo buys everything
he reviews as a matter of principle.

*Inference:* a free app has no physical copy to send and no crowdfunding deadline
to buy urgency for. The niche's native paid-content product is one Winning Couple
cannot buy and one it does not want.

### Observation: the largest channel in the hobby refuses advertising outright

**Shut Up & Sit Down**, on their Patreon: "You won't find a single advert on our
website, and we don't accept money in exchange for reviews or muddy the water
with any Kickstarter kickbacks." 3,945 Patreon members, 1,358 paid, plus their own
PayPal/Braintree route that keeps 10% more than Patreon.

*Inference:* the single biggest audience in the hobby is not purchasable at any
price, and the reason — audience trust in independence — is the same reason that
a paid placement would be a weak signal for a free app even if it were affordable.

### Observation: app-publisher partnerships exist, and they are not for indies

Two documented cases, both instructive and neither encouraging:

**Dized** — the interactive rules and tutorial app — built official tutorials and
"living rules" with **CMON, Steve Jackson Games, IELLO and Horrible Games**, and
shipped publisher tools so companies could author their own rules and FAQ
content (announced from 2018 onward). Direction of payment not disclosed in
anything I found. This is the clearest example of an app-publisher partnership in
the hobby, and it required the app to be a rules platform publishers wanted
inside.

**Gloomhaven Helper** — the cautionary one. Esoteric Software built the
best-known third-party companion app for Gloomhaven **on a non-commercial basis
under an implied licence** from Cephalofair Games. When the developer began
charging for some versions, the publisher treated the implied licence as broken;
the developer ceased development and the app was withdrawn. Cephalofair then
partnered with digital studio **Lucky Duck Games** for official Gloomhaven and
Frosthaven companion apps, and the community filled the gap with forks
(Gloomhaven Secretariat, X-haven Assistant). Sourced from trade coverage
(TechRaptor, GamingTrend) and search summaries of the Frosthaven Kickstarter
update; the Kickstarter page itself returned 403.

*Inference:* publishers partner with apps that either carry their IP or serve
their rules-teaching problem, and they choose studios. A generic tracker offers a
publisher nothing to license. Worse, the one precedent where an indie companion
app touched a publisher's IP and tried to charge ended with the app gone. Winning
Couple's game-agnostic, no-IP design is the right side of that line — and the
reason no publisher has a reason to partner with it.

### Observation: BoardGameGeek's terms for third-party apps are restrictive, and no formal partnership programme exists

BGG's XML API Terms of Use **prohibit commercial use**; commercial use requires a
licence obtained from BoardGameGeek. (Summarised from search snippets — every BGG
wiki page returned 403 to direct fetching, so this needs a manual eyes-on check
before anyone relies on it.)

In practice the integration that exists is user-mediated, not partnered: **Board
Game Stats**, a paid app, posts plays to BGG using the user's own BGG credentials
and imports plays from BGG, Yucata and Board Game Arena. Neither the app's site
nor its FAQ mentions any partnership, licence or permission. BGG's only revenue
share with third parties is the retailer affiliate programme at 5% of orders.

The free channel that does exist: BGG's **Geek Tools** forum, where third-party
tools and bots are announced and developers request API access.

### Observation: affiliate is alive in board gaming, but only for physical goods — and Apple closed the door on apps

Real, published creator-side affiliate terms:

- **Miniature Market** — 5% commission, 7-day cookie.
- **Zatu Games → No Rolls Barred** — a named, dated deal: "Zatu will pay No
  Rolls Barred **1.7%** of any sales made", 45-day cookie.
- **BoardGameGeek** — 5% of all orders generated, paid monthly, retailers only.

And the blocker: **Apple removed commissions on iOS and Mac apps and in-app
content from its affiliate programme effective 1 October 2018** (having already
cut the app rate from 7% to 2.5% in April 2017). The successor **Apple Services
Performance Partners** programme's own overview lists Apple Music, Apple TV and
Apple Podcasts memberships plus movies, TV shows, books and audiobooks — apps are
absent.

The adjacent counter-example proves what it takes: **Chess.com** pays affiliates
**15% of subscription revenue, including renewals for as long as the member stays
subscribed**, and runs a streamer programme gated at 1,000 followers and 10
hours/month of live content.

*Inference:* this is structural, not a matter of effort. A free, local-only,
account-less app with no IAP has no transaction Apple or anyone else could pay a
percentage of. Affiliate is not a cheaper route to the same place; for this
product it is not a route at all. It would only become one if Winning Couple
acquired a paid tier — and study 01 already argued against metering.

### Observation: there is almost no editorial surface for utility apps, and the one that exists is free

- The Dice Tower's **"What's APPening"** is a live, active series (episodes
  through 29 September 2026) reviewing **digital adaptations of board games** —
  Dicefolk, Marvel Snap, 7 Wonders Duel, Terra Nil, Roll Player, Unmatched. It
  covers games, not trackers or companions, and no episode on the series page is
  labelled sponsored.
- **Everyday Meeple's "Top 5 BG Apps"** (October 2019) is the only piece found
  covering exactly Winning Couple's class of product — Meepster, Dized, Issuu,
  Chwazi, Board Game Stats, framed explicitly as "peripheral apps". The author
  states: "*NONE* of the above links are affiliate links of any kind", and marks
  each link "Non-affiliated".

*Inference:* coverage of companion and utility apps in this hobby happens as
unpaid, unsolicited editorial by people who use them. That is the channel, and it
is earned rather than bought.

### Caveats on the evidence

- **All prices quoted are asking prices.** Board gaming ad inventory is sold by
  individuals and small teams; discounting, bartering and comping are normal.
  Treat every number above as a ceiling for a well-prepared negotiator and as
  irrelevant to anyone who cannot pay it anyway.
- **BGG's rate card is an archived snapshot** (2026-08-12), recovered because the
  live site 403s. Verify before quoting to anyone.
- **SponsorRadar figures are algorithmic estimates** — both the sponsor
  attributions and the dollar ranges. The Board Game Arena/Dice Tower detection
  is unconfirmed.
- **"No precedent found" is bounded by indexability.** Sponsor reads live inside
  audio and video and often never appear as text. Small deals — a developer
  paying a 2,000-subscriber channel $50 — would be essentially invisible to this
  method. What the evidence supports is that *no visible, repeatable pattern of
  tabletop app sponsorship exists*, not that no such deal has ever happened.
- **Generic CPM benchmarks are not board-gaming data.** The podcast ($18–$26 CPM
  host-read; $100–$500/spot at 1k–10k downloads), YouTube gaming ($10–$25 CPM)
  and newsletter ($10–$30 CPM) figures in the data file come from general
  marketing sources and are included only to bound expectations.
- **One ROI datapoint, badly matched.** Rock Manor Games reported 255% ROI and
  "over $7k of Revenue" from BGG ads on the Maximum Apocalypse Kickstarter (27
  June 2017), at $0.19 CPC on banners. Self-reported, for a physical product with
  crowdfunding urgency, nine years ago. It is the best "does BGG advertising
  work" evidence available and it does not transfer to a free app.

## Implications for Winning Couple

1. **Close the open question with a no.** The context map asks "Is there
   sponsorship or partnership precedent in this niche?" The answer is: not for
   apps like this one, and the reasons are structural rather than circumstantial.
   Paid sponsorship should be explicitly out of scope for launch, and should not
   appear in the Phase 2 plan.
2. **Delete affiliate from the options list entirely, not just for now.** Apple
   pays no commission on app downloads or IAP, so there is no percentage to
   offer a creator. This is not a "when we have revenue" item either, unless the
   product acquires a subscription — which study 01 argued against. If anyone
   revisits this, the decision to re-open is "do we want a paid tier", not "do we
   want affiliates".
3. **Assumption 4 needs narrowing, not deleting.** "There is a reachable
   audience: creators and communities focused on two-player and couples gaming"
   survives, but the *reach mechanism* does not. The evidence says these creators
   are reachable through unpaid editorial, community posting and relationships —
   the Everyday Meeple listicle, BGG's Geek Tools forum, a creator who actually
   plays two-player and would use the thing. Study 19's creator list is the
   useful artefact; a media budget is not.
4. **Budget the smallest paid experiment, if any, at $30–$100 and treat it as a
   test, not a channel.** The only sub-$100 published option found is Board Game
   Quest advertising from $30/month. If Joshua ever wants to know whether paid
   board game media moves installs at all, that is the price of the answer. BGG's
   $500 minimum banner buy is the next rung and is not worth it for a free app
   with no attribution mechanism — note that with no accounts and no analytics
   decision made yet (open question in the context map), there is currently no way
   to measure whether a paid placement worked.
5. **If a sponsored placement ever happens, the format to ask for is a host-read
   spot with a description link, not a review.** BGG's own product defines the
   shape: 60 seconds, up to 650 characters of copy the host reads, two-week run,
   $400–$500. A dedicated produced segment costs $1,400–$2,000 when BGG makes it.
   A *review* cannot be bought from reputable outlets in this hobby, and the ones
   worth having advertise that they refuse to sell it.
6. **Do not pursue a publisher partnership.** Publishers partner with apps that
   carry their IP or solve their rules-teaching problem, and they hire studios.
   The Gloomhaven Helper case is the warning: a beloved indie companion app was
   withdrawn when it started charging, because its licence to the publisher's IP
   was only ever implied. Winning Couple's game-agnostic design keeps it clear of
   that risk and simultaneously removes any reason for a publisher to care.
7. **Treat a BGG presence as a free-channel task, not an advertising line.**
   Geek Tools is where third-party apps announce themselves. Note before building
   anything on BGG data: the XML API's terms prohibit commercial use without a
   licence, and this needs a manual eyes-on verification because BGG blocks
   automated reading.

## Open threads

- **Audio and video sponsor reads were not systematically checked.** Nothing
  short of listening to episodes will find a small app sponsorship. If this
  question ever needs a firmer answer, the cheap version is to ask two or three
  mid-size creators directly whether an app has ever approached them — which
  doubles as the outreach that actually matters.
- **The one Board Game Arena sponsored Dice Tower video was not identified.** If
  it exists, it is the single closest precedent to "a board game app paid a board
  game creator", and its format would be worth seeing.
- **BGG's actual position on an app advertising with them is untested.** Their
  copy says "board game or gaming-related product" and offers no app category. A
  one-line email to their ad team would settle whether a tracker app is sellable
  inventory to them and at what minimum — cheaper than any further desk research.
- **BGG's XML API commercial-use terms need a manual read.** Every BGG page 403s
  to automated fetching, so the restriction above is second-hand. It matters if
  Winning Couple ever wants a game database, which is a Phase 2 scope question.
- **Dized's commercial terms with publishers are opaque.** Whether publishers
  paid Dized, Dized paid publishers, or it was purely in-kind would be the most
  useful single fact about how app-publisher deals are actually structured in
  this hobby. Dized's current operating status was also not established.
- **Non-sponsorship paid channels were out of scope.** Apple Search Ads is the
  obvious omission — it is the one paid channel that targets people already
  searching an app store, is priced per tap, and has no minimum comparable to
  BGG's $500. It belongs in a separate study, and on the evidence here it is a
  much better use of any launch budget than board game media.
- **Convention presence was only glanced at.** Dice Tower West's sponsor tiers
  start well above a hobby budget, but small local game days and conventions may
  have $0–$100 table options where a two-player tracker could be demonstrated at
  the table. Untested, and closer to the product's natural context than any ad
  slot.
