# 02 — Collection managers and play loggers

- Date:              2026-09-29
- Run by:            subagent
- Question:          What does the collection-and-play-logging half of the category
                     look like, and where does a session-scoring app sit relative
                     to it?
- Confidence:        Medium-high on structure, medium on the headline claim.
                     App metadata, in-app-purchase price tables, and review text
                     all come from Apple's own endpoints and are saved in
                     [`02-collection-and-play-logging-data.json`](02-collection-and-play-logging-data.json)
                     so every count can be re-run. The BoardGameGeek API finding
                     is **high** confidence — I probed nine endpoints directly and
                     got HTTP 401 from all of them. Weak points: Apple's review
                     feed is a capped US sample (133 low-star reviews across 13
                     apps is enough to read themes, not to measure sentiment);
                     feature counts are regex hits on developer marketing copy and
                     undercount; no app was installed; and BGG's own forums and API
                     documentation are behind a Cloudflare 403, so the API-policy
                     narrative rests on a third-party client's commit log plus
                     search-result summaries rather than BGG's own words.

## Summary

**The gap study 01 identified is real, it is structural, and it is closing fast —
but not in the direction the review quote suggested.** Play-count-centric stats are
the *legacy* position of this half of the market, not its current one. Of 39
hand-verified collection managers and play loggers on the US App Store, 21 advertise
win/loss language and only 11 advertise play-count language; 11 apps talk about wins
and never mention plays, while exactly one does the reverse. The two apps that fit
the "plays, not victories" description are the two oldest and biggest: BG Stats
(first released 2014) and BoardGameGeek's own app. Everything shipped since 2025 —
and 25 of the 39 were first released in 2025 or 2026 — leads with win rates,
head-to-head records, streaks, and in one case a chess ELO rating per game.

**Session size: nobody here is built for two, and nobody is even trying.** Zero of
39 mention couples or partners as an audience (the one regex hit is "a couple of
premium features"). Six mention two-player or 1v1 at all, and in every case it is
one row in a feature list — a filter value, a comparison view between two rows of a
group leaderboard, or one of six result formats. The category's unit of work is a
*roster*: you maintain a list of people and pick from it each session. At n=2 that
machinery is pure overhead, and that is the one durable structural difference
between this half of the market and Winning Couple.

**The BGG metadata lookup that has been floated is no longer a free ride.**
BoardGameGeek's XML API started requiring registration and a bearer token in 2025;
as of 2026-09-29 every endpoint I probed — v1 and v2, `search`, `thing`, `hot`,
`collection`, `plays` — returns `401 Unauthorized. See
https://boardgamegeek.com/using_the_xml_api`. Twenty-six of the 39 apps depend on
that API, and BGG login/sync failure is the single most distinctive complaint in
their 2–3 star reviews (25 of 133). One app, BG Catalog, appears to have lost its
sync entirely in mid-2025 and has since removed BoardGameGeek from its App Store
description. A metadata lookup is not a small feature here; it is a dependency on a
gatekeeper that has recently started gating.

**On price, study 01's finding holds but the mechanism differs.** Only 3 of 39 charge
upfront, so the "nobody charges" observation survives into this half of the market.
But the monetisation is heavier: 20 of 39 sell in-app purchases, 9 of them by
subscription, and the highest listed price in the category is a $49.99 "lifetime"
unlock. The one app that *does* charge upfront, BG Stats at $5.99, draws the same
resentment study 01 found — not for charging, but for charging again after you have
paid.

## Findings

### Method and scope

Swept the US App Store through Apple's public search API across 39 query terms
aimed at the collection-and-logging half of the category ("board game collection
tracker", "boardgamegeek", "bgg collection", "board game play logger", "board game
shelf", "meeple", "bgg sync", "board game h-index", and 31 others), returning **902
unique apps**. Full term list and per-term result IDs are in the data file.

From those, **39 apps were hand-classified as board-game collection managers and/or
play loggers** after reading each full App Store description, plus **10 adjacent
apps** kept for reference (rules references, table toolboxes, discovery apps). Both
sets are labelled `core` and `adjacent` in the data file with a one-line category
each. Metadata from `itunes.apple.com/lookup`; in-app-purchase names and prices
scraped from each app's `apps.apple.com` product page on 2026-09-29; review text
from Apple's public customer-reviews feed (pages 1–10, both `mostrecent` and
`mosthelpful`).

I did **not** re-run study 01's live-scorekeeper sweep. Overlap between the two sets
is limited to the handful of apps that do both — Board Game Shelf, Scored, Match
Log, Board Game Stats.

Observation: the sweep saturated. A seventh batch of seven extra terms added 113 new
apps and **zero** new relevant ones (the new hits were D&D Beyond, Libib, a
soundboard, a dice roller). Read the 39 as near-complete for apps that advertise
themselves in these words in English on the US store.

### 1. Win/loss versus play counts — the gap is generational, not categorical

Counting description language across the 39 core apps:

| Advertises… | Count |
|---|---|
| Win/loss, win rate, head-to-head, streaks, leaderboard, or ELO | **21 / 39** |
| Play counts, H-index, most-played, times played, cost per play | **11 / 39** |
| Wins **but not** play counts | **11** |
| Play counts **but not** wins | **1** (Gametrove) |
| Neither (pure collection catalogues, lending trackers, planners) | **17** |

*Observation.* The 2-star Board Game Stats review that prompted this study is
accurate about Board Game Stats and inaccurate about the category in 2026. Verified
verbatim from the feed, titled "Wrong focus", 2 stars, v5.2.5, 2024-11-28:

> "This app is focused on the wrong aspect in my opinion.
>
> Most stats are based on number of plays, which is irrelevant. The stats that I
> want to focus on are wins and losses. Please contact me"

BG Stats' own description bears the reviewer out: its Statistics section leads with
"H-index, fives, dimes, quarters and centuries" and "cost per play". Win data
exists — "View a Player's personal H-index and win percentage" — but *winning
streaks* are listed under the **Power Expansion**, a $5.99 in-app purchase on top of
the $5.99 app. BoardGameGeek's own app description mentions wins **not once**.

Against that, the 2025–2026 cohort:

- **Scored: Board Game Tracker** (Adrian Cabala, free, no IAP, v1.6.7, 2026-09-21,
  [id6755980243](https://apps.apple.com/us/app/scored-board-game-tracker/id6755980243))
  opens with "ranks your skill with a real ELO rating — the same system used in
  chess" and lists "Win/loss records, streaks and performance trends" and
  "Head-to-head stats with every friend" as bullets one and two. It imports plays
  *from* BG Stats and recalculates ELO across the imported history — explicitly
  positioned as the wins-first alternative to the play-count incumbent.
- **BoardShelf: Game Collection** (9547-8715 Quebec Inc., free + $49.99 lifetime,
  v1.2.6, 2026-08-01, [id6788130641](https://apps.apple.com/us/app/boardshelf-game-collection/id6788130641))
  headlines: "The board game shelf that knows who actually wins," and ships
  "per-game win records ('Marie wins Quarrystone 69% of the time'), and head-to-head
  tallies between any two players."
- **Shelfline** (Parker Stafford, **$4.99, no IAP**, v1.0, 2026-07-16,
  [id6790876450](https://apps.apple.com/us/app/shelfline-board-game-tracker/id6790876450)):
  "Win rates for every player. Sarah is 7 and 1 at Azul, and she knows it."
- **Board Game Shelf** (Saku Studio, free + Pro, v3.9, 2026-09-13,
  [id6469036106](https://apps.apple.com/us/app/board-game-shelf/id6469036106))
  ships head-to-head as a Pro feature: "Player Comparison: pick any two players for
  a head-to-head breakdown of wins, win rates, longest streaks, favourite games, and
  a shareable rivalry card."

*Inference.* "Who is ahead, all time, at this game" is no longer an unserved need in
the collection half of the market — it is the standard pitch of every app launched
into it in the last eighteen months. Study 01's implication 2 ("treat the win-history
chart as the lead feature") is still the right feature call, but the window it
described has effectively closed on both sides of the split simultaneously. Winning
Couple's win history is now parity, not differentiation.

### 2. Session size — the roster is the assumption, and nobody breaks it

*Observation.* Across all 39 core apps:

- **0** mention couples, spouses, partners, or two-person households as an audience.
  The single regex hit is My Board Game Collection's "we have added ads & **a couple
  of** premium features."
- **6** mention two-player, 2-player, 1v1, or duel anywhere in the description. In
  every case it is a list item, not a stance:
  - **Match Log** (Takuya Yamaguchi, free + $2.99 remove-ads, v1.2.0, 2026-09-29):
    "1v1 with scores" is the first of **six** result formats, alongside ranked,
    free-for-all, team vs team, and co-op. This is the closest thing in the set to
    first-class two-player support, and its own positioning is "Built for game
    groups, playgroups, and tabletop regulars."
  - **Board Game Shelf**: two-player exists only as a *comparison* over a group
    dataset — pick any two of your players.
  - **BG Catalog**: "Compare 2 players to see who is better."
  - **BoardShelf**: "head-to-head tallies between any two players."
  - **LudoGuide**: "2 players, 45 minutes, something calm" — a filter example.
  - **Cardboard Companion**: "your favorite 2 player games" — a custom-list example.

*Observation.* Every core app's play-logging flow, as described, is the same shape:
maintain a roster of people and places, then pick participants per session.
BG Stats: "Set Players and Locations, including anonymous players." Board Game
Shelf's Pro tier sells **Player Groups** — "bundle your regulars into named groups
so logging a play takes a single tap" — which is a paid workaround for the cost of
the roster. Scored has registered friends, guests who can claim history later, and
automatic friend links. Meephics, Aftergame, MeepleUp, Meeple Guild, and Ludoya are
built around *group* accounts, shared logs, events, and RSVPs.

*Inference.* This is the one place where Winning Couple has something the whole
half-market structurally lacks, and it is the same finding study 01 reached from the
other pole, restated: the differentiator is the **absence of the roster**, not the
presence of head-to-head stats. Board Game Shelf charging for "Player Groups"
is direct evidence that the roster imposes a real per-session cost that developers
know about and are monetising. An app with exactly two permanent players never pays
that cost and never has to sell the fix. That claim is about a flow, and it is
checkable in a screenshot — same argument study 01 made about "no add-player
affordance," now with a price tag attached to the alternative.

### 3. BGG's API is now gated, and the whole half-market depends on it

*Observation (direct probe, 2026-09-29, saved in the data file).* Every
BoardGameGeek API endpoint I tried returns HTTP **401**, unauthenticated:

```
https://boardgamegeek.com/xmlapi2/search?query=wingspan   → 401 "Unauthorized. See https://boardgamegeek.com/using_the_xml_api"
https://boardgamegeek.com/xmlapi2/thing?id=266192          → 401 (same body)
https://boardgamegeek.com/xmlapi2/hot?type=boardgame       → 401
https://boardgamegeek.com/xmlapi2/collection?username=test → 401
https://boardgamegeek.com/xmlapi2/plays?username=test      → 401
https://boardgamegeek.com/xmlapi/search?search=wingspan    → 401   (the older v1 API too)
https://api.geekdo.com/xmlapi2/search?query=wingspan       → 401
https://boardgamegeek.com/using_the_xml_api                → 403   (Cloudflare interstitial)
https://boardgamegeek.com/applications                     → 403   (Cloudflare interstitial)
```

*Observation (corroboration).* The most widely used Python client for the API,
`bgg-api` (GitHub `SukiCZ/boardgamegeek`), added token support on **2025-08-24**
("Feat: Add access token. Fixes: #169", shipped as PyPI 1.1.13 on 2025-09-08) and
made the token **mandatory** on **2025-11-28** (PyPI 1.1.14, same day). Its issue
#169, opened 2025-08-24, quotes the BGG announcement thread and reads it as: "users
that access the BGG will have to provide their own custom token for authorisation.
This means that **every user** (not just every app) has to register and create a
token." Tokens are issued at `https://boardgamegeek.com/applications`.

*Caveat, flagged deliberately.* I could not read BGG's own words. Their forum threads
on this (3492262 "Registration and Authorization coming to the XML API", 3525319
"Registration to use the XML API… is now open", 3539581 "XML API: Read this for
uninterrupted access", 3577944 "The XML APIcalypse is coming!", 3602374 "XML API2
doesn't work anymore", 3600185 "Heads up… BGG now requiring authorization tokens")
exist in search results but all return 403 to automated fetching, as the brief
warned. **Whether a token is free, whether commercial/App-Store use is permitted,
what the rate limits are, and whether approval is discretionary are all unknown to
me.** That is the single most load-bearing unknown in this study and it needs a
manual pass.

*Observation.* What the API gives users, hand-coded from all 39 descriptions
(labels are in the data file under `bgg_integration_handcoded`):

| BGG relationship | Count | Examples |
|---|---|---|
| Native (it *is* BGG) | 1 | BoardGameGeek official |
| Two-way (read + write plays/collection) | 2 | Board Game Stats, Ludoya |
| Claims write-back | 3 | BGG Hub, BGG Companion, Board Game Scanner |
| Read-only import/lookup | 18 | Board Game Shelf, Scored, Overboard, Aftergame, Gametrove, Shelf, … |
| Degraded or unclear | 2 | BG Catalog, Board Game Snapshot |
| None claimed | 13 | BoardShelf, Shelfline, MeepleSlate, Match Log, GameShelf, … |

The user-facing payoff is consistent and modest: box art, player count, playtime,
weight/complexity, year, designer, and a searchable catalogue, so that adding a game
is a search or a barcode scan instead of typing. Overboard's disclaimer is the
canonical framing: "Overboard uses the BoardGameGeek API but is not endorsed or
certified by BoardGameGeek." BG Stats carries the risk warning in its own listing:

> "Please note that changes to the BGG website or API can temporarily break BGG
> related features. I cannot guarantee their continued availability."

*Observation.* **13 of 39 ship no BGG integration at all** and substitute barcode
scanning, OCR of a shelf photo, their own catalogue, or manual entry. Shelfline
($4.99): "search a catalog of hundreds of well known games." Board Game Scanner
validates AI-OCR results against BGG and puts that sync behind $1.99/month.
MeepleSlate ($0.99) is entirely manual and sells that as a feature: "without an
account, subscription, advertising, analytics, tracking, cloud dependency, or
required internet connection."

*Observation — the cautionary tale.* **BG Catalog** (Javier Perez Pacheco, free, no
IAP, 255 ratings, 4.54, v2.61, 2026-09-18,
[id1558147475](https://apps.apple.com/us/app/bg-catalog/id1558147475)) was a BGG
sync client; its 2022–2024 reviews are a continuous stream of login failures
("Can't log in due to an error message about 'too many calls being made to the BGG
website'", 1 star, v1.268, 2024-08-15). Its current App Store description mentions
BoardGameGeek **zero times**. Two independent reviews from July 2025 describe what
happened. From BG Catalog's own page (1 star, v2.7, 2025-07-14, "No Longer Useful"):

> "Loved this app for tracking my games up until the latest changes. I'll be looking
> for other options instead of continuing to use this. It's no longer user-friendly,
> and if I have to enter my data manually, I'd rather use a different format."

And from a 1-star review of the *official BGG app* (v1.18.2, 2025-07-06), titled
"Lesser app and bullying better 3rd party app":

> "I've been using the 3rd party BG Catalog app which used to sync information from
> BGG. According to the developer of BG Catalog, BGG changed their policies and are
> no longer allowing the BG Catalog app to sync with BGG accounts, even though it's
> not for profit. […] I'm in no way affiliated with the BG catalog app, just upset
> with BGG for being unreasonable"

*Inference, with the uncertainty flagged.* Two reviewers on two different app pages,
a week apart, describing the same cutoff, plus a description that has had BGG
scrubbed from it, is decent triangulation — but it is still hearsay about a private
decision, relayed second-hand. I could not reach the developer's site
(bgg-catalog.web.app serves only a privacy policy) or BGG's forums. Treat the
*existence* of a policy-driven cutoff as likely and the *reason* as unknown.

### 4. What the 2–3 star reviews complain about

*Observation.* Across 13 collection/logging apps with review volume, 133 reviews at
1–3 stars in Apple's capped sample:

| Theme | Count | Share |
|---|---|---|
| Paywall, ads, or price | 50 | 38% |
| Crash, freeze, bug, slowness | 48 | 36% |
| **BGG sync or login failure** | **25** | **19%** |
| Data loss | 2 | 2% |

The brief predicted sync problems, data loss, and import friction. **Sync is
confirmed and is the distinctive failure mode of this half of the market** — study
01 found no equivalent, because live scorekeepers have nothing to sync. **Data loss
is all but absent** (2 of 133), which is a negative result worth recording: the
reliability complaint here is "it won't connect", not "it lost my history". Import
friction shows up not as a complaint about importing but as a *switching blocker*.

BGG connection failures, verbatim:

> "Can't log into my bgg account so kind of pointless. Was able to log into bgg
> website to verify the info i put is correct so its the app itself." (Board Game
> Stats, 1 star, v6.14.2, 2026-07-18)

> "The functionality of this is supposed to be to download your BGG library and
> keep it synced. Sadly, it fails in this. After the initial download I have never
> been able to sync the app. I make changes in the website, and when I try to sync
> the app it always, ALWAYS fails." (BG Catalog, 2 stars, v1.200, 2023-10-06)

> "Also odd they don't tap into the BGG API to sync things back to it. So… I guess
> it's great if you're just getting into the hobby and/or manual data creation."
> (Overboard, 2 stars, v2.5, 2026-09-26)

> "I like the layout and functionality of this app however any data syncing with BGG
> doesn't seem to work. It continues to fail to load my collection and won't load
> any collections of friends." (BGG BoardGames Information, 1 star, v1.1.4,
> 2019-01-10)

Import friction as lock-in — the most strategically interesting review in the set,
because it is a user explaining why they cannot adopt a new app:

> "I have already been using bgstats app to track my games which syncs with BGG.
> However this app has no way to import my plays from either location. It will be
> impossible for me to start using this app without any import feature available.
> App looks great though!" (Board Games Companion, 3 stars, v1.10.1, 2023-05-03)

Multi-device incoherence, from a 17-year BG Stats user (2 stars, v3.1.2, 2020-09-10,
"Not multi-device friendly"), abridged:

> "The app does not recognize changes made to a game on one device on any other
> device as you have. […] If I modify a game playing on my iPad or iPhone it will
> update on BGG. However, it will not automatically update on the other device. I
> have to delete the play then re-imported, or manually make any updated changes."

Feature-bloat resentment, which is the mirror image of restraint:

> "Is there any way I can get the older version without that collection feature
> added? Very unnecessary for me. Also, the visual changed so much (cumbersome
> numbers in ranking, small fonts all over, absence of some pie charts) which I
> regret deeply to gave updated the app." (Board Game Stats, 2 stars, v3.7.1,
> 2021-12-06)

And the official BGG app's own reviews, which are dominated by two things unrelated
to tracking — forum moderation politics (5 of 11 one-star reviews sampled) and
mobile-versus-desktop parity. The parity complaint is directly relevant:

> "One of the major bonuses of this app is that people track their board game
> playing statistics, but the app features those statistics differently than the
> desktop version. For example, the desktop version tracks the number of individual
> game plays, whereas the mobile version will track game sessions. So if I play one
> game three times in a sitting, the desktop version will count that it's three
> plays, but the mobile version will only have it show up as one session." (3 stars,
> v1.19.1, 2025-12-29)

*Inference.* The reviewer is complaining, but they have described exactly the
distinction Winning Couple is built on — a *session* is the natural unit at a table,
and a *play count* is a database artefact. BGG's own app already quietly moved to
sessions on mobile. That is weak but real evidence that the session is the right
grain for a phone at a table.

### 5. Price — nobody charges upfront, but the IAP stack is heavy

*Observation.* Of the 39 core apps:

- **3 charge upfront**: Board Game Stats **$5.99**, Shelfline **$4.99**, MeepleSlate
  **$0.99**. That is 8%, against study 01's 7 of 161 (4%) for live scorekeepers.
- **19 have no in-app purchases at all.**
- **9 sell subscriptions.** **10 sell one-time IAP only.**

Verified IAP tables (scraped from each product page 2026-09-29):

| App | Upfront | In-app purchases |
|---|---|---|
| Board Game Stats | $5.99 | Power Expansion $5.99, Deep Stats $2.99, Tagging $2.99, Challenges $1.99, Cloud Sync $0.99/yr, plus four "tip" tiers $0.99–$14.99 |
| BoardShelf | Free (10 games) | **BoardShelf Lifetime $49.99** |
| Meeple Guild | Free | Pro $4.99/mo or $39.99/yr |
| Tabletop Codex *(adjacent)* | Free | Premium $3.99/mo or $39.99/yr, plus three tier unlocks |
| Aftergame | Free | Aftergame+ $2.49/mo or $22.49/yr; Aftergame Plus $2.49/$21.99; **Aftergame Star $9.99/$89.99** |
| Board Games – All My Matches | Free | Pro $3.99/mo or $24.99/yr, Expansion $3.99 |
| Shelf | Free (25 games, 10 plays) | Plus $3.99/mo or $19.99/yr |
| Board Game Shelf | Free | Pro Lifetime $11.95 **or** $4.95/yr, plus three tips |
| BGG Hub | Free | Ad-Free Lifetime $9.99 |
| LudoGuide | Free | Unlimited $0.99/mo or $8.99/yr |
| Gametrove | Free | Gametrove Pro $5.99 one-time |
| GameShelf | Free | Premium $4.99 one-time |
| BoardGameGeek (official) | Free | Ad removal $0.99/mo or $9.99/yr |
| Board Game Scanner | Free | Boardgame Pro $1.99/mo (BGG sync is *inside* the paywall) |
| Match Log | Free | Remove Ads $2.99 |
| My Board Game Collection | Free | Premium Upgrade $1.99 |
| Scored | Free | **none** |
| Shelfline | **$4.99** | **none** |
| MeepleSlate | **$0.99** | **none** |
| BG Catalog | Free | **none** |

*Observation.* Study 01's "metered free tier is the most-resented pattern" applies
here too, and the meters are explicit: Shelf gives 25 games and 10 plays free;
BoardShelf gives 10 games free then asks $49.99; Board Game Scanner puts the BGG
sync — the app's entire premise — behind $1.99/month.

*Observation.* Users accept paying, and resent paying *twice*. BG Stats holds 4.87
across 452 ratings while charging $5.99 upfront, so the price plainly does not block
adoption. The complaints are all about the à-la-carte stack on top of it:

> "You have to pay to purchase the app and then you have to pay to get full usage of
> the app. I hate how I can't see certain statistics that I'm tracking." (2 stars,
> v6.12.2, 2026-04-18, "Paywall")

> "Cool app - it was just disappointing that 3 minutes into the app I just bought I
> had to spend more money on the challenges (the only reason I bought it). This
> should be listed as in-app purchases." (3 stars, v4.6, 2024-01-06)

> "I'm not really crazy about how all the extra little things are $2. Just point me
> toward the full paid version and I'll buy it for like $10-$15, but separating out
> all the features makes me not want to buy any of them." (3 stars, v3.9.7,
> 2022-02-25)

The same objection, from the opposite pricing model:

> "I think this app is really cool and deserves to be paid. But subscription doesn't
> make sense as a model. […] Should I really expect to pay every month indefinitely
> to access a small library of content? Please consider alternate methods of
> funding." (Tabletop Codex, 3 stars, v1.1, 2024-11-09)

*Inference.* The willingness-to-pay question study 01 left open has a partial answer
in this half of the market: **a single honest upfront price in the $1–$6 band is
accepted** (BG Stats at $5.99 with 452 ratings and 4.87; Shelfline at $4.99 with no
IAP; MeepleSlate at $0.99 with no IAP and a privacy pitch). What generates 2- and
3-star reviews is *unbundling* — an upfront price followed by expansions, or a
subscription for a static feature set. Sample size on the two new paid apps is
negligible (1 rating and 0 ratings), so the only strong data point is BG Stats.

### 6. Incidental observations

- **Update cadence is high, and the cohort is young.** 29 of 39 were last updated in
  2026, 7 in 2025. Only 3 are stale (2021, 2022, 2023). And **25 of 39 were first
  released in 2025 or 2026** — 17 in 2026 alone. This is an actively crowding space,
  not a settled one.
- **Brand collision.** "Your Game Stats" ([id6737965870](https://apps.apple.com/us/app/your-game-stats/id6737965870),
  free, v1.0.4, 2025-10-21) is published under the seller name **"Board Game Stats
  LLC"** and is unrelated to Eerko Vissering's Board Game Stats / BG Stats. Worth
  knowing if Winning Couple's own name search hits something similar.
- **"Meeple" is the crowded keyword, not "couple".** The sweep turned up Meeple
  Tracker, MeepleVault, MeepleUp, Meeple Guild, MeepleSlate, MeepleBee, Meepleville,
  Meephics, and Meeple Guild — nine apps, almost all from 2025–2026, almost all with
  0 or 1 ratings. Whatever Winning Couple's App Store keywords end up being, "meeple"
  is contested and "couples" is (per study 01) mis-shelved.
- **The AI-picker feature is the current land rush.** Shelf, Shelfline, LudoGuide,
  Klack, Board Game Shelf, BoardShelf, Meeple Guild, BGG Companion, and Board Game
  Sidekick all ship some version of "tell me what to play tonight." It is irrelevant
  to a two-player app with a small shared shelf, and it is where this half of the
  market is currently spending its effort — which is good news for anyone competing
  on the session log instead.

## Implications for Winning Couple

1. **Do not add a BGG metadata lookup without first establishing whether you are
   allowed to.** This is the study's most actionable finding and it inverts the
   floated feature. The API returns 401 to unauthenticated callers as of today;
   access requires registering an application with BoardGameGeek; and there is
   second-hand but corroborated evidence that BGG has cut off at least one
   non-commercial third-party app (BG Catalog) since the policy change. 25 of 133
   low-star reviews in this half of the market are people whose BGG connection
   broke. Before any work goes into this: read BGG's terms at
   `boardgamegeek.com/using_the_xml_api`, apply at `boardgamegeek.com/applications`,
   and find out whether a free App Store app qualifies. **Both must be done manually
   — Cloudflare blocks automated access.**
2. **If metadata lookup is wanted anyway, barcode scanning or a small bundled
   catalogue is the de-risked path.** 13 of 39 apps in this half of the market ship
   *no* BGG integration and use barcodes, OCR, or their own lists. Shelfline charges
   $4.99 with a catalogue of "hundreds of well known games." A two-player household
   plays from a shelf of tens of games, not thousands; a bundled list plus manual
   entry may be entirely sufficient, and it has no third-party dependency to lose.
   Note that hand-typing a game name — the current behaviour — is the thing BG
   Catalog's users called a reason to leave, so *something* should improve here.
3. **Stop treating the win-history chart as the differentiator; start treating the
   absent roster as it.** Study 01 concluded the win chart was the lead feature and
   that its value was decaying. This study shows the decay is complete: 21 of 39
   collection apps and every 2025+ entrant now advertise win rates and head-to-head.
   What *no* app in either half does is assume two permanent players. The evidence
   that this has value is that Board Game Shelf **sells** the workaround — "Player
   Groups… so logging a play takes a single tap" is a Pro feature, which means
   developers have measured roster friction and priced it.
4. **Session, not play count, is the right unit — and there is now evidence for it.**
   BoardGameGeek's own app already logs sessions where its desktop site logs plays,
   and a reviewer flagged the divergence (3 stars, v1.19.1, 2025-12-29). Winning
   Couple's per-session model matches what mobile board-game tracking has drifted
   toward, and it should be described that way in the listing: a record of *evenings*,
   not a tally of plays.
5. **On price: a single upfront price is viable, unbundling is not.** This half of
   the market gives the first real data on assumption 5. BG Stats sustains $5.99
   upfront at 4.87 across 452 ratings — people do pay in this hobby. Every price
   complaint in the sample is about paying *again*: expansions on top of an upfront
   price, subscriptions for static features, or a meter (25 games, 10 games, 10
   plays). If Winning Couple ever charges, it should be one price for everything,
   once. The $49.99 BoardShelf lifetime tier and the $89.99 Aftergame Star tier are
   the visible ceiling of what this category will try, not what it can sustain.
6. **Do not build collection management.** It is the most crowded, most commoditised,
   most API-dependent surface in the whole category — 39 apps, 17 first shipped in
   2026, all racing on the same AI game-picker feature. A BG Stats reviewer asked to
   *downgrade* to escape a collection feature ("Is there any way I can get the older
   version without that collection feature added? Very unnecessary for me," 2 stars,
   v3.7.1). For a couple with a shelf they can see from the sofa, a catalogue is
   maintenance, not value. Every constraint-based argument in decision-making here
   points the same way as study 01's restraint argument.
7. **Nothing changes about assumption 2 or 4.** This study found no evidence about
   paper/notes-app baselines or reachable communities beyond a single Board Games
   Companion reviewer saying spreadsheets and BG Stats are what they currently use.

## Open threads

- **BGG's actual API terms are unread and this is the biggest hole in the study.**
  Is a token free? Is App Store distribution permitted? Are there rate limits or
  attribution requirements? Is approval discretionary — and if so, on what grounds
  was BG Catalog apparently refused? Everything in finding 3 about *policy* is
  second-hand. `boardgamegeek.com/using_the_xml_api` and
  `boardgamegeek.com/applications` both need a manual visit from a browser, as do
  the seven forum threads listed in the data file.
- **Did BG Catalog really lose BGG access, and why?** Two independent reviews and a
  scrubbed description say yes. The developer (Fco. Javier Perez Pacheco,
  bgg-catalog.web.app) is reachable and this is the single most informative
  conversation available about the risk of depending on BGG.
- **Scored is the app to watch and it has zero reviews.** Free, no IAP, ELO per
  game, wins-first, imports from BG Stats and BGG, shipped v1.6.7 in September 2026.
  It is the clearest statement in the market that "wins not plays" is the new
  position, and there is no user signal on it at all. Worth installing.
- **Does anything degrade visibly at n=2 in this half?** Study 01 had the Games
  Keeper four-scorecards review as direct evidence. I found no equivalent: no review
  in the 133-review sample complains about two-player handling in a collection or
  logging app. That is a negative result, and the honest reading is that it is
  *unevidenced* rather than *disproved* — these apps' users are hobbyists with large
  collections and groups, who may simply not be the two-player population.
- **No app installed.** Every feature claim except the review quotes is developer
  copy. BG Stats, Board Game Shelf, Scored, and BoardShelf are the four worth hands-on
  time — specifically to see how many taps a two-person session log actually costs.
- **BoardShelf's $49.99 is unexplained.** It is more than 8× the next-highest price
  in the category, on an app with 0 ratings and no BGG dependency. Either a pricing
  experiment or a mistake; either way it is the outer bound of what someone thinks
  this data is worth, and it would be useful to know if anyone buys it.
- **Non-App-Store tooling is still unexamined**, as in study 01. BGG's own website,
  spreadsheets, and Notion templates are where a lot of this tracking actually
  happens, and several reviews here treat BG Stats plus the BGG website as the
  incumbent pair.
