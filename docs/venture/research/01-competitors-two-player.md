# 01 — Competitors: two-player and couples score tracking

- Date:              2026-09-29
- Run by:            subagent
- Question:          Who else is building score tracking specifically for two players
                     or couples, and what do they get right and wrong?
- Confidence:        Medium. App metadata (prices, versions, update dates, rating
                     counts, description text) comes straight from Apple's own
                     lookup API and is re-checkable. The weak points: Apple's
                     public review feed returns a capped sample, not every review,
                     so the rating distributions below are samples and not true
                     distributions; review authenticity cannot be verified at all;
                     and several in-app-purchase price lists are ambiguous where
                     Apple shows duplicate tier names. Flagged inline where it
                     matters.

## Summary

**Assumption 1 is half right, and the half that is wrong is the half that matters.**
The *positioning* gap is real: across 161 score-tracking apps sampled, not one is
marketed to couples, and the only two marketed to "two players" are effectively
abandoned. But the *functional* gap is much narrower than the assumption states.
At least six actively-maintained apps already deliver the core Winning Couple
promise — named players, per-game history, and head-to-head win records — and
they give it away free, offline, with no account. Head-to-head stats, player
colours and avatars, and "no account, no setup" are commodity features in this
category in 2026, not differentiators.

Two further findings cut across the brief. First, the two apps that *did* commit
to two-players-only are both dead (last updated 2020 and 2024, 13 and 2 ratings
between them) — that is a demand warning, not just an open lane. Second, the
dominant friction in 2–3 star reviews of the category leader is not missing
two-player features; it is paywall surprise and reliability. The clearest
evidence for a genuine gap is narrow and specific: group-shaped apps degrade
visibly at n=2, and per-game lifetime win/loss records are the single most
requested missing feature from players who describe themselves as a pair.

## Findings

### Method and scope

Swept the US App Store via Apple's public search API across 12 query terms
("board game score tracker", "score keeper game", "two player score tracker",
"head to head game stats", "couples score tracker", "game night scores", and
similar), yielding 358 unique apps, of which 161 are plausible board/card game
score trackers after filtering out live-sports-score, betting, and golf-GPS
apps. Metadata per app from `itunes.apple.com/lookup`; review text from Apple's
public customer-reviews feed. Android-only apps, general tally counters, and
single-game companions excluded per brief.

### The apps

Price column: upfront price, then IAP. "Pairs?" asks whether the app is *built*
for two, not whether two players fit.

| App | Developer | Platforms | Price model | Pairs or groups? | Account before first use? | Scoring flexibility | Stats depth | Last update | Link |
|---|---|---|---|---|---|---|---|---|---|
| Keep Score: Game Score Tracker | Aaron Orr | iPhone, iPad | Free; IAP "Unlimited Games" $5.99, "More Games" $1.99 | Groups (unlimited players) | No — description says "No account. No setup." | Arbitrary; no fixed game types | Shallow: per-game rounds, winner, leaderboard; **no lifetime per-game win/loss** | 2026-09-09 (v9.7) | [id1140300229](https://apps.apple.com/us/app/keep-score-game-score-tracker/id1140300229) |
| Board Game Stats | Eerko Vissering | iPhone, iPad, Mac, Vision | $5.99 + IAP: Deep Stats $2.99, Challenges $1.99, Tagging $2.99, Power $5.99, Cloud Sync $0.99/yr | Groups; collection-centric | No; optional BoardGameGeek login for sync | Arbitrary, per-game scoring templates | Deepest in category — graphs, player combinations, filters | 2026-09-22 (v6.17) | [id892542000](https://apps.apple.com/us/app/board-game-stats/id892542000) |
| Score Anything – Scorekeeper | Ilya Panchenko | iPhone, iPad | Free, no ads, no IAP observed | Groups, "supports 1–12 players" | No | Arbitrary; custom increments | Shallow: history + undo within a scoreboard | 2026-04-08 (v2.5) | [id1541777240](https://apps.apple.com/us/app/score-anything-scorekeeper/id1541777240) |
| Games Keeper | Vincent Tourraine | iPhone, iPad, Mac, Watch | Free; CSV export behind IAP | Groups (unlimited players) | No | Arbitrary | Medium: score sheets, ranks, chart, full history | 2026-05-02 (v3.6) | [id674138310](https://apps.apple.com/us/app/games-keeper/id674138310) |
| VERSUS: Scorekeeper | Stuart Marshall | iPhone, iPad | Free tier (10 matches per developer site); subscription or lifetime unlock — **exact prices unverified** | **Closest to pairs** — positioned on rivalry and rematch | No; iCloud only for sync | Highly configurable: count up/down, high/low wins, custom labels, 1–2 scoring levels | Deep for pairs: win ratios, head-to-head, league view, averages, CSV | 2026-05-18 (v2.1.1) | [id6746864953](https://apps.apple.com/us/app/versus-scorekeeper/id6746864953) |
| Pointster: Board Game Scores | Julien Duribreux | iPhone | Free; IAP tiers $1.99–$8.99 (**structure ambiguous** — Apple lists duplicate "Premium"/"Advanced" names) | Groups; Bluetooth shared scoreboard | No — "no account, no room code" | Rules engine: win conditions, target scores, overshoot penalties, team play | Deep: win rates, score trends, **head-to-head records per player and game**, achievements | 2026-09-26 (v10.31.0) | [id6475646381](https://apps.apple.com/us/app/pointster-board-game-scores/id6475646381) |
| Countable – Score Tracker | Adam Garrett-Harris | iPhone, iPad | Free | **Pairs — explicitly** | No | None: two counters only, no game types | None — no history, no stats | **2024-03-30 (v1.0, never updated)** | [id6479331579](https://apps.apple.com/us/app/countable-score-tracker/id6479331579) |
| Scorepad for Two | Mature Solutions / Discovery Corps | iPhone, iPad | Free | **Pairs — explicitly** | No | None: two running totals | None — no history, no stats | **2020-06-22 (v2.0)** | [id1390894073](https://apps.apple.com/us/app/scorepad-for-two/id1390894073) |
| Board Game Now – Score Tracker | Murat Yucel | iPhone, iPad | Free | Groups; real-time multi-device sync | Effectively yes — friends added "by nickname", cloud sync | 300+ built-in game templates + custom game creator | Medium; history with cloud sync, 13 side tools | 2026-04-22 (v1.2) | [id6759579818](https://apps.apple.com/us/app/board-game-now-score-tracker/id6759579818) |
| Board Game Shelf | Saku Studio | iPhone | Free | Groups; explicit pair comparison view | No | Session logging rather than live scoring | Head-to-head wins, win rates, longest streaks, "shareable rivalry card" | 2026-09-13 | [id6469036106](https://apps.apple.com/us/app/board-game-shelf/id6469036106) |
| Match Log: Board Game Tracker | Takuya Yamaguchi | iPhone | Free | Groups, but advertises "1v1 with scores" | No — offline, no account | Competitive, cooperative, and 1v1 modes | Player detail screen: head-to-head records, per-game breakdown | 2026-09-29 | [id6770892938](https://apps.apple.com/us/app/match-log-board-game-tracker/id6770892938) |
| Scorekeeper XL | Matt Rix | iPhone, iPad | Free | Groups | No | None: +/- by 1 only | None | **2017-09-02 (v1.2)** | [id463243024](https://apps.apple.com/us/app/scorekeeper-xl/id463243024) |

Supporting, not tabulated in full: **Score Pad** (Nicolas Lehovetzki, free, player
photos, zero-sum mode, 2026-04-19), **Scoring – Score Tracker** (Anthony
Haemmerlin, free, no account, 2026-04-07), **Score Stack**, **ScoreBoardly /
Score Counter – Leaderboard**, **Scoreboard Count Tracker**, **TallyUp**,
**Scored: Board Game Tracker**, **GameNightScorePad**, **Game Score Tracking** —
all free, all shipped or updated in the last 18 months, all advertising some
combination of lifetime win stats, player colours/avatars, and offline no-account
operation.

### Observation: nobody markets to couples, and the category is crowded

- Of 161 candidate trackers, **zero** position couples as their primary audience.
- The single closest thing is **Scoring – Score Tracker**, whose description reads
  "Perfect for your evenings as a couple, with friends, family, or your Quiz
  nights" — one clause in a list, in an app that also advertises "From solo mode
  to 20 players."
- Searching the App Store for "couples game night" returns **no score trackers at
  all**. It returns relationship, trivia, and intimacy apps: Paired (208,099
  ratings), Evergreen (54,535), Lasting (24,975), plus dozens of "spicy challenge"
  titles.
- Update cadence is aggressive, not dormant: of the 161 trackers, **111 were last
  updated in 2026** and 19 in 2025. Only 16 were last touched in 2022 or earlier.
- Upfront-paid apps are rare: **7 of 161** charge upfront ($0.99–$5.99). The rest
  are free, most with IAP.

*Inference:* the couples framing is unoccupied because App Store discovery does
not reward it. The word "couples" shelves an app next to relationship apps with
six-figure rating counts, not next to score trackers. A couples-positioned
tracker has to win on the tracker keywords anyway, where it meets 100+ actively
maintained free competitors.

### Observation: the features assumed to be differentiators are commodity

Counting advertised features across the 161 trackers:

- **29** explicitly advertise no account / no login / no sign-up.
- **29** explicitly advertise offline operation.
- **17** advertise head-to-head records, win rates, or lifetime win/loss stats.
- **16** advertise player colours, avatars, or player photos.

The category leader by rating volume, Keep Score (4,288 ratings, 4.7 average),
leads its description with "Start a game in seconds. No account. No setup."
Score Anything already offers "Personalize player names and colors to match game
pieces" and 24 player colours. Score Pad already attaches player photos.

*Inference:* local-only, no-account, and personalised players are table stakes in
this category, not a position. They are worth keeping because their absence would
be noticed; they will not carry a launch narrative.

### Observation: the two apps that committed to two players are dead

- **Scorepad for Two** — "the easiest way for two players to keep score" — last
  updated **2020-06-22**, 13 ratings. It has no history, no game types, and no
  stats; its headline features are a megaphone button that speaks the score aloud
  and Dynamic Type support.
- **Countable** — "the best 2 player score-keeping app for card games" — still on
  **v1.0 from 2024-03-30**, 2 ratings. Two counters, Home Screen widgets, strong
  accessibility support, nothing else.

*Inference:* two apps is a small sample, so this is weak evidence either way. But
neither failed because it was out-competed on two-player features — both shipped a
bare counter and stopped. The honest reading is that two-player-only has been
tried twice at minimum viable scope and did not build an audience; it has not been
tried with session history and per-game records, which is where Winning Couple
sits.

### Observation: group-shaped apps visibly degrade at two players

The one place the "built for groups" complaint is directly evidenced, from a
3-star review of **Games Keeper** (v3.2.1):

> "For some reason, with two players, there are 4 scorecards. Visually
> distracting and confusing. Each player score appears on 2 cards. Better to have
> one card per person"

The same reviewer, unprompted, asks for exactly the personalisation Winning Couple
ships:

> "I wish I could change the color of the cards to match the color of the pawns
> being used by that player, and use a more neutral background color."

*Inference:* the second quote is a request for a functional aid — colour-match the
pawns so you can find your row — not for relationship expression. It supports
"personalisation matters" while undercutting the reason assumption 3 gives for it.

### Observation: lifetime per-game win/loss is the most-requested missing feature

From a 3-star review of **Keep Score** (v7.4), titled "Great for individual game
play, but not for keeping track of overall records" — note the reviewer
self-identifies as half of a pair:

> "I enjoy using this app as my partner and I play a lot of board games. However,
> I bought it thinking that it would be able to bucket historical data/overall
> record per player by game title. The data is all there, but instead it just
> lists out each game individually with no running tally. Would love to see
> overall win/loss record per game."

The same want, from the opposite end of the stats spectrum — a 2-star review of
**Board Game Stats** (v5.2.5), the deepest app in the category:

> "Most stats are based on number of plays, which is irrelevant. The stats that I
> want to focus on are wins and losses."

And a third, from Keep Score (v7.8):

> "I want a way to keep track of how many times someone won a game. I'm not
> necessarily tallying score real time."

*Inference:* this is the one durable gap the reviews support. The market splits
between live scorekeepers that forget everything after the session and collection
trackers that count plays rather than victories. "Who is ahead, at this game, all
time" is what people ask for and what neither pole delivers cleanly. Winning
Couple's per-game win-history chart sits exactly there. Note the counter-evidence,
though: Versus, Pointster, Board Game Shelf, Match Log, and TallyUp all now
advertise this, so the gap is closing in real time.

### Observation: the loudest friction in the category is paywalls, not player count

In the sampled 2–3 star reviews of Keep Score, paywall surprise dominates and no
review mentions two-player handling. Representative:

> "This app keeps scores for you through two games, and then you have to pay to
> keep using it. So, when you download the app, you think it's free but it isn't.
> The developers would do well to learn from other app system setups and provide a
> truly free really basic score keeper instead of the current bait and switch
> model." (2-star, v2.5, titled "Bait and switch")

> "Not really free — This scorekeeper works well but only gives you 10 free games
> before asking you to buy 10 more for $2 or 'go unlimited' for $4. Save yourself
> the time and download an actually free one." (2-star, v2.5)

Reliability is second: "UI is now very slow after update… There's a delay after
typing in scores" (2-star, v9.1); "it can spontaneously crash/quit in the middle
of a game, and the accurate scores are lost when you restart. Since this has
happened now a number of times, I've switched to another scoring app that doesn't
crash" (Games Keeper, 2-star, v3.2.3).

Board Game Stats, despite its 4.9/452 rating, draws the same complaint about its
à-la-carte add-ons: "Just point me toward the full paid version and I'll buy it
for like $10–$15, but separating out all the features makes me not want to buy any
of them" (3-star, v3.9.7).

*Inference:* these reviewers switch apps over paywalls and lost sessions, and this
category has near-zero switching cost. Correctness and durability of the session
log is the competitive floor. A metered free tier is the single most reliably
resented pattern here.

### Caveats on the evidence

- Apple's public review feed is US-only and returns a bounded sample (most-recent
  plus most-helpful, roughly 250 reviews maximum per app), so the rating mixes
  observed are **samples, not true distributions**. They are adequate for reading
  friction themes, not for measuring sentiment.
- Review authenticity is unverifiable. The quotes above were selected because
  several independent reviewers describe the same friction, not because any single
  one is trustworthy.
- **Versus** has 0 US ratings, so its App Store page shows no reviews and I could
  not verify its IAP prices; the free-tier-of-10-matches and
  subscription-or-lifetime structure comes from the developer's own site,
  versusapp.net, which is marketing copy.
- **Pointster** and several 2026 entrants also have 0 ratings. Their descriptions
  are claims, not verified behaviour — I did not install any app.
- Feature counts in "commodity features" come from grepping description text.
  They **undercount**: an app can implement a feature without advertising it in
  those words. Read them as floors.

## Implications for Winning Couple

1. **Stop leading with "built for two."** It is not defensible. Versus is
   positioned on rivalry and rematch with configurable scoring and head-to-head
   league views; Pointster, Board Game Shelf, Match Log, and TallyUp all ship
   head-to-head records. "Two players" describes a constraint, not a benefit a
   buyer can feel. The defensible version of the same idea is the *absence* of
   group machinery: no player picker, no team generator, no seat rotation, no
   "add player" affordance to mis-tap. That is a claim about what the app refuses
   to do, and it is checkable in a screenshot.
2. **Treat the win-history chart as the lead feature, not a detail screen.** It is
   the one thing multiple reviewers across the price spectrum say they cannot get,
   including one who identifies as half of a couple. It is also the thing the 2026
   cohort is racing to add, so its value decays. If anything gets polished before
   launch, it is this.
3. **Do not meter the free tier.** Assumption 5 ("nobody is paying, so free costs
   us nothing") is supported on the pricing observation — 154 of 161 trackers are
   free upfront — but the reviews add a sharper rule: metered free tiers are the
   most-resented pattern in this category, and they generate 2-star reviews with
   titles like "Bait and switch" that permanently depress a new app's rating.
   Free-with-nothing-withheld, or a single honest upfront price. Not 10 free games.
4. **Reliability is the real competitive bar.** Users switch scorekeepers over lost
   sessions and input lag, and say so in reviews. A SwiftData write that loses a
   turn mid-game is a worse outcome than any missing feature. This argues for
   spending Phase 2 effort on persistence tests and input latency over new surfaces.
5. **Revisit the "couples" name and framing as a discovery question, not a brand
   question.** Observed: "couples game night" surfaces only relationship and trivia
   apps, several with six-figure rating counts. Winning Couple will be found — if
   at all — on tracker keywords, competing with 100+ actively updated free apps.
   This does not mean change the name; it means the App Store listing's subtitle
   and keywords should carry the tracker vocabulary, and the couples framing should
   do its work in the screenshots and in channels where it can be narrated
   (assumption 4's creators and communities). Feeds directly into the open question
   "Is 'Winning Couple' available and searchable on the App Store?"
6. **Personalisation: keep it, stop counting on it.** 16 of 161 trackers already
   advertise colours, avatars, or player photos; Score Anything ships 24 player
   colours free. Assumption 3 needs rewording — the evidence for personalisation is
   real but the stated reason is not: the one reviewer who asked for it wanted to
   colour-match the pawns, not express a relationship.
7. **Amend assumption 1 in the context map.** Suggested replacement: *"No tracker
   is positioned for couples, and group-shaped apps handle two players awkwardly;
   but two-player head-to-head records are a commodity feature in free apps, so
   the gap is positioning and restraint, not capability."*

## Open threads

- **Versus is the single most direct competitor and is largely unexamined.** It has
  no US ratings, so there is no review signal at all. Worth installing and using
  for a real session to find out whether its flexibility makes it fiddly at the
  table — configurability is often where a rival loses to something opinionated.
  Its UK/other storefront reviews may also exist and were not checked.
- **Why did Scorepad for Two and Countable die?** Both are minimal counters, so the
  likely answer is "they never shipped enough." But if either developer is
  reachable, the reason would be the most valuable single data point available on
  whether two-player-only has an audience.
- **Did not verify any app by installing it.** Every feature claim above except the
  review quotes is a developer's own description. A hands-on pass on Versus,
  Pointster, and Keep Score would test whether the "degrades at n=2" finding
  generalises beyond the one Games Keeper review.
- **Cooperative scoring is unexamined competitively.** Winning Couple has a
  cooperative win/loss flow; only Board Game Stats and Match Log were observed to
  mention cooperative play at all. Whether that is an unserved need or an unwanted
  feature is untested, and it bears on the Phase 2 scope cut.
- **No pricing precedent for a paid two-player tracker exists** because no
  two-player tracker has ever charged. Assumption 5 is supported on the "nobody
  charges" half; the "so free costs us nothing" half is still untested, and this
  study found no evidence either way on willingness to pay.
- **Non-App-Store competition not examined.** Notion templates, spreadsheet
  templates, and the paper-and-notes-app baseline are assumption 2's territory and
  were out of scope here, but several reviews frame the alternative as exactly that
  ("Deleted. 3 free games thanks. Pointless download. I'll return to pencil and
  paper") — which suggests assumption 2 has real support waiting to be collected.
- **BoardGameGeek forum evidence was not obtained.** The most relevant thread
  ("Game Win/Loss tracking software?", boardgamegeek.com/thread/1506243) returned
  HTTP 403 to automated fetching. BGG threads on two-player and couples gaming are
  probably the richest qualitative source available and need a manual pass.
