# 07 — Name availability and discoverability: "Winning Couple"

- Date:              2026-09-29
- Run by:            subagent
- Question:          Can we ship under the name "Winning Couple", and will anyone find it?
- Confidence:        **High on collisions, high on semantics, medium on search behaviour,
                     low-to-medium on social handles.** The collision and trademark
                     findings come from Apple's public search API and the USPTO's own
                     search backend, and both are re-runnable from the commands cited
                     below. The semantic finding (what the phrase already means) is the
                     strongest result in the study: it reproduces identically across
                     three independent surfaces. Search-behaviour findings use App Store
                     result counts and competitor rating counts as *proxies* for demand —
                     no keyword-volume tool was available, and that is a real weakness.
                     Social handles are the weakest section: several platforms cannot be
                     checked reliably without signing in, and each unverified one is
                     marked as such rather than guessed.

## The limitation to read first

**True App Store name availability can only be confirmed inside App Store Connect**,
which requires Joshua's developer credentials, which I do not have and did not use.
Apple reserves app names privately: a name can be held by a developer for up to 90
days without any public artefact existing. Everything below establishes that **no
visible collision exists** across four storefronts. That is strong evidence, not
proof. The 60 seconds of typing "Winning Couple" into App Store Connect's new-app
form is still the only definitive check, and it should be done before any listing
asset is made.

Two smaller method limits, stated up front: Apple's search-hints endpoint
(`search.itunes.apple.com/.../MZSearchHints.woa`) returned an empty `hints` array for
every term tried, so App Store autocomplete could not be sampled; and Justia's
trademark search sits behind a Cloudflare challenge (HTTP 403), so the trademark
section relies on the USPTO's own backend instead.

## Summary

**The name is legally and commercially clear, and it is a discovery liability. Both
are true, and the second matters more.** There is no app called "Winning Couple" on
the US, UK, Canadian or Australian App Stores; no US trademark contains the phrase;
`winningcouple.com`, `.app`, `.net`, `.co`, `.io` and `.games` are all unregistered.
Nothing blocks shipping under this name.

But the phrase is not neutral — it already means two specific things, neither of them
this app. Google's autocomplete for "winning couple" returns ten suggestions and
**all ten are reality television** (Love Island ×4, Strictly Come Dancing, couples'
Halloween costumes); "winning couple app" and "winning couple game" return *zero*
suggestions. And where the phrase has been claimed as a handle, gambling claimed it:
`@WinningCouple` on X is a South African Betway tipster account, and `@WinningCouple`
on YouTube is a couple who film bingo halls and pull tabs. Independently, 20 of the
45 live US trademarks in Class 9 (software) containing "WINNING" belong to casino and
lottery firms — IGT, Bally, Aristocrat, Light & Wonder, WMS, Playtika.

The concrete cost is measurable. Across 259 apps swept from this category, **228
(88%) put a category keyword — score, tally, track, counter, point, game — in their
App Store name**, because the name field is the highest-weighted ASO field Apple
offers. "Winning Couple" spends all of it on two words that pull toward relationship
apps and betting. Searching the App Store for "winning couple" today returns 49
results: Paired (208,099 ratings), Couple Life 3D (92,217), Couple Joy (38,070) — and
not one app containing the word "winning". Study 01's conclusion holds and hardens:
this app will be found on tracker keywords or not at all, and the name contributes
nothing to that.

The name is not, however, a recall problem. Tested against nine real apps, **an exact
two-word App Store title reliably ranks #1 for itself** — including "Scorepad for
Two", which has 13 ratings and has not shipped since 2020. Anyone told the name will
find the app. Nobody will discover it by accident. Keep the name if it earns its
place in the screenshots and in narrated channels; do not expect it to earn its place
in search. The App Store *name field* should carry tracker vocabulary alongside it.

## Findings

### 1. Collisions: none visible, anywhere

**Observed.** Apple's public search API, `itunes.apple.com/search`, queried
2026-09-30 01:08–01:15 UTC, `entity=software`, `limit=200`, across five terms
("winning couple", "winningcouple", "winning couples", "couple score", "couples
scorekeeper") × four storefronts (`country=us`, `gb`, `ca`, `au`) = 20 queries,
2,800+ result rows. **Zero apps whose name or seller name contains "winning" and
"couple".** Zero apps named "Winning Couple" or any variant.

The only apps matching `/winn?ing/` at all across the whole sweep surfaced under the
concatenated term "winningcouple":

| App | Seller | Store | Track ID |
|---|---|---|---|
| Winning Edge Investments | Horseracing Professionals Pty Ltd | AU, CA | 1468888308 |
| Winning Post | 9791 Media LTD | GB | 6758026125 |
| Winning Edge AI | SmartGPT LLC | US | 6451224904 |
| iWon - Start Winning | Turner Eison | US, CA | 1604013995 |
| Winnings | Revolve Works LLC | US, CA | 6477840518 |

Three of the five are horse-racing or betting products. *Inference:* the semantic
pull of "winning" toward gambling shows up even in a name-collision sweep that was
not looking for it.

**Observed.** Other Apple entity types, `country=us`, same session: `entity=movie`
and `entity=tvSeason` for "winning couple" return **0 results each**. `entity=ebook`
returns 30, none titled "Winning Couple" (nearest: *Winning Marriage*, Marc Solomon,
2015; *Winning Your Wife Back Before It's Too Late*, Smalley, 2004). `entity=song`
returns 25, none titled "Winning Couple". `entity=podcast` returns 25, none named for
the phrase.

**Observed.** Web search for the phrase plus "board game", "card game", "product" and
"book title" surfaced no product, game or book called "Winning Couple". The only
direct hit for the exact phrase as a *product name* is Joshua's own public repository,
`github.com/JoshuaJumbles/winning-couple`, which is already indexed and already ranks
for `"Winning Couple" app board game score tracker`.

**Negative result, and a real one:** there is no squatter, no abandoned app, no
dormant trademark, no book and no game standing in the way. This is the clean half of
the study.

### 2. What the phrase currently surfaces: reality TV, then gambling

This is the finding that matters, and it reproduces on three independent surfaces.

**Observed — Google autocomplete** (`suggestqueries.google.com/complete/search`,
`client=chrome`, 2026-09-30). Query `winning couple`, all ten suggestions returned:

```
winning couple of love island
winning couples halloween costumes
winning couples of love island usa
winning couple love island season 8
winning couple love island season 7
winning couples costumes
winning couple love island odds
winning couple costume ideas
winning couples of strictly come dancing
winning couple quotes
```

Queries `winning couple app` and `winning couple game`: **zero suggestions returned
for either.** Google's suggestion index has no record of anyone completing that
phrase toward software.

For contrast, the same endpoint on `two player score` returns: *two player score
counter, two player scoreboard, two player score keeper, two player score tracker, 2
player score keeper, 2 player score board, 2 player score counter online, 2 player
score sheet, 2 player scorer, two player stats.* Ten suggestions, all of them this
app.

**Observed — general web search** for `"winning couple"` returns, in order: an IMDb
episode page for *The Real Love Boat* ("And the Winning Couple is…", 2022); Love
Island USA season 7's winners; *Bachelor in Paradise* 2025; *Dancing with the Stars*
season 34. *Inference:* this is not one trademark to work around — it is a **generic
news phrase that regenerates every television season**, which is worse. There is no
owner to outrank, only an annual refresh of higher-authority pages.

**Observed — the handles that exist are gambling.** Both live `@WinningCouple`
accounts found are betting-adjacent:

- **X / Twitter, `x.com/WinningCouple`** — display name "TheWinningCouple", bio
  "Love and peace / Punters / Code sharing edit if you want / Betting daily profit",
  location Soweto, South Africa, joined December 2022, 8 followers, 3 posts, all three
  sharing Betway booking codes. Dormant since 2023-01-15. Read 2026-09-30.
- **YouTube, `youtube.com/@WinningCouple`** — channel title "Couple's Cardboard Crack
  & Coveralls", channel ID `UC01T-st76VG6siSnPt32eMg`, **joined 2026-09-14** (two
  weeks before this study). Description, verbatim from the page's embedded JSON:
  "We are a couple who love the thrill of the game! From the high energy bingo halls
  to the satisfying rip of a pull tab! Whether we are screaming 'BINGO!', chasing a
  massive progressive jackpot, or pulling our way through a stack of cardboard crack
  aka pull tabs, we are taking you along for the entire ride." *("Coveralls" is a
  bingo term; "cardboard crack" here means pull tabs, not board games — a
  near-miss that is itself instructive.)*

**Observed — US trademarks agree.** Of 45 live US trademarks in International Class 9
(software) whose wordmark contains "WINNING", **20 are owned by, or describe, casino,
slot, lottery or betting businesses**: IGT (WINNING 777), Bally Gaming (WINNING
TIMES), Aristocrat Technologies (WINNING DRIVE), Light & Wonder (WINNING TIMES, SUPER
WINNING STREAK ×2), WMS Gaming (WINNING STREAK), Playtika (WINNING SPINS), Video
Lottery Technologies (WINNING TOUCH), Multimedia Games (WINNING FORECAST), Incredible
Technologies (WINNING WALL), Allwyn International (ALLWYN WINNING AWAITS), Euro Games
Technology, Savvy Dog Systems, and others.

**Observed — even the App Store's tracker vocabulary drifts that way.** A search for
`win loss tracker` (US, software) returns CasinoIQ: Gambling Tracker (124 ratings) at
#3 and Smart Gambler at #4.

*Inference:* "Winning" in a software context reads as *gambling* to the indexes that
matter, and "couple" reads as *relationship*. The combination lands the name in the
intersection of two established meanings and outside its own category. This is a
semantic problem, not an availability problem, and no amount of App Store Connect
confirmation fixes it.

### 3. Search behaviour: where the room actually is

**Method and its limits.** No keyword-volume tool (App Store Connect's own search
popularity, Sensor Tower, AppTweak) was available. I used two proxies: Apple's
`resultCount` for a term, and the rating counts of the top ten results, which
approximate how entrenched the incumbents are. Rating count is a lagging and gameable
measure; treat the table as ordinal, not as a demand estimate.

App Store, US, `entity=software`, `limit=20`, 2026-09-30:

| Term | Results | Top-10 median ratings | Top-10 max | Reading |
|---|---:|---:|---:|---|
| `scorepad` | 17 | **13** | 4,288 | **Most room.** Top hit is Scorepad for Two — 13 ratings, dead since 2020 |
| `score pad` | 17 | **26** | 4,288 | Same lane, same emptiness |
| `head to head record` | 15 | 9 | 64 | Empty, but returns voice recorders — the phrase is not understood as a query |
| `score tracker` | 18 | 80 | 26,195 | Weak middle, strong head (Scoreboard - On The Go) |
| `board game stats` | 19 | 114 | 4,288 | Owned by one incumbent; three of the top ten have 0 ratings |
| `win loss tracker` | 19 | 124 | 398,865 | Drifts to gambling apps |
| `board game score tracker` | 20 | 452 | 12,092 | **Four of the top ten have 0 ratings** — contested but penetrable |
| `scoreboard app` | 20 | 976 | 26,195 | Entrenched |
| `board game score` | 20 | 978 | 12,092 | Entrenched |
| `score keeper` / `scorekeeper` | 20 | 978 | 26,195 | Entrenched |
| `card game score` | 20 | 1,392 | 12,092 | Entrenched |
| `tally counter game` | 20 | 1,416 | 13,832 | Entrenched, wrong intent |
| `game night scores` | 20 | 3,906 | 206,211 | Apple Sports lands here |
| `two player score` | 19 | 4,689 | 201,248 | **Poisoned** — Head Ball 2 (201k ratings) takes #1 |
| `couples game night` | 19 | 9,330 | 44,054 | Relationship and party games only |
| `game score` | 18 | 12,092 | 853,752 | theScore, Apple Sports |
| `couple score tracker` | 20 | **21,211** | 1,024,456 | Between, Couple Joy, Paired |
| **`winning couple`** | 19 | **6,759** | 208,099 | **Zero score trackers. All relationship apps.** |

Top four results for `winning couple` (US, 2026-09-30): Between, Couples Love Tracker
(21,211 ratings); Paired: Couples & Relationship (208,099); Couple Life 3D (92,217);
Couple Run! (6,691). Apple's matcher appears to drop "winning" entirely — not one of
the 49 returned apps contains the word.

**Observed.** Google autocomplete confirms the tracker vocabulary independently:
`board game score` → *tracker, tracker app, scoreboard, keeper, tracker online, sheet,
book, counter, app, scorer.* `app to keep score` → *for card games, at a baseball
game, of games, for volleyball, for darts.* People type **score / keeper / tracker /
counter / sheet / pad**, plus a game or context noun. Nobody types a brand.

*Inference:* the openings are `scorepad` / `score pad` (17 results, top-10 median 13
ratings — genuinely uncontested, and the incumbent is a corpse) and, secondarily,
`board game score tracker` (four zero-rating apps in the top ten, so the ranking is
soft). The terms to avoid spending anything on are `two player score`, `couples game
night` and anything containing "couple" — study 01 said this and the numbers above
say it again with a different instrument.

### 4. The name field is where this category buys its keywords

**Observed.** Swept eight category terms (`board game score tracker`, `score keeper
game`, `board game stats`, `scorepad`, `card game score`, `game night scores`, `score
tracker`, `two player score tracker`) at `limit=50`, deduplicated to **259 unique
apps**. Of these, **228 (88%) have a category keyword — score, scoring, point, tally,
track, tracker, counter, scoreboard, scorepad, or game — in their App Store name.**
Restricting to the tighter set (score / tally / tracker / counter only): **183 of 259
= 71%.** The 31 with no keyword are almost all not score trackers (Apple Sports,
Coin Master, eFootball, Rummy 500, Spades by Pokerist).

The pattern is visible in the leaders' names: "Keep Score: Game Score Tracker",
"Score Anything – Scorekeeper", "Board Game Now - Score Tracker", "Match Log: Board
Game Tracker", "Pointster: Board Game Scores", "Board Game Stats".

*Inference:* the 30-character name field is the highest-weighted ASO surface Apple
offers, and 88% of this category treats it as keyword inventory rather than as a
brand. A bare "Winning Couple" forfeits that inventory and spends it on two words
that rank the app next to Paired. This is the single most concrete cost of the name,
and it is fixable without changing the name: ship as **"Winning Couple: Score
Tracker"** or **"Winning Couple — Board Game Scorepad"** and the brand survives while
the keywords do their work.

### 5. Does exact-name recall work for a two-common-word title?

The obvious worry is that a name made of two common words disappears into its own
search results. **Observed:** tested nine real apps by querying their exact title on
the US App Store and recording where they rank:

| Query | Results | Own rank | Note |
|---|---:|---:|---|
| `score anything` | 24 | **1** | Two common words |
| `board game shelf` | 24 | **1** | Three common words |
| `match log` | 25 | **1** | Two common words |
| `keep score` | 23 | **1** | |
| `games keeper` | 25 | **1** | |
| `board game now` | 22 | **1** | |
| `pointster` | 21 | **1** | Coined word |
| `scorepad for two` | 22 | **1** | **13 ratings, last shipped 2020-06-22** |
| `countable` | 23 | **8** | Single common word — loses to civic-tech apps |

*Inference:* a *multi-word* exact title wins its own query even when the app is tiny
and abandoned; the failure mode is the *single* common word (Countable at #8). So
"Winning Couple" would almost certainly rank #1 for "winning couple" once published.
The name is safe for word-of-mouth, referral links and press. It is useless for
discovery. Those are different problems and the name only fails one of them.

*Caveat:* this is nine observations, all of published apps with some history. It does
not prove a brand-new zero-rating app ranks first on day one.

### 6. Domains

**Observed**, WHOIS and RDAP (`rdap.org`), 2026-09-30 01:12 UTC:

| Domain | Status |
|---|---|
| `winningcouple.com` | **Available** — "No match for domain WINNINGCOUPLE.COM" |
| `winningcouple.app` | **Available** — RDAP 404 |
| `winningcouple.net` | **Available** — "No match" |
| `winningcouple.io` | **Available** — "Domain not found" |
| `winningcouple.co` | **Available** — "The queried object does not exist" |
| `winningcouple.games` | **Available** — RDAP 404 |
| `winningcoupleapp.com` | **Available** — "No match" |
| `joshuajumbles.app` | **Available** — RDAP 404 |
| `jumbles.app` | **Available** — RDAP 404 |
| `joshuajumbles.com` | **Registered — Joshua's own.** Tucows (Hover), created 2017-01-17, updated 2026-08-06, NS `ns1/ns2.hover.com`, registrant privacy-shielded, country CA |
| `totaltossuplive.com` | Registered, same Tucows/Hover pattern, created 2026-08-07 — confirms the registrar of record is Hover, consistent with project memory |

All six `winningcouple.*` variants are free. That is unusually clean for a
two-common-word English phrase, and is itself mild evidence that nobody has tried to
build a brand on it.

*Practical note:* `.app` is in the HSTS preload list — every `.app` site must serve
HTTPS, with no plaintext fallback. Fine for a static marketing page; worth knowing
before buying.

### 7. Social handles

**Method and its honest limits.** GitHub was checked via its public API (definitive).
Bluesky via `com.atproto.identity.resolveHandle` (definitive). TikTok and YouTube by
fetching the profile page and reading the rendered error or channel metadata
(reliable). Instagram and X were read in a browser without signing in. **Reddit and
Threads could not be checked** — Reddit's about.json returns 403 to automated
requests and Threads returns an identical 200 for both live and missing handles.
Unverified is reported as unverified.

| Platform | `winningcouple` | `winningcoupleapp` | `joshuajumbles` |
|---|---|---|---|
| GitHub | **Available** (API 404) | **Available** (API 404) | Taken — Joshua's own (API 200) |
| TikTok | **Available** — "Couldn't find this account" | **Available** | **Available** — "Couldn't find this account" |
| Bluesky | **Available** — handle unresolvable | **Available** | **Available** |
| X / Twitter | **TAKEN** — "TheWinningCouple", Betway tipster, 8 followers, dormant since 2023-01-15 | **Available** (404) | **Available** (404) |
| YouTube | **TAKEN** — "Couple's Cardboard Crack & Coveralls", bingo/pull-tab channel, joined 2026-09-14 | **Available** (404) | Taken — "Joshua J. Jumbles", presumed Joshua's own; **confirm** |
| Instagram | **Unclear** — "Profile isn't available. The link may be broken, or the profile may have been removed." Instagram shows this for both never-existed and removed handles, so availability is *not* established | **Unclear** — identical response | Taken — Joshua's own: "Joshua Jumbles (@joshuajumbles)", 533 followers, 148 posts |
| Reddit | **Not checked** (403) | **Not checked** | **Not checked** |
| Threads | **Not checked** (ambiguous 200) | **Not checked** | **Not checked** |

*Inference:* the two platforms where the bare handle is gone are the two where it was
claimed by gambling accounts, which is the same finding as section 2 arriving by a
third route. Both are low-value accounts — 8 followers, and a two-week-old channel —
so neither is a brand-confusion threat. But the bare handle is unavailable on X and
YouTube and that is not recoverable; a launch would run on `@winningcoupleapp`, which
is free everywhere it could be checked. Instagram's `@winningcouple` should be
treated as unavailable until someone signed in confirms otherwise — a "removed
profile" handle is usually not reclaimable.

### 8. Trademarks — a search, not a clearance, and not legal advice

**This section is a public-records search and nothing more.** It does not consider
common-law rights, state registrations, unregistered use in commerce, foreign
registers, likelihood-of-confusion analysis, or design marks. A professional
clearance search by a trademark attorney is a separate exercise and this does not
substitute for it. Nothing here is a legal opinion.

**Method.** `tmsearch.uspto.gov`'s own backend, `POST
https://tmsearch.uspto.gov/prod-stage-v1-0-0/tmsearch`, queried 2026-09-30. The
public UI's URL parameters do not carry a query (a control search for a mark known to
exist returned "No results found" through the URL), so queries were issued to the
backend directly. A control query — `match_phrase` on `wordmark` for "couple to
couple" — returned 7 known marks, confirming the query form works.

**Observed:**

- `match_phrase` on `wordmark` = "winning couple": **0 results.** Live or dead, any
  class.
- Both words required in the wordmark (`match_phrase` "winning" AND "couple"):
  **0 results.**
- Wildcard `*WINNING COUPLE*` on `wordmark`: **0 results.**
- Free-text phrase "winning couple" anywhere in the record: **1 result**, serial
  98014767, wordmark **WONG'SPHIOLE**, Yiwu Deyong Daily Necessities Co., Ltd.
  (China), IC 021 glassware, registered 2024-06-18, reg. 7419080. Unrelated — the
  phrase does not appear in the mark.

**Nearest live marks worth knowing about** (none blocking on their face; an attorney
would say whether any matters):

| Mark | Owner | Class | Status | Serial |
|---|---|---|---|---|
| COUPLE | Couple.com, Inc. (DE) | IC 045 (dating/social) | LIVE, REGISTERED | 90894103 |
| COUPLE UP | Hunch Labs, LLC (NY) | **IC 028 (games and playthings)** | LIVE | — |
| COUPLE SUMMIT | COUPLE SUMMIT, INC. (DE) | IC 041, IC 028 | LIVE | — |
| COUPLE TO COUPLE | Hollander Counseling Associates (MD) | IC 045 | LIVE, REGISTERED & RENEWED | 86626429 |

131 live US marks contain the word "couple" in some class. **SCOREPAD** exists as a
mark twice, both dead (one CANCELLED - SECTION 8, one EXPIRED) — relevant if the
`scorepad` keyword lane from section 3 is pursued in a name.

*Inference, clearly labelled as such:* a Class 9 mobile-app mark "WINNING COUPLE"
would be entering a register where nothing similar exists in the same class. The
crowded field is "WINNING X" in Class 9 (45 live marks), which cuts the other way —
crowded fields narrow everyone's scope of protection, so the name would be both easy
to register and weak to enforce. That is a question for a lawyer, not for this file.

## Implications for Winning Couple

1. **Nothing blocks shipping. Do the App Store Connect check anyway.** It is the one
   thing this study could not do, it takes a minute, and everything downstream —
   icon, screenshots, domain purchase — depends on it. Do it before the next listing
   asset is made.

2. **Do not ship the App Store name as bare "Winning Couple". This is the single
   highest-leverage change in the study.** 88% of 259 apps in this category put a
   category keyword in the name field because it is Apple's highest-weighted ASO
   surface. Ship as **"Winning Couple: Score Tracker"** or **"Winning Couple —
   Board Game Scorepad"**. The brand is preserved, the name field stops being dead
   weight, and it costs nothing to decide now. `Scorepad` is the term worth putting
   there: 17 results, top-10 median 13 ratings, incumbent dead since 2020.

3. **The name is a discovery liability and should be stated as one in the venture
   record, not hedged.** The phrase means "the couple who won the reality dating
   show" on Google (ten of ten autocompletions), and it means gambling on X, YouTube
   and the USPTO's Class 9 register. It will never be typed by someone looking for a
   score tracker — "winning couple app" and "winning couple game" return *zero*
   autocomplete suggestions, meaning nobody has ever completed that phrase toward
   software often enough to register. Every user who finds this app will have been
   told its name by a person, a post or a link.

4. **That makes assumption 4 load-bearing rather than optional.** The context map
   lists "there is a reachable audience: creators and communities focused on
   two-player and couples gaming" as an untested assumption. If the name cannot
   generate organic search, the narrated channel *is* the acquisition channel, and
   assumption 4 stops being a nice-to-have and becomes the thing the launch depends
   on. It should be the next research priority after this one. Encouragingly, the
   category exists off-App-Store: "couples board games" autocompletes to *reddit,
   date night, romantic, near me* and the listicle ecosystem is well populated —
   that is where a narratable name works.

5. **The couples framing is fine; the *word* "couple" in search is not.** Study 01
   found "couples game night" returns only relationship and trivia apps. This study
   adds the sharper version: `couple score tracker` — a query that contains *both*
   halves of the positioning — returns Between (21,211 ratings), Couple Joy (38,070)
   and Paired (208,099), with Super Scoreboard at #3 as the only tracker. The word
   "couple" in any query is captured by a category with six-figure rating counts. Do
   not buy keywords containing it. Let it work in screenshots and copy.

6. **Buy the domains now; they are all free and that will not last forever.**
   `winningcouple.com` and `.app` are both unregistered as of 2026-09-30, at Hover,
   where `joshuajumbles.com` already lives. Total cost is trivial next to the cost of
   discovering in six months that someone took `.com`.

7. **Plan on `@winningcoupleapp`, not `@winningcouple`, for social.** The bare handle
   is gone on X (a dormant Betway tipster) and YouTube (a two-week-old bingo channel),
   and Instagram's is showing "profile removed", which usually means unreclaimable.
   `@winningcoupleapp` was free on every platform that could be checked. Claim it
   across TikTok, Bluesky, GitHub, X and YouTube in one sitting so the set stays
   consistent. TikTok and Bluesky have *both* handles free today.

8. **If the name is ever going to change, this is the moment — and the study does not
   recommend changing it.** The honest balance: the name costs organic App Store
   discovery, which section 3 shows is a contested, low-yield channel anyway (the
   best available term has a top-10 median of 13 ratings — that is a small prize). It
   buys a phrase that is memorable, sayable, and exactly on-message for the narrated
   channel that section 4 argues is the real one. Keep it, pair it with tracker
   vocabulary in the name field, and stop expecting search to do any work.

## Open threads

- **App Store Connect availability is unconfirmed and only Joshua can confirm it.**
  Every other finding in this file is public-record; this one is not.
- **No keyword volume data.** The competitiveness table uses result counts and
  rating counts as proxies. App Store Connect's own "search popularity" score is
  free to Joshua and would replace the whole of section 3 with real numbers. It is
  the single cheapest upgrade available to this study.
- **Apple's search-hints endpoint returned empty for every term.** App Store
  autocomplete — the closest thing to what users actually type *in the store* — was
  therefore not sampled. Google autocomplete was used as a substitute and is not the
  same thing.
- **Instagram `@winningcouple` and `@winningcoupleapp` are genuinely unresolved.**
  "Profile isn't available" covers both never-existed and removed. Someone signed in
  should try to claim them; that is the only way to know.
- **Reddit and Threads handles unchecked.** Both blocked automated checks. Reddit
  matters more than usual here, since r/boardgames and couples-gaming subreddits are
  exactly the narrated channel assumption 4 describes.
- **Only US trademarks searched.** No UK IPO, EUIPO, CIPO or WIPO check. If the app
  ships worldwide — which an App Store app does by default — those registers exist
  and were not looked at.
- **Common-law and unregistered use not searched at all.** The Facebook page "The
  winning couple" (`facebook.com/dewinningcouple`), a relationship-coaching page, is
  the kind of unregistered use that a real clearance search would evaluate and this
  one did not.
- **Name alternatives were not generated or tested.** The brief asked whether *this*
  name works. If Joshua wants options, a follow-up should test candidates against the
  same three instruments used here — autocomplete semantics, App Store name-field
  keyword yield, and handle/domain availability — rather than on taste.
- **The public GitHub repo already ranks for the name.** `JoshuaJumbles/winning-couple`
  is indexed and surfaces on a search for the app. Harmless now; worth deciding
  deliberately whether the repo stays public at launch, since it is currently the
  only thing on the internet that connects the phrase to a score tracker.
