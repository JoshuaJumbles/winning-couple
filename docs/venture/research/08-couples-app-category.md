# 08 — The couples app category: conventions, and what to do about our name

- Date:              2026-09-29
- Run by:            subagent
- Question:          What conventions define the "couples app" category — language,
                     branding, visual design, onboarding, monetisation — and which
                     should Winning Couple adopt, subvert, or avoid?
- Confidence:        Medium-high on the category description; medium on the
                     recommendation. App metadata, subtitles, in-app purchase
                     lists, icon/screenshot artwork and review text all come from
                     Apple's own endpoints and are re-checkable from
                     `08-couples-app-category-data.json`. Two known weaknesses:
                     Apple's store page lists *every* IAP price point it holds,
                     including historical and A/B tiers, so a single "current
                     price" cannot be read off it (verified prices are cited
                     separately); and the audience-narrowing half of the strategic
                     question is supported by only three review-level data points,
                     which is thin. Flagged inline.

## Summary

The couples category is a large, entirely subscription-funded, engagement-mechanics
category whose defining features are precisely the ones Winning Couple has decided
not to build. Across 353 classified couples apps, **zero charge upfront** — every
single one is free-to-download with in-app purchases, and the observed subscription
range is $4.99–$19.99 monthly and $14.99–$119.99 annually. The category's core
loop is two-device pairing by invite code, a daily question, and a shared streak;
three of the apps profiled sell **streak repair as an in-app purchase**
($0.99–$3.99). Its visual grammar is a violet-or-blush palette, rounded sans
headlines over a saturated background, real photographs of affectionate young
couples, and a first screenshot that leads with a superlative ("#1 Couples App",
"#1 App for Couples", "The Exclusive App for Couples").

On discovery, the finding is sharper than study 01's. The word "couples" is a
**category router in Apple's search index**: "couples score keeper" returns
Evergreen, Between and Paired above any scorekeeper, and "couples game tracker"
returns no tracker at all. It does not, however, poison a query that already
carries tracker vocabulary — "couple board game score tracker" still returns
Keep Score and Score Anything. So the word costs nothing in tracker searches and
buys nothing; what it does is put the app on a shelf where the incumbents have
200,000 ratings and eight-figure download claims.

**My view: keep the name if Joshua wants it, but position the product entirely
outside this category, and be clear-eyed that the name is doing zero work for us
and importing three specific liabilities.** The category precedent that actually
fits us is not Paired — it is Honeydue (couples finance, Apple-featured, 10,232
ratings), Cupla (couples calendar), and Sweatmates (partner fitness, 12,733
ratings) — couples-*adjacent utilities* that keep the warmth and refuse the
relationship-wellness machinery. Of those, Sweatmates is the most instructive:
it serves exactly our shape of user and never uses the word "couple" anywhere,
choosing "partner" and "mates" instead.

## Findings

### Method and scope

Swept the US App Store via Apple's public search API across 24 couples-related
terms ("couples app", "app for couples", "relationship app", "couples game
night", "long distance couples", "us two", "husband wife app", and similar —
full list in the data file), returning **677 unique apps**. Filtered out dating
apps (any of a dating-vocabulary list in the first 600 characters of the
description) and required at least one established-pair phrase, leaving **353
apps** classified as the couples category. Full metadata from
`itunes.apple.com/lookup`; subtitles and in-app purchase lists scraped from the
`apps.apple.com` store pages; review text from Apple's public customer-reviews
feed (2,000 reviews pulled across 14 apps; Agapé and Cupla returned none).
Icons and first-three screenshots downloaded and median-cut quantised for
palette. Dating apps and therapy-content apps excluded per brief — ReGain
(Couples Therapy) and Gottman Card Decks appear in counts but are not profiled.

Nothing was installed. Except for the review quotes, every behavioural claim
below is a developer's own copy.

### The apps profiled

Price column is upfront price, then the in-app purchase range Apple lists. Apple
lists historical and A/B-tested tiers, so treat these ranges as the span of
prices ever offered, **not** the current price (see caveats).

| App | Developer | Subtitle (as shown on the store page) | Price | Ratings (US) | Last update | Link |
|---|---|---|---|---|---|---|
| Paired: Couples & Relationship | Better Half Limited | "Questions, Long Distance Games" | Free; Premium $14.99/mo, $29.99–$74.99/yr listed | 208,099 (4.73) | 2026-09-28 | [id1469609343](https://apps.apple.com/us/app/paired-couples-relationship/id1469609343) |
| Evergreen: Relationship Growth | Evergreen Technologies | "Couples Quiz, Games, & Advice" | Free; "Unlimited access" $9.99–$69.99 listed | 54,535 (4.82) | 2026-09-05 | [id1573360122](https://apps.apple.com/us/app/evergreen-relationship-growth/id1573360122) |
| Cozy Couples: Relationship App | Clarity Applications | "Home for love & happy moments" | Free; Plus $4.99–$39.99; **Streak Repair $1.99**; star packs $2.99–$9.99 | 45,352 (4.84) | 2026-09-29 | [id6463766369](https://apps.apple.com/us/app/cozy-couples-relationship-app/id6463766369) |
| Couple Joy - Relationship App | HEARTBIT S.R.L. | "Long Distance & Love Tracker" | Free; Premium $12.99–$39.99; **Streak Repair $0.99 / 2d $1.99 / 3d $2.99 / 4d $3.99** | 38,070 (4.86) | 2026-07-27 | [id1624758651](https://apps.apple.com/us/app/couple-joy-relationship-app/id1624758651) |
| Agapé: Feel Close When Apart | Agape Wellness | **"Friends, Family, Couples"** | Free; Premium $9.99–$14.99/mo, $19.99–$99.99/yr, Lifetime $199.99 | 26,229 (4.80) | 2026-04-05 | [id1507907556](https://apps.apple.com/us/app/agap%C3%A9-feel-close-when-apart/id1507907556) |
| Lasting: Marriage & Couples | Groop Internet Platform | "Guided Relationship Counseling" | Free; Premium/Plus $11.99–$89.99 listed | 24,975 (4.68) | **2025-02-19** | [id1225049619](https://apps.apple.com/us/app/lasting-marriage-couples/id1225049619) |
| Between, Couples Love Tracker | DLT Partners | "Daily Relationship Tracker" | Free; Plus $2.99/mo, $24.99/yr, **Lifetime $26.99**; "Hearts" currency $0.99–$8.99 | 21,211 (4.80) | 2026-09-22 | [id458035189](https://apps.apple.com/us/app/between-couples-love-tracker/id458035189) |
| SumOne: For Relationships | sandfox | "Daily question game for couple" | Free; $5.99/mo, $29.99/yr; Gem packs $1.99–$11.99 | 18,504 (4.88) | 2026-09-28 | [id1469506430](https://apps.apple.com/us/app/sumone-for-relationships/id1469506430) |
| Love Nudge | Moody Bible Institute | "The Love Language® App" | Free; **single $9.99 unlock, no subscription** | 18,407 (4.58) | **2024-07-19** | [id495326842](https://apps.apple.com/us/app/love-nudge/id495326842) |
| Candle: Couples & Relationship | Encore AI Labs | "Games, Photos, Questions, Date" | Free; $4.99/wk, $12.99/mo, $39.99–$49.99/yr; **Streak Reignite $2.99**; "Sparks" $0.99–$4.99 | 11,350 (4.76) | 2026-09-23 | [id6743355635](https://apps.apple.com/us/app/candle-couples-relationship/id6743355635) |
| Love8 - App for Couples | Chongqing Daole Er | "Stay close, grow your love" | Free; **"Weekly – For 2 Users" $2.99–$4.99**, monthly $9.99, yearly $29.99–$39.99 | 6,807 (4.61) | 2026-09-26 | [id6448163027](https://apps.apple.com/us/app/love8-app-for-couples/id6448163027) |
| Coral: Couples & Relationship | Athais Inc. | "Questions, quiz, games, & chat" | Free; $12.99/mo, $39.99–$89.99/yr | 3,510 (4.56) | 2026-03-26 | [id1448861466](https://apps.apple.com/us/app/coral-couples-relationship/id1448861466) |
| Cupla: Couples Shared Calendar | Cupla Limited | "Shared Plans, Tasks & Dates" | Free; $4.99–$7.99/mo, $34.99–$59.99/yr | 2,282 (4.69) | 2026-09-10 | [id1557764033](https://apps.apple.com/us/app/cupla-couples-shared-calendar/id1557764033) |
| Lovewick: Relationship Tracker | Lovewick, Inc. | "+ Couple Questions, Date Ideas" | Free; Plus $9.99/mo, $14.99/3mo, $29.99/yr | 1,934 (4.77) | 2026-06-30 | [id1516199115](https://apps.apple.com/us/app/lovewick-relationship-tracker/id1516199115) |
| Gottman Card Decks | Affective Software | "Improve your relationship" | **Free, no IAP at all** | 1,666 (4.84) | 2026-06-15 | [id1292398843](https://apps.apple.com/us/app/gottman-card-decks/id1292398843) |
| Den: Couples App & Widgets | Borg Labs | "Couples Quiz, Widgets, Games" | Free; $5.99–$12.99/mo, $19.99–$39.99/yr; "Honey Jar" $1.99–$7.99 | 18 (4.78) | 2026-09-24 | [id6760429911](https://apps.apple.com/us/app/den-couples-app-widgets/id6760429911) |
| PairStreak - Couples App | Mailmunch, Inc. | "A daily ritual for couples" | Free; $1.99/wk, $4.99–$9.99/mo, $29.99–$49.99/yr | 31 (4.94) | 2026-09-22 | [id6761079604](https://apps.apple.com/us/app/pairstreak-couples-app/id6761079604) |

Couples-adjacent **utilities**, which turn out to matter more to us than the
relationship apps above:

| App | What it is | Price | Ratings | Link |
|---|---|---|---|---|
| Honeydue: Couples Finance | Shared budgeting; Apple-featured | Free | 10,232 (4.49) | [id1157633945](https://apps.apple.com/us/app/honeydue-couples-finance/id1157633945) |
| Sweatmates: Partner Fitness | Two-person workout accountability, with wagers | Free; logging requires subscription | 12,733 (4.92) | [id6756000479](https://apps.apple.com/us/app/sweatmates-partner-fitness/id6756000479) |
| UsTwo - Friends & Couples | Shared canvas/status/questions | Free | 821 (4.61) | [id6759428131](https://apps.apple.com/us/app/ustwo-friends-couples/id6759428131) |

### Observation: positioning language is verb-first and improvement-shaped

The category does not describe what the app *is*. It describes what will happen
to your relationship. Actual first lines:

> "Welcome to Paired: the app that brings couples closer. Life can be messy, but
> your relationship doesn't have to be." — Paired

> "Grow together and build a healthy, loving, and lasting relationship." — Evergreen

> "Cupla: The fastest way to a better relationship. Because great relationships
> don't just happen. They are planned together." — Cupla

> "Most relationships don't end in one moment, they drift apart over time."
> — Candle

The verbs are *grow, deepen, strengthen, connect, reconnect, build, nurture*.
The unit of time is always small and daily — "in just 5 minutes a day" (Paired),
"a few minutes a day" (Lasting), "1-minute daily rituals" (Candle), "only takes a
minute a day" (Agapé). The claim is nearly always quantified or credentialed:
"Scientifically proven to increase relationship satisfaction" (Paired),
"university-backed research" and "75% of users say Cupla reduces stress" (Cupla),
"97% of users… report Agapé positively affecting their relationships" (Agapé).
51 of 353 descriptions invoke research, experts, science, or psychology.

Titles are keyword compounds, not names. Across the 353, the most common title
words are *couples* (179), *relationship* (65), *love* (59), *couple* (56),
*games* (50), *tracker* (25), *questions* (24). Subtitles are pure keyword
inventory — "Questions, Long Distance Games", "Couples Quiz, Games, & Advice",
"Shared Plans, Tasks & Dates".

*Inference:* "Winning Couple" is formally unlike every name in this category. It
is a two-word phrase with no function word in it. On a couples shelf that reads
as unhelpfully vague; on a tracker shelf it reads as a brand. That is an argument
for the tracker shelf, not against the name.

### Observation: the visual grammar is violet, blush, and a superlative

From the 512px icons, quantised: **Paired #8B50FA (80% of icon area)**, Love Nudge
#5C26C1/#8E54FC, Cozy Couples #132358/#8D5D9B/#B56796, Den #C3B3CE, SumOne
#8857BC — violet dominates. The second cluster is blush/rose: Couple Joy #FB5596,
PairStreak #F6C5D3, Cupla #E96E9E over cream, Love8 white with #FCCAF9. The
outliers are Between (teal #1ACEC5, 81% of icon) and Lasting (blue #3498FA) —
and Lasting is the therapy-adjacent one.

Screenshot conventions, observed directly across 15 apps (contact sheets built
from the first three screenshots of each):

- **Caption above device.** A 2–3 word-per-line headline in a rounded geometric
  sans, set on a saturated flat background, with a single phone mockup below or
  behind it. Near-universal.
- **The first screenshot is a claim, not a feature.** "#1 Couples App" with
  "4.7 · 213,029 RATINGS · 17 Million DOWNLOADS" (Paired); "#1 App for Couples"
  with a 4.9 laurel and "150,000+ reviews" (Couple Joy); "#1 couples game in the
  world" (Candle); "The **Exclusive** App for Couples · 10M+ COUPLES USE"
  (Love8); "10M+ USERS" (SumOne). Lasting's opens with a press-logo bar — Good
  Morning America, Forbes, Today, GQ — plus a "FEATURED BY Apple" laurel, and
  closes on a pull-quote: "This app saved our marriage."
- **Real photographs of affectionate young couples**, usually a forehead kiss,
  usually heterosexual, usually white or lightly diverse. Between, Cupla,
  Couple Joy, Candle and Lovewick all do this. Cupla's is a four-up grid of
  couples on sofas and in kitchens.
- **Flat illustration with rounded, warm, slightly childlike forms** where photos
  aren't used — Evergreen's growing seedling, Lasting's two figures at a café
  table, Cozy Couples' pixel-art living room with a cat, SumOne's hatching egg,
  Den's cartoon bears by a fireplace.
- **The two-named-pair header.** Lovewick's hero screenshot shows a joined photo
  over "Alicia & Chris — 19 days until our Anniversary". Between's shows two
  avatars flanking "Anniversary 55 days left / Laura ❤️ Oliver". Couple Joy shows
  "Together for 11 years 10 months 24 days 16 hours 30 minutes".

The one register break is PairStreak, which uses a serif over blush
("One photo a day. Just you two." / "Your story, one day at a time.") and no
superlative. It has 31 ratings, so this is a style note, not a proven approach.

*Inference:* the two-named-pair header is the single convention Winning Couple
already shares, and it is the one worth keeping. The superlative-first screenshot
is unavailable to a launch app with no ratings, and the daily-ritual illustration
vocabulary would actively mislead.

### Observation: the category is 100% free-to-download and subscription-funded

Of the 353 classified couples apps, **353 are free upfront**. In the entire
677-app sweep only three apps carry a price, and none is a couples app (iPeriod
$1.99, Awesome Calendar $9.99, The Secret Language of Light $9.99).

Of the 17 profiled, **15 sell subscriptions**. The two exceptions are instructive:
Gottman Card Decks is free with no IAP whatsoever (1,666 ratings, 4.84 — the
highest-rated in the set), and Love Nudge sells a single $9.99 unlock and has not
shipped since July 2024.

Verified current prices (not the store's historical list): Paired states
"$79.99 per couple per year, which works out at just $3.33 per partner a month",
and "only one partner needs to subscribe. Once you're paired together in the app,
Premium access is automatically shared with both partners' accounts"
(paired.com/faq, retrieved 2026-09-29). Between's own description gives
"1 month($2.99) / 6 months($12.99) / 1 year($13.99)… Lifetime ($26.99)" while
the store page lists a $24.99 annual tier — the two disagree, which is exactly
the ambiguity the caveats warn about. Love8 prices its tiers explicitly as
"Weekly – For 2 Users", "Yearly – For 2 Users"; Lasting says Premium "unlocks the
entire app for two users (you and your partner!)".

Beyond subscriptions the category runs **soft currencies and gacha**: Between's
Hearts, SumOne's Gems and "pebbles", Cozy Couples' Stars, Den's Honey Jars,
Candle's Sparks, Couple Tree's Waterdrops and Tree Logs, Moonpair's Stardust,
Widgetable's diamonds and pet eggs. Apple's "Loot Boxes" content advisory appears
on SumOne, Love8 and Widgetable.

And it sells **streak repair**: Cozy Couples "(Streak Repair)" $1.99, Couple Joy
"Streak Repair" tiered $0.99 / $1.99 / $2.99 / $3.99 by days recovered, Candle
"Streak Reignite" $2.99.

### Observation: paywall friction dominates the negative reviews, exactly as in trackers

Sampled 2,000 reviews across 14 apps. Paywall and subscription complaints are the
single largest theme in every app with a meaningful sample: Lasting 82 mentions
in 250 reviews, Coral 45/200, Cozy Couples 33/250, Candle 34/150, Evergreen
29/150, Love8 23/250.

The strongest pattern is **retroactive metering** — features that were free being
moved behind the paywall:

> "We cant look old diary entries, old photos, old notes without paying for a
> subscription. I used to love looking back at entries from up to 2 years ago…
> It honestly feels cruel and defeats the purpose of this app."
> (Cozy Couples, 1-star, v1.76, "Cash grab")

> "Like many others, I'm also disappointed that the team took the questions —
> arguably the ONLY reason why my husband and I use the app — from 10 free
> questions per day down to only 1 per day. We've been using the app for years…
> But you had a great thing and you ruined it."
> (Lovewick, 1-star, v1.77, "Disappointed as a Long Time User")

> "I would spend $5 to full unlock the app but that isn't a choice. $40 a year
> for a couple questions a day and games I could play online for free
> elsewhere…" (Candle, 1-star, v1.8.3, "Terrible Update")

And the same surprise-charge complaint study 01 found in trackers:

> "Got charged $45 when I thought I had the free version. If I had known I was
> going to have to pay for the app, I wouldn't have downloaded."
> (Candle, 1-star, v1.8.3)

> "Annoying as f price is not listed before downloading but because it has a 7
> dsy free trial it shows up under the free apps.. no access until you pick a
> subscription…" (Lasting, 1-star, v3.2.30, "Price")

*Inference:* this replicates study 01's finding in a different category with a
different price structure, which strengthens it considerably. Metered free tiers
and retroactive paywalls are the reliably rating-destroying pattern in both
categories Winning Couple could plausibly list in. Recommendation 3 of study 01
stands and is now doubly evidenced.

### Observation: streaks are the retention mechanic, and they generate grief

58 of 353 descriptions mention streaks; 55 mention a daily question. In the
reviews, streaks are the second-largest complaint theme after paywalls, and
almost every mention is about losing one to a bug:

> "My partner and I were enjoying this app a lot, but then we lost our 80 day
> streak on a day we both played. Our notifications even show that we sent
> affection, played with our cat, and wrote in the diary. **Now it says we have
> to pay if we want our streak back. Feels scammy.**"
> (Cozy Couples, 1-star, v1.76, "Cash grab")

> "My wife and I have been enjoying this game together and have consistently hit
> every single day for 45 days since getting the app. Today we opened it and saw
> our streak ended. We can see we sent each other messages yesterday. Then it
> pushes the plus to get the streak back? We're so disappointed."
> (Cozy Couples, 3-star, v1.74, "Breaks your streak")

> "Sometimes we have days without our phone and it's just something that would be
> awesome to not have to deal with a $3 charge to keep the streak going."
> (Candle, 4-star, v1.8.0)

> "Recently the tasked questions have been skipping a day or two at a time making
> my bf and I lose a 169 day streak." (Evergreen, 3-star, v1.44, "Losing our streak")

There is a positive side — "I have a streak of 1203 days in a row of using it"
(Paired, 5-star, v26.33.0) — but a longtime Cozy Couples user with a 783-day
streak and two years of paid premium still wrote a 1-star review.

*Inference:* streaks work and they cost. They convert an emotional relationship
into something breakable by a sync bug, and once the app sells the repair, every
bug looks like a business model. Winning Couple's win history is an *accumulating*
record with nothing to lose, which is the better version of the same
come-back-tomorrow instinct. Do not add streaks.

### Observation: onboarding is a mandatory two-device pairing, and the app is thin without it

Every profiled app except Gottman Card Decks and Love Nudge requires an account
and a second installed device for its core feature. The mechanism is an invite
link or a short code:

- **Paired**: a unique pairing link plus a 6-character code. The FAQ is explicit
  that "our primary features — questions, relationship quizzes and couple games —
  are designed for two partners to do together," and that a solo user gets one
  pre-selected activity a day (paired.com, retrieved 2026-09-29).
- **PairStreak**: "Pair up — Invite your partner with a private link. No one else
  can ever join your pair."
- **Duetto**: "Pair with one short code or a link — your partner joins in seconds."
- **Cozy Couples / Couple Joy / Love8**: all close their descriptions with the same
  imperative — "Download … and invite your partner today!"

57 of 353 descriptions contain explicit invite/pairing language. The *withheld
reveal* is the near-universal ritual: "Add your answers and then unlock your
partners responses" (Paired), "you're only able to see each other's response,
once you have both responded" (Agapé), "Your partner's photo and answers unlock
the moment you share yours. No peeking early — that's the magic" (PairStreak).

The only app I found that positions solo use as legitimate is **Lovewick**: "use
alone or as a paired app for couples to sync questions, memories, and date ideas
across devices."

The dependency has costs visible in reviews:

> "My husband and I both downloaded and tried multiple times to pair the app and
> it wouldn't work." (Lasting, 1-star, v2.3.3, "Disappointed")

> "This app will only work if you both TRY… keep track of how often your partner
> suggests starting a session and comparing answers. My partner did not do those
> things and I was the one putting in effort." (Lasting, 5-star, v2.7.4)

> "There needs to be some type of motivation within the app… Something to get my
> partner to actually use it. I'm all over the app checking things out and they
> could care less." (Coral, 3-star, v3.0.95)

> "I had downloaded the app, but unfortunately my partner and I broke up before he
> downloaded the app. I deleted it, but I was still charged the full subscription
> fee despite never actually using the app." (Lasting, 1-star, v2.3.3)

*Inference and a genuine asset:* Winning Couple's single-device, no-account model
is not merely different from this category — it removes its single largest
onboarding failure mode. Two people at one table sharing one phone is the
scenario every couples app has to simulate badly over the network. This is worth
saying out loud in the listing, and it is a claim about restraint that can be
shown in a screenshot, exactly as study 01 recommended.

### Observation: the category assumes romance, long distance, and improvement

114 of 353 descriptions mention long distance; 63 mention marriage, spouse,
husband or wife. Only **5 of 353 titles** name friends, besties or family
(`noteit - bff widget`, `UsTwo - Friends & Couples`, `Better Family・Relationship
App`, and two AI-companion apps). The default assumed pair is romantic,
co-habiting or long-distance, and in need of work.

The exceptions are conspicuous because they are among the biggest apps in their
sub-segment:

- **Agapé** subtitles itself "Friends, Family, Couples" and defines its remit as
  relationships "both romantic, familial, and platonic" — 26,229 ratings.
- **Widgetable: Besties & Couples** — 385,666 ratings. **noteit - bff widget** —
  98,822. Both put friends *first*.
- **Couple Games: 2 Player Games** opens with "made for couples, friends and
  anyone who wants a rematch."

And real non-romantic pairs are quietly using couples apps anyway. Three cases in
the 2,000 reviews sampled:

> "this app is so cute I always saw ads for it but **im not in a relationship** so
> I was like ugh who am I going to get this with and then I sent it to my long
> distance best friend… **i dont think it has to be closed off just for
> couples/relationships**" (Cozy Couples, 4-star, v1.74, "love! but I use this
> with my bff")

> "me and my cousin the app to stay in touch while she's in college"
> (Candle, 2-star, v1.8.0)

> "I use this with my best friend, minus the spicy stuff."
> (Lovewick, 4-star, v1.78)

*Inference, and I want to be honest about its weakness:* three reviews is not
evidence of a lost audience. It is evidence that the boundary is porous in the
direction of *use*, and it tells us nothing about people who saw a couples app
and did not install it. **Negative result: I found no direct evidence anywhere
that the word "couple" caused a non-couple not to download something.** That
half of the strategic question remains untested and is the single most useful
thing a follow-up could settle.

### Observation: "couples" is a search router, and it routes away from us

Direct A/B on Apple's search API, 2026-09-29 (all in the data file):

| Query | Top results |
|---|---|
| `board game score tracker` | Score Keeper for Game Night, Score Anything, Board Game Score Tracker, Keep Score — **all trackers** |
| `couple board game score tracker` | Super Scoreboard, Score Keeper for Game Night, Line 'Em Up, Score Anything, Keep Score — **still trackers** |
| `couples score keeper` | Evergreen, Between, Paired, Desire — **first scorekeeper is #5 (Super Scoreboard)** |
| `couples game tracker` | Couple Joy, Paired, Candle, Tethered, Cozy Couples — **no tracker in the top 10** |
| `couples board game tracker` | Between, Paired, Couple Joy, Tethered, Couples Games: Spicy Challenge — one tracker at #6 |
| `winning couple` | Between, Paired, Couple Life 3D, Couple Run!, Couple Widget — **no tracker at all** |

*Verification note (Claude, 2026-09-30).* Re-running these six queries the next
day reproduced four of them exactly — `board game score tracker`, `couple board
game score tracker`, `couples game tracker` and `winning couple` all returned
what is recorded above, including "no tracker at all" for our own name.
**`couples score keeper` did not reproduce:** it returned Desire first and then
Score Keeper for Game Night at #2, so the "first scorekeeper is #5" ranking is
not stable. Read the directional finding — short couples-flavoured queries route
to relationship apps, while queries carrying tracker vocabulary survive — as
holding, and treat individual ranks as volatile.

This refines study 01's finding. The word "couples" does not destroy a query that
already carries strong tracker vocabulary ("board game score tracker" survives
having "couple" prepended). What it does is dominate any *short* query it appears
in, routing to Lifestyle relationship apps. And searching our own name returns
nothing resembling our product.

Separately: only **9 of 353** couples apps mention scoring, boards, head-to-head
or leaderboards at all, and every one of them is scoring its *own* in-app
mini-games (Pookie, Promise, Duo, Foreplay, LoveDare, Duetto, Adeux, Nexora,
Couple Games: 2 Player Games — highest rating count in that group is 1,305, and
five of the nine have fewer than five ratings). **There is no couples app that
tracks scores for games played on a physical table.** That is a real gap and it
is also a market that has never been shown to exist.

### Observation: the precedent that actually fits us is the couples *utility*

Three apps in the sweep are structurally what Winning Couple is — a specific
practical job, done for two people, wearing couples branding:

- **Honeydue: Couples Finance** (10,232 ratings, free, Apple-featured): "the best
  personal finance app for couples… See the big picture and argue less about the
  little things."
- **Cupla** (2,282): its own site says it is "**Built specifically for two**" and
  "the only couples app built from the ground up for two," and that it was
  "designed by a real couple, for couples, from day one" (cupla.app, retrieved
  2026-09-29). That is almost verbatim the restraint position study 01 told us to
  take — and it is taken, by a calendar app.
- **Sweatmates: Partner Fitness** (12,733 ratings, 4.92, shipped 2026): two-person
  workout accountability. "Instead of tracking stats or metrics, Sweatmates
  focuses on showing up together." It even runs light competitive stakes — "If you
  miss your weekly goal, you owe a simple wager like buying dinner or doing a
  chore." **It never uses the word "couple" anywhere in its listing.** It says
  partner and mates.

*Inference:* couples-adjacent utilities can build five-figure audiences without
adopting any relationship-wellness convention. Sweatmates in particular
demonstrates that the *warmth* Joshua wants from the couples register is
obtainable from "partner"/"two"/"us" vocabulary without buying the category.

## Implications for Winning Couple

1. **Do not enter this category. Not a single convention in it survives contact
   with our product.** Mandatory pairing, accounts, cloud sync, daily questions,
   streaks, streak-repair IAP, soft currencies, virtual pets, distance widgets,
   "spicy" content tiers, subscriptions. We have none of these and want none of
   them. An app named like a couples app that has none of them will be judged
   against them.

2. **The name is doing zero work and importing three liabilities.** Stated
   plainly, because the brief asks for it: the couples framing buys us no
   discovery (no tracker query is improved by it; "couples game tracker" returns
   no trackers), it sets an expectation of pairing and relationship features we
   will not build, and it invites comparison with a category whose baseline
   trust problem is subscription surprise. It is not fatal — "Winning Couple"
   is distinctive, has no App Store collision, and "Winning" carries the
   game-night claim on its own — but its only demonstrated *effect* is negative.
   **Recommendation: keep the name as a wordmark if Joshua is attached to it, and
   position on game night everywhere it matters — subtitle, keywords, category,
   screenshots, first line of description.** "Couple" becomes tone, never
   position. If the name is genuinely still open, the evidence points at the
   partner/two/us register (Sweatmates, Cupla, Duetto, UsTwo) over the couple
   register, and now is the only cheap moment to act on that.

3. **List in Games or Entertainment, not Lifestyle.** 193 of 353 couples apps are
   Lifestyle. That is the shelf the word "couple" pulls toward and it is the wrong
   one — study 01's 161 trackers live in Entertainment, Utilities and Games. The
   subtitle should read like a tracker subtitle, not a couples subtitle: function
   words, no superlative, e.g. board games, scores, win history, two players.

4. **Say "no pairing, no account, one phone" in the listing.** This is the one
   place where the couples category hands us a free differentiator. Their single
   largest onboarding failure is the second install ("both downloaded and tried
   multiple times to pair the app and it wouldn't work"; "get my partner on
   board"). We simply do not have that failure. It is checkable in a screenshot
   and it is a claim about restraint, which is what recommendation 1 of study 01
   asked for.

5. **Steal exactly one thing: the two-named-pair header.** Lovewick's "Alicia &
   Chris", Between's "Laura ❤️ Oliver", Couple Joy's "Together for…". It is the
   single convention that carries the warmth of the category with none of its
   machinery, and Winning Couple already has the data for it. This is the place
   the couples register earns its keep — in the product and in the screenshots,
   not in the search field.

6. **Do not add streaks, and do not meter anything.** Both are now evidenced in
   two independent categories. Streaks in couples apps produce more 1-star
   reviews than they produce retention testimonials in the sample read, and
   selling the repair is read as extortion. Retroactive paywalls destroy
   long-tenured paying users. The win history is the right come-back-tomorrow
   mechanic precisely because it can only grow.

7. **Assumption 4 in the context map needs re-examination, not amendment.** It
   assumes "a reachable audience: creators and communities focused on two-player
   and couples gaming." This study says nothing about creators, but it does say
   the *App Store* channel for couples framing is fully occupied by
   200,000-rating incumbents. If assumption 4 is going to carry the couples
   framing, it has to carry it entirely outside the store.

8. **Nothing here changes scope.** No feature in this study should be added. That
   is the honest answer for the product; the whole value of the study is
   negative and positional.

## Open threads

- **Nobody has tested whether "couple" excludes non-couples at the listing
  level.** Three reviewers use couples apps with a best friend, a cousin and a
  bestie; none of that tells us about people who bounced. A cheap test exists:
  two versions of the same screenshot set, one headlined "for the two of you" and
  one "for couples", shown to siblings/roommates/friends who play regularly. This
  is the single highest-value unanswered question in the brief and I could not
  answer it from public data.
- **Current prices could not be pinned down from the store.** Apple's page lists
  every price tier it holds, including historical and A/B-tested ones; Paired
  shows ten. Only Paired's $79.99/couple/year was verified from the developer.
  Anyone re-running this should scrape prices from developer sites, not the store.
- **Agapé and Cupla returned zero reviews** from Apple's feed on the date
  observed, so the two apps most relevant to the "any pair" and "utility for two"
  questions have no qualitative signal here at all.
- **The couples-game-night app cluster is brand new and unmeasured.** Duetto
  (2 ratings, shipped 2026-09), Adeux (0), Couple Games: 2 Player Games (4),
  LoveYug (1) — a handful of 2026 launches naming exactly our territory, none
  with enough traction to read. Worth re-checking in six months: if any of them
  takes off, the "couples game night" search term becomes a real discovery path
  and recommendation 2 changes.
- **Android was not examined**, and several of the largest apps here (Between,
  SumOne, Love8, Widgetable) are Korean or Chinese in origin with much larger
  non-US footprints. The conventions described are US-store conventions.
- **No app was installed.** Onboarding descriptions above are from FAQs and store
  copy. A hands-on pass through Cupla's and Sweatmates' first-run — the two
  closest structural analogues — would be worth an hour, specifically to see how
  a couples-branded *utility* introduces itself before it asks for a partner.
- **The Gottman Card Decks result is unexplained and interesting.** Free, no IAP
  at all, 4.84 across 1,666 ratings — the highest-rated app in the profiled set,
  monetised by nothing. Whether that is a loss-leader for a therapy business or
  a genuinely sustainable model is unknown and relevant to our own open pricing
  question.
