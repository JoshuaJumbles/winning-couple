# 05 — Channels and creators: who reaches two-player and couples gamers

- Date:              2026-09-29
- Run by:            subagent
- Question:          Which creators and communities reach people who play two-player or
                     couples board games, and how reachable are they in practice?
- Confidence:        Medium on creators, low on communities. YouTube and TikTok figures
                     were scraped from the platforms' own page data today and are
                     re-checkable, including per-video view counts, which matter more
                     than subscriber counts and are reported here alongside them.
                     Podcast and blog facts come from the outlets' own pages. The weak
                     points are serious and structural: **Reddit blocked every access
                     method available to me** (403 on the API, login wall on old.reddit,
                     excluded from the search user agent, blocked in the browser pane),
                     so every subreddit size and rule below is second-hand from
                     third-party rule databases and is unverified. **BoardGameGeek
                     served a Cloudflare bot challenge** that I did not complete, so the
                     one genuinely well-targeted community found here is entirely
                     unmeasured. Blog and newsletter audience sizes are almost never
                     disclosed and are recorded as unknown rather than estimated.
                     Follower counts move and can be inflated; none were audited.

## Summary

**Assumption 4 is mostly false as written.** Creators and communities focused on
two-player and couples gaming do exist — more than I expected — but the reachable
ones have audiences in the hundreds, and the one with a real audience is gated by
a talent agency and makes the wrong kind of content. The niche is a barbell with
nothing in the middle: on TikTok it is one account at 3,000,000 followers and then
a cliff to 1,145 and 921. On YouTube the channels whose entire identity is
two-player gaming have 7,180 and 4,650 subscribers and earn **557 and 413 median
views per video**.

Worse, the dedicated media layer is actively failing. The single best-targeted
outlet found — A Pair of Meeples, a couple reviewing board games exclusively for
two players, with an open review-request email — published a wind-down post in May
2024 reporting that traffic had fallen to "almost zero" and lifetime revenue to
about $50. Two of the on-niche YouTube channels are dormant (7 months) and dead
(5 years). The peak readership ever reported by the best-targeted couples outlet
in this niche was "thousands ... every month."

A second finding cuts across the brief and is more actionable than the ranking:
**board game media reviews digital games, not digital tools.** Meeple Mountain's
board game app section holds 9 articles across four years, 8 of which are digital
adaptations of physical games. The category-leading tracker app, BG Stats, has a
"Reviews" page on its own site containing nothing but App Store screenshots — no
press at all, after twelve years. There is no established route by which a board
game score tracker gets covered.

The honest conclusion: there is no ready-made distribution channel here. What
exists is a short list of open doors worth walking through at near-zero cost —
two blogs with public submission forms, one BGG guild, one micro-podcast — and a
demand signal suggesting Joshua should be making this content rather than pitching
it. Tabletop Bellhop reports its two-player date-night article outperforms
everything else it has ever published; The Tabletop Family has run an annual
couples date-night list for eight straight years; Games4two built 6M+ followers on
two-player games alone. **Reader demand is not the constraint. The intermediary is.**

## Findings

### Method

YouTube channel and `/videos` pages were fetched as raw HTML and parsed for the
embedded `ytInitialData` blob, giving subscriber counts, video counts, and
per-video view counts and relative upload ages. Where a channel hid those in
static HTML (Games4two), the rendered page was read in a browser pane instead.
TikTok profiles were parsed the same way for `followerCount`, `heartCount` and
`videoCount`. Instagram returned a login wall and yielded nothing. Podcast and
blog facts come from the outlets' own pages. Full per-channel data, including the
raw view samples behind every median, is in
[`05-channels-and-creators-data.json`](05-channels-and-creators-data.json).

`median_recent_views` below is the median of up to the 12 most recent long-form
uploads. It is the number that matters: subscriber counts in this niche overstate
reach by an order of magnitude.

### Observation: the two-player niche on YouTube is one giant and a long tail of hundreds

| Channel | Subs | Videos | Median recent views | Newest upload | Two-player specificity | Contact |
|---|---|---|---|---|---|---|
| [Games4two](https://www.youtube.com/@Games4two_) | **3.02M** | 1.1K | Shorts 1.9K–414K | long-form 3mo ago | **Total** — "The Board Game Couple that loves two player games" | Viral Nation talent agency |
| [No Pun Included](https://www.youtube.com/@NoPunIncluded) | 112K | 191 | 70,000 | 2 weeks | None (a couple, general criticism) | **None — refuses all approaches** |
| [Before You Play](https://www.youtube.com/@BeforeYouPlay) | 98.3K | 843 | 16,000 | 2 hours | **High** — "reviews from a 2-player perspective" | beforeyouplaygames@gmail.com |
| [Shut Up & Sit Down](https://www.youtube.com/@shutupandsitdown) | 461K | 724 | 46,500 | 2 weeks | None | none published |
| [The Dice Tower](https://www.youtube.com/@thedicetower) | 362K | 27K | 10,700 | 8 hours | None | publisher pipeline |
| [ThinkerThemer](https://www.youtube.com/@ThinkerThemer) | 31.1K | 396 | 8,350 | 2 weeks | Low (Australian couple; theme/aesthetics focus) | none found |
| [The Broken Meeple](https://www.youtube.com/@TheBrokenMeeple) | 28.2K | 1.2K | 5,900 | 7 days | None (solo host) | xperiahector@gmail.com |
| [Foster the Meeple](https://www.youtube.com/@fosterthemeeple) | 27K | 788 | 3,000 | **7 months — dormant** | Low | — |
| [Allies or Enemies](https://www.youtube.com/@alliesorenemies) | 7.18K | 394 | **557** | 10 hours | **High and explicit** — see quote below | comments only |
| [Girls' Game Shelf](https://www.youtube.com/@girlsgameshelf) | 6.01K | 101 | 628 | **5 years — dead** | — | — |
| [Board Games For Two](https://www.youtube.com/@boardgamesfortwo) | 4.65K | 595 | **413** | 8 days | **Total** — every title is "X: A Review for Two" | Instagram DM only |
| [Bitewing Games](https://www.youtube.com/@BitewingGames) | 4.54K | 321 | 1,600 | 2 weeks | Occasional (publisher) | — |
| [Tabletop Bellhop](https://www.youtube.com/@TabletopBellhop) | 2.36K | 1.2K | 101 | 2 days | Moderate (recurring date-night series) | questions@tabletopbellhop.com |

Allies or Enemies' channel description is the most precisely aligned statement of
purpose found anywhere in this study:

> "Longtime board game players, and longer time Canadians, Jess and Shawn profile
> some of the games they love with a focus on two player games. It's quick,
> hopefully insightful, and perhaps a good resource for other board gaming couples."

Board Games For Two is the only channel whose format is two-player from title to
thumbnail:

> "This channel focuses on the review of board games for two players. This channel
> is for couples, partners, friends, head-to-head gamers and all things board games
> for two players!"

*Inference:* subscriber counts are actively misleading here. Board Games For Two
converts 4,650 subscribers into 413 median views (8.9%); Allies or Enemies converts
7,180 into 557 (7.8%). A "few thousand subscriber" channel in this niche reaches a
few hundred people per video. Any plan that treats these as meaningful distribution
is mis-sized by roughly 10x.

One incidental observation worth keeping: Board Games For Two's most-viewed video
of all time is **"Azul: A How to of End of Round Scoring"** (39K views, 6 years
ago) — a scoring tutorial, on a two-player channel, outperforming every review they
have made. That is a small but direct signal that scoring is a searched-for topic.

### Observation: TikTok is the same shape, only starker

| Account | Followers | Likes | Videos | Two-player specificity |
|---|---|---|---|---|
| [@games4two](https://www.tiktok.com/@games4two) | **3,000,000** | 137.5M | 1,572 | Total — "The Two Player Board Game Couple" |
| [@boardgameswithcouple](https://www.tiktok.com/@boardgameswithcouple) | 1,145 | 3,002 | 96 | Moderate — "Geek couple that plays boardgames" |
| [@boardgamesfortwo](https://www.tiktok.com/@boardgamesfortwo) | 921 | 34,900 | 91 | Total |
| [@twoplayergames](https://www.tiktok.com/@twoplayergames) | 9 | 341 | 4 | Name squatted, unused |

Instagram could not be measured — profile fetches returned a login wall. This is a
real gap in the study, not an absence of creators.

*Inference:* the ratio here is about 2,600:1 between the top account and the next
on-niche one. This is not a long tail; it is one winner and a void.

### Observation: the one creator who owns the niche is the least reachable thing in it

Games4two (Christopher and Alyson James) is the finding that most directly bears on
assumption 4, and it cuts against it three separate ways.

- **Scale, verified:** 3.02M YouTube subscribers and 1.1K videos (read from the
  rendered channel page, 2026-09-29); 3,000,000 TikTok followers and 137.5M likes.
  Note their own YouTube bio still claims "1.9M+ on TikTok-1.2M+ on YouTube" — a
  useful reminder that self-reported creator numbers are often stale. A secondary
  source ([Tubefilter](https://www.tubefilter.com/2023/12/07/youtube-millionaires-games4two/),
  2023-12-07) records them saying they went full-time in September 2023 after
  noticing a gap in two-player board game content.
- **Gated:** the sole published contact on both their YouTube and TikTok profiles is
  `games4two@viralnationtalent.com` — a talent agency. There is no personal email,
  no submission form, no Patreon-style direct line.
- **Wrong shape:** the content is short-form challenge entertainment — the loser does
  a chore, pays the mortgage, plays blindfolded. Long-form uploads have largely
  stopped (newest is 3 months old at 19K views, against Shorts reaching 414K). They
  have also become a competitor for attention in their own niche: they now publish
  their own physical games through Relatable, with "Starts With Ends With"
  exclusive to Walmart.

*Inference:* the existence of a 3M-follower two-player board game creator proves the
*audience* thesis and disproves the *reachability* thesis in the same breath. They
demonstrate enormous latent demand for two-player gaming content, and they are
completely unavailable to a solo developer with no budget — and would be a poor fit
even if they answered, because nothing in their format resembles reviewing a utility.

### Observation: the best-targeted outlet in the niche publicly gave up

[A Pair of Meeples](https://apairofmeeples.com/) is, on paper, the perfect channel:
a married couple reviewing board games exclusively for people who play with one
other person, with an open submission form and a published address,
`reviews@apairofmeeples.com`. Their stated policy:

> "If you think your board game is great for two players you might want to consider
> filling out the form below to submit your board game for review or contact us at:
> reviews@apairofmeeples.com"

On 2024-05-20 they published
["Board Games and Broken Dreams: Fading Into the Digital Abyss"](https://apairofmeeples.com/board-games-and-broken-dreams/):

> "a few short months ago A Pair of Meeples was at an all-time high in terms of
> visitors, thousands were reading our reviews every month"

> "It's hard to create content for an audience of zero."

> "the motivation to do so has almost been entirely sapped out of me over the last
> few months"

> "the amount of new content we publish is likely going to be quite sporadic and
> limited if nothing changes"

They report roughly **$50** in lifetime Amazon Associates revenue and zero product
sales against hundreds of dollars in site costs over nearly two years, with traffic
collapsing after a Google algorithm update.

*Inference:* two things follow. First, "thousands ... every month" was the *peak* of
the best-targeted two-player couples outlet that has existed — that is the size of
this media niche at its best, and it is small. Second, the niche's economics do not
support dedicated creators, which explains the dormancy pattern elsewhere in the
table (Foster the Meeple at 7 months, Girls' Game Shelf at 5 years). This is the
same demand warning study 01 found on the app side, arriving independently from the
media side.

### Observation: exactly one dedicated couples board game podcast exists, and it is tiny

[**Board With Each Other: Boardgame Reviews for Two**](https://podcasts.apple.com/us/podcast/board-with-each-other/id1686896734),
hosted by Alister Simpson and Hannah Kelly:

> "A podcast that looks at Board Games / Tabletop Gaming through the lens of playing
> as a couple or with a regular gaming partner. Hosted by Al & Hannah, We review a
> game each episode."

61 episodes; most recent 2026-09-21; roughly monthly with bonus "Bite Size"
episodes; **4.0 stars from 2 Apple ratings**. Contact is wide open — X
[@boardweachother](https://x.com/boardweachother), a Facebook page, a Buzzsprout
fan-mail form, and a $3/month support tier. No agency, no gatekeeper.

Adjacent, non-dedicated coverage: Tabletop Bellhop's podcast ran
[ep. 276 "Table For Two: Best Board Games for Couples"](https://tabletopbellhop.com/podcast/ep276/)
and ep. 19 "Two to Tango"; Bitewing Games published a
["Top 10 Board Games for Couples"](https://bitewinggames.com/top-10-board-games-for-couples-podcast-exclusive/)
episode.

*Inference:* the couples framing sustains exactly one podcast, with an audience
small enough that 61 episodes produced 2 ratings. It costs a single email to
approach and should be treated as a goodwill contact, not a channel.

### Observation: two blogs have genuinely open doors, and one of them has the traffic signal

[**Meeple Mountain**](https://www.meeplemountain.com/) is the strongest open door
found. It has published 2,300+ reviews since 2015 at a reported 10–15 articles per
week, and it runs a public
[Request a Game Review](https://www.meeplemountain.com/request-a-game-review/) form
with a documented process: ask 6–10 weeks ahead, each request is matched to a team
member interested in that style, no advance access to review content, pull quotes
available on request, no post-publication edits except rules errata. No budget, no
agency, no prior relationship required. Critically, it maintains a
[board game app section](https://www.meeplemountain.com/tag/board-game-app/).

[**Tabletop Bellhop**](https://tabletopbellhop.com/) (Moe Tousignant) is the best
topical fit. Two public addresses — `tabletopbellhop@gmail.com` and
`questions@tabletopbellhop.com` — plus an "Ask the Bellhop" reader question line
that explicitly feeds future articles and podcast episodes. That is the
lowest-friction contact path in this entire study. And the traffic signal is the
most useful single fact I found:

> the author notes that their original date-night games article receives more
> traffic than any other content they have published

Their [2024 edition](https://tabletopbellhop.com/gaming-advice/date-night-board-games/)
(2024-11-25) is the eighth-generation version of that idea. The site references
digital platforms such as Board Game Arena, so digital is not out of bounds, though
no score-tracker review was found.

Also relevant, with weaker contact paths: [The Tabletop
Family](https://thetabletopfamily.com/) (Adam and Kelsey, a couple) has run an
annual couples date-night list for **eight consecutive years** since 2019 — physical
games only, social DMs only. [Don't Eat The
Meeples](https://www.donteatthemeeples.com/) (Matt Montgomery) is a weekly
newsletter with a real two-player lean ("Ten great two-player games", 2024-02-07),
contactable only via comments.

*Inference:* the durable pattern across Tabletop Bellhop, The Tabletop Family and
Games4two is that couples and two-player content reliably outperforms for the people
who make it. The audience is large and the demand is proven. What is missing is a
mid-sized intermediary that both reaches that audience and reviews software.

### Observation: board game media reviews digital *games*, not digital *tools*

This is the finding that most constrains the plan, and it is consistent across every
outlet examined.

- **BG Stats / Board Game Stats** is the category-leading board game tracker and has
  shipped since 2014. Its own
  [Reviews page](https://www.bgstatsapp.com/board-game-stats/reviews/) contains
  nothing but App Store user testimonials as screenshots — no outlet names, no
  articles, no podcast or video coverage. *Inference:* if the dominant app in the
  category had press worth citing, that page is where it would be. Its absence is
  the strongest available evidence that this category does not get covered.
- **Meeple Mountain's app section holds 9 articles** spanning 2022-09-16 to
  2025-12-12. Eight are digital adaptations of physical board games or app-enhanced
  games (My City, Cascadia, Everdell, Quilts & Cats, My Father's Work, Tabletop
  Playground). Exactly one — TableTone, 2024-12-16 — is a standalone utility app. A
  separate Board Game Stats review exists but dates from **2017-11-24**.
- **The two clearest score-tracker reviews found anywhere** are One Board Family's
  ["Keeping Track of Your Gaming"](https://oneboardfamily.com/keeping-track-of-your-gaming/)
  (**2018-01-11**, covering Score Pal, Board Game Stats and Pointedly) and Everyday
  Meeple's [Top 5 BG Apps](https://everydaymeeple.com/top-5-bg-apps/) (undated,
  covering Board Game Stats among four other tools). Both are small family-gaming
  blogs, and the precedent is eight years old.

*Inference:* utility-app coverage in board game media runs at roughly one article a
year, at outlets with no two-player focus. A score tracker is not the kind of thing
this press writes about. That is a scope constraint on the launch plan, not a
messaging problem to be solved with a better pitch.

### Observation: the couples-app media layer exists, reviews apps seriously, and wants paying products

[**Ryan and Alex Duo Life**](https://www.ryanandalex.com/) is a husband-and-wife
couples-optimisation site — not board game media — and it is the only outlet found
that reviews apps for couples habitually and at length: ["The 12 Best Apps for
Married Couples"](https://www.ryanandalex.com/apps-for-married-couples/), plus
standalone reviews of [Relish](https://www.ryanandalex.com/relish-app-review/) and
[OurRitual](https://www.ryanandalex.com/ritual-app-review/). It separately publishes
[25 Award-Winning Board Games For Couples](https://www.ryanandalex.com/board-games-for-couples/)
(updated 2024-06-05), crowdsourced from its own Instagram and newsletter community.
It has an open contact form and a dedicated Sponsorship page.

*Inference:* this is the media layer behind study 01's finding that App Store
searches for "couples game night" return relationship apps. It exists, it takes
apps seriously, and its incentives are wrong for us: every app it covers is a paid
relationship product with an affiliate or referral programme. A free, local-only,
no-IAP app offers it no revenue hook. Worth one pitch framed on reader value, with
low expectations.

### Observation: there is no two-player community infrastructure, and one BGG guild is the exception

The best-targeted community found in this entire study is on BoardGameGeek:
[**guild 2122, "A Couple of Gamers"**](https://boardgamegeek.com/guild/2122) —
created by and for people who predominantly game with their significant other,
existing to recommend games specifically for two. Its activity is visible in its
recurring lists: an annual community-voted
[Top 25 for 2](https://boardgamegeek.com/geeklist/368144/top-25-for-2-2025), and a
monthly ["What Couples Are Playing (The 2-Player Game
List)"](https://boardgamegeek.com/geeklist/376063/what-couples-are-playing-the-2-player-game-list-ap)
geeklist still running as of April 2026.

That monthly geeklist is the most interesting artefact in this study: it is a
recurring gathering of couples who *voluntarily record what they played as a pair
each month* — which is precisely the behaviour Winning Couple automates. **I could
not measure it.** BGG served HTTP 403 to every automated fetch and a Cloudflare
interactive bot challenge in the browser pane, which I did not complete. Its member
count, activity level and self-promotion rules are unknown. This needs a manual pass
by Joshua, and it is the highest-value follow-up in the study.

Everything else is negative:

**Reddit — all figures unverified.** Reddit blocked every method available to me. The
counts and rules below come from [threadfox.vip](https://threadfox.vip/rules/for/games)
(65 communities, rules read 2026-09-26) and
[soar.sh](https://www.soar.sh/blog/self-promotion-rules-by-subreddit-database).
Treat them as leads, not evidence.

| Subreddit | Members (reported) | Self-promotion rule (reported) | Usable? |
|---|---|---|---|
| r/boardgames | 5,453,241 | "Promotion Requires Participation" | Only after months of genuine membership |
| r/AndroidGaming | 428,092 | Posts must start with [DEV] | Wrong platform |
| r/iosgaming | 267,746 | "No Dev Self-Promotion Outside Saturday Megathreads" | Yes — one lane, one day a week |
| r/SideProject | 260,000 | Allowed with project-context post | Yes — but audience is builders, not players |
| r/MobileGaming | 129,007 | "Promote Moderately" | Yes |
| r/tabletopgamedesign | 105,857 | "Do not market your game here" | No |
| r/tabletopsimulator | 57,522 | Allowed, with limits | Irrelevant |
| r/BoardgameDesign | 37,754 | "No Advertising or Promotion" | No |
| r/cardgames | 25,175 | Allowed | Yes |

**No two-player or couples subreddit appears in that 65-community survey.** Because
Reddit blocked direct checks of plausible names (r/twoplayerboardgames,
r/2PlayerBoardGames, r/boardgamesfortwo), their existence is *unknown*, not
disproven. Flagging that honestly: this is a hole in the study.

**Discord — nothing.** Board Game Quest's
[curated list](https://www.boardgamequest.com/board-game-discord-servers/) (updated
2025-06-08) contains 54 board game Discord servers. They are almost entirely
publisher-operated (Stonemaier, Leder, Czech Games Edition, Portal, Renegade, Chip
Theory), plus Gen Con, Tabletop Simulator and Board Game Quest's own. **None is
two-player or couples focused.** No member counts or self-promotion rules are
published. Publisher servers are the wrong venue for a third-party utility app.

### Observation: one channel publishes a flat refusal, which is worth knowing before spending effort

No Pun Included (112K subscribers, 70,000 median views — the highest
engagement-per-video of any channel measured) states on its channel page:

> "Note for publishers: we do not accept review copies, nor we do collaborate on
> sponsorships with publishers or any other..."

*Inference:* recorded so it is not mistaken for an opportunity on the strength of
its numbers. The same caution applies to Foster the Meeple (dormant 7 months) and
Girls' Game Shelf (dead 5 years), which still show 27K and 6K subscribers.

### Ranked by reachability for no budget and no audience

The brief asked for this ordering explicitly, and it inverts the size ranking.
Full reasoning per entry is in the data file.

| # | Channel | Type | Why here |
|---|---|---|---|
| 1 | **Meeple Mountain** | Blog | Open review-request form, no gatekeeper, real volume (10–15/week), and an existing app-review section. Best combination of open door and publishing capacity. Risk: app coverage skews to game ports. |
| 2 | **Tabletop Bellhop** | Blog + podcast | Two public emails plus an open reader-question line that feeds articles — lowest friction found. Their couples/date-night content is their highest-traffic asset ever. |
| 3 | **BGG guild 2122 + monthly "What Couples Are Playing"** | Community | The most precisely targeted audience anywhere: couples who already record what they play as a pair. Provisional — unmeasured, needs a manual pass. |
| 4 | **Board With Each Other** | Podcast | The only dedicated couples board game podcast, active, zero gatekeeping. Audience genuinely tiny (2 ratings / 61 episodes). Cheap to try. |
| 5 | **Allies or Enemies** | YouTube | Most explicit couples-two-player positioning with a live weekly cadence. 557 median views. No email — comments only. |
| 6 | **Board Games For Two** | YouTube | Most literally on-niche creator alive. 413 median views, 921 TikTok followers, slowing cadence, Instagram DM only. |
| 7 | **Before You Play** | YouTube | Best reach on paper by far (16,000 median views), genuinely 2-player, published Gmail, uploads several times weekly. Ranked here because the format — 60–100 min playthroughs — does not fit a utility app. |
| 8 | **A Pair of Meeples** | Blog | Perfect niche, open `reviews@` email, willing — and almost no audience left. |
| 9 | **Ryan and Alex Duo Life** | Couples lifestyle | Only outlet that habitually reviews couples apps. Open contact form, wrong incentives (affiliate-driven). |
| 10 | **The Broken Meeple** | YouTube | 5,900 median views, weekly, published Gmail, and says it "supports small content creators." Not two-player at all. |
| 11 | **r/boardgames** | Community | Largest pool by far; "Promotion Requires Participation" makes it a months-long investment, not a launch channel. Rule unverified. |
| 12 | **r/iosgaming Saturday megathread** | Community | One sanctioned lane, once a week. Rule-compliant, low yield. |
| 13 | **ThinkerThemer** | YouTube | 8,350 median views, a couple, but no two-player specificity and no contact found. |
| 14 | **Games4two** | YouTube + TikTok | Owns the niche (3.02M / 3.0M) and is the least reachable entry here: agency-gated, now a competitor for attention, wrong format. |
| 15 | **No Pun Included** | YouTube | 70,000 median views and a published refusal of all approaches. Do not spend effort. |
| 16 | **SU&SD / The Dice Tower** | YouTube | 461K / 362K, no two-player angle, publisher-shaped intake. |
| 17 | **Foster the Meeple / Girls' Game Shelf** | YouTube | Dormant and dead. Listed so subscriber counts do not mislead. |

The basis for the inversion, stated plainly: a 4,650-subscriber channel reaching
413 people per video with no email address is worth less than a blog with an open
submission form that publishes 10–15 articles a week and has an app-review section,
even though the blog's audience is undisclosed. Reachability is a product of
*whether the door opens*, *whether the format fits*, and only then *how many people
are behind it*. On the first two tests almost everything with real scale in this
niche fails.

## Implications for Winning Couple

1. **Amend assumption 4; do not soften it.** Suggested replacement: *"Two-player and
   couples gaming creators exist but are barbell-distributed — one 3M-follower
   agency-gated entertainment channel, then a tail of channels reaching a few hundred
   people per video, several dormant. There is no reachable mid-tier, no two-player
   subreddit or Discord, and board game media reviews digital games rather than
   utility apps. Reachable-at-zero-budget distribution amounts to two open
   submission forms, one BGG guild, and a micro-podcast."*
2. **Do not build the launch plan on borrowed audiences.** The arithmetic is
   unforgiving: the three most on-niche reachable creators reach roughly 400–600
   people per video, and the outlets that reach more either refuse approaches, take
   agency deals, or do not cover tools. Even a clean sweep of every Tier A and B
   channel in the ranking plausibly yields double-digit to low-hundreds installs.
   Plan for that number and be pleasantly surprised, rather than treating creator
   outreach as the growth engine.
3. **The strongest signal in this study is a content signal, not a channel signal.**
   Tabletop Bellhop's date-night article outperforms everything else they publish;
   The Tabletop Family has run the same annual couples list for eight years;
   Games4two reached 6M+ followers on two-player games alone. Demand for
   couples/two-player gaming content is demonstrably large and demonstrably
   under-served by anyone reachable. The implication is that Joshua's own content —
   under the Joshua Jumbles brand, on the topic Winning Couple already knows — is a
   better-value asset than pitching intermediaries who mostly cannot help. This is a
   real Phase 2 scope question, and it has a maintenance cost the constraints section
   should price.
4. **Send exactly two pitches, and send them early.** Meeple Mountain asks for 6–10
   weeks of lead time, which makes it a pre-launch action, not a launch-day one.
   Tabletop Bellhop's "Ask the Bellhop" line is the single cheapest approach
   available and is topically perfect. Both are free, both have documented open
   processes, and neither requires an existing audience. Everything else in the
   ranking is optional.
5. **Expect to be told a score tracker is out of scope, and pre-empt it.** The
   evidence is that this press covers digital *games*. The one utility app Meeple
   Mountain reviewed in four years was TableTone. The angle most likely to survive
   editorial triage is the couples/two-player *framing* — a story about how a pair
   tracks a rivalry over years — rather than "new score tracker app," which reads as
   the 161st entry in a commodity category (study 01).
6. **Reconsider what "free" costs on the couples-media side.** Assumption 5 says free
   costs us nothing. Study 01 supported that on pricing. This study adds a wrinkle:
   the one media layer that habitually reviews couples apps (Ryan and Alex) monetises
   through affiliate and sponsorship, so a free app with no affiliate programme gives
   it no reason to write. Free is still almost certainly right, but it is not
   literally costless — it closes one door.
7. **The BGG guild is the one genuinely promising lead and it is unmeasured.** A
   monthly geeklist where couples manually post the two-player games they played that
   month is Winning Couple's exact use case, gathered voluntarily, in one place.
   Before any creator outreach, Joshua should open
   [guild 2122](https://boardgamegeek.com/guild/2122) and the
   [monthly list](https://boardgamegeek.com/geeklist/376063/what-couples-are-playing-the-2-player-game-list-ap)
   in a normal browser and read the promotion rules. If self-promotion is permitted
   even narrowly, this outranks every creator in the table.
8. **Nothing here changes the product.** No finding argues for a feature, a cut, or a
   design change. This is a distribution finding, and its honest content is that
   distribution is harder than assumed.

## Open threads

- **BoardGameGeek is entirely unmeasured and it matters most.** Guild 2122's size,
  activity and self-promotion rules; the monthly geeklist's participation; whether
  BGG's own file/app sections would accept a listing. BGG defeated automated access
  here exactly as it did in study 01 — this is now the second study blocked by the
  same wall, and it should be escalated to a manual pass rather than re-attempted by
  an agent.
- **Reddit was never reached.** Every subreddit count and rule in this study is
  second-hand. More importantly, the existence of a two-player or couples board game
  subreddit is *unknown* — plausible names could not be checked. A two-minute manual
  check would close this.
- **Instagram was never measured.** Profile fetches hit a login wall. Given that
  Games4two's largest platform by engagement may be Instagram and that
  couples-lifestyle accounts skew there, this could be the single biggest blind spot
  in the study.
- **Nobody was contacted.** Every reachability judgement here is inferred from
  published contact details and stated policies, not from response rates. The
  cheapest possible test of assumption 4 is to email Meeple Mountain and Tabletop
  Bellhop and count replies. Until that happens, "reachable" means "has a published
  address," which is not the same thing.
- **No sponsorship or partnership precedent was found in this niche** — bearing
  directly on the context map's open question. No creator examined disclosed rates;
  no board game outlet was observed running a sponsored score-tracker placement;
  Games4two's only visible commercial pattern is publishing its own physical games.
  The honest answer to that open question is currently "none found, and the places
  one would expect to find it are empty."
- **Whether two-player creators would even accept an app pitch is untested.** The
  format mismatch is inferred from what they publish, not from anything they have
  said. Before You Play in particular has 16,000 median views and a public email; one
  email would establish whether the mismatch is real or assumed.
- **Games4two's actual reachability is assumed, not tested.** The agency address is
  observed; that an agency gates small-developer approaches is inference. Christopher
  and Alyson's personal Instagram handles are public in their bio
  (@christopher_t_james, @aly.m.james), so a direct route may exist. Low probability,
  near-zero cost.
- **A Pair of Meeples' operators are the best single interview subject available on
  whether this niche has an audience.** They ran the most precisely targeted outlet
  in it, wrote candidly about its collapse, and are still reachable at
  `reviews@apairofmeeples.com`. That conversation would test assumption 4 more
  directly than any amount of further sweeping — and it parallels study 01's open
  thread about reaching the developers of the two dead two-player apps.
