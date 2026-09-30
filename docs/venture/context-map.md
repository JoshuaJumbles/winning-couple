# Context map

What we know, what we're assuming, and what's still open. Updated as things
change — if a line here is stale, fix it in the same commit as the work that
made it stale.

## The product today

A working two-player board game score tracker for iOS. Onboarding for two
players, a game list, per-game detail with win history, three scoring flows
(points turn-log, competitive win/loss, cooperative win/loss), a post-game
celebration screen with notes and photo, and settings. 13 PRs merged; the core
loop is complete and usable. Architecture and workflow are documented in the
repo root and in the project memory.

Design source: the Figma file **Winning Couple**, built from the shipped
SwiftUI — tokens, components, and the Live Scoring and Game Detail screens.

## Who it's for

Two people who play games together regularly and sit in the same room while
doing it. Not tournament organisers, not large groups, not remote play. The
design has leaned on this the whole way: two players is a hard assumption, and
that's a feature, not a limitation to remove later.

## Assumptions we have not tested

Each of these is a research target in Phase 1. Amended ones cite the study that
changed them; the rest are still beliefs, not findings.

1. ~~Existing trackers are built for groups, and two-player couples are
   underserved by them.~~ **Amended after [study 01](research/01-competitors-two-player.md):**
   no tracker is positioned for couples, and group-shaped apps handle two
   players awkwardly — but two-player head-to-head records are a commodity
   feature in free apps. The gap is positioning and restraint, not capability.
   *Sharpened by [study 02](research/02-collection-and-play-logging.md): 21 of 39
   collection-and-logging apps advertise win rates or head-to-head, and every
   entrant since 2025 leads with them, so the win-history chart is parity rather
   than differentiation. What no app in either half of the category does is
   assume two permanent players. The differentiator is the **absent roster** —
   and Board Game Shelf sells the workaround ("Player Groups… so logging a play
   takes a single tap") as a paid Pro feature, which is direct evidence that
   roster friction is real enough for developers to price.*
2. People who would use this are currently tracking scores on paper or in
   a notes app.
3. Personalisation (colours, emoji avatars) matters more for a couple than
   detailed statistics do. *Partially challenged by study 01: personalisation
   is real but already common (16 of 161 trackers advertise it), and the one
   reviewer who asked for it wanted to colour-match game pieces, not express a
   relationship. The belief may hold; the stated reason does not.*
4. ~~There is a reachable audience: creators and communities focused on
   two-player and couples gaming.~~ **Amended after [study 05](research/05-channels-and-creators.md):**
   they exist, but they are barbell-distributed — one 3.02M-subscriber channel
   (Games4two) that is talent-agency-gated and makes challenge entertainment
   rather than reviews, then a tail of on-niche channels reaching 400–600 people
   per video, several dormant. No two-player or couples subreddit or Discord was
   found. Board game media reviews digital *games*, not digital *tools*: the
   category-leading tracker has no press at all after twelve years. Reachable
   distribution at zero budget amounts to two open submission forms (Meeple
   Mountain, Tabletop Bellhop), one BGG guild, and a micro-podcast. Reader demand
   is *not* the constraint — couples/date-night content is the highest-traffic
   asset of every outlet that publishes it — the intermediary is.
   [Study 08](research/08-couples-app-category.md) closes the other route: the App
   Store's couples shelf is occupied by incumbents with 200,000+ ratings, so the
   couples framing cannot carry discovery inside the store either.
5. Nobody is paying for this category, so free-at-launch costs us nothing.
   *Supported by study 01 on price (154 of 161 trackers are free upfront), which
   also adds a rule: metered free tiers are the most-resented pattern here.
   [Study 08](research/08-couples-app-category.md) replicates the pattern in a
   second, unrelated category — 353 of 353 couples apps are free upfront and
   essentially all subscription-funded — and finds retroactive paywalls and
   for-sale streak repair to be the reliably rating-destroying moves.
   [Study 02](research/02-collection-and-play-logging.md) supplies the positive
   form: a single honest upfront price in the $1–$6 band is accepted (BG Stats
   sustains $5.99 at 4.87 across 452 ratings); what generates low-star reviews is
   paying **twice**. One wrinkle against "costs us nothing": the only media layer
   that habitually reviews couples apps monetises through affiliate links, so a
   free app with no affiliate programme gives it no reason to write (study 05).*

## Constraints

- Solo developer plus an AI collaborator; every extra surface has a real
  maintenance cost.
- Apple Developer Program enrollment already active. Enrollment *type*
  determines the App Store seller name — see decision 0004.
- The app is local-only (SwiftData). No accounts, no server, no privacy policy
  burden beyond the basics — a deliberate position that sync would change.
- Brand is **Joshua Jumbles**, spanning this and other work.

## Open questions

| Question | Blocks | Owner |
|---|---|---|
| What does v1 include and exclude? | Phase 2 onward | Research → Joshua |
| Sole proprietorship or LLC, and which Apple enrollment type? | Listing, payments | Joshua |
| Free, paid, or IAP at launch? | Listing, agreements | Research → Joshua |
| Which analytics, and at what privacy-label cost? | Phase 3 | Engineering |
| Status of the dormant "Jelly Bean Sciences" registration | Entity decision | Joshua |
| Are we permitted to use BoardGameGeek's XML API at all? | Any game-metadata feature | Joshua — manual, Cloudflare blocks agents |
| Do the couples/two-player communities on BGG allow self-promotion? | Launch outreach | Joshua — manual, same wall |

### Answered by Phase 1 research

- **Is "Winning Couple" available and searchable on the App Store?** Available,
  yes — [study 07](research/07-name-availability.md) found no App Store, domain
  or obvious trademark collision, and `winningcouple.com`, `winningcouple.app`
  and `winningcoupleapp.com` were all unregistered as of 2026-09-29. Searchable,
  no — [study 08](research/08-couples-app-category.md) shows the name does no
  discovery work: no tracker query is improved by adding "couple", and searching
  the name itself returns only relationship apps. Keep it as a wordmark, position
  on game night, and list in Games or Entertainment rather than Lifestyle (193 of
  353 couples apps are Lifestyle; trackers are not).
- **Is there sponsorship or partnership precedent in this niche?** None found.
  [Study 06](research/06-sponsorship-precedent.md) found no tabletop utility app
  buying board game media, and Apple removed apps and in-app purchases from its
  affiliate programme on 2018-10-01, which took away the mechanism that funded
  the older precedent. [Study 05](research/05-channels-and-creators.md) reached
  the same answer from the creator side: no rates disclosed, and no sponsored
  score-tracker placement observed anywhere.

## Links

- App repo: this repository — `WinningCouple/`, `WinningCoupleTests/`
- Design: Figma file "Winning Couple" (Joshua Jumbles team drafts)
- Tracking: [Issues](https://github.com/JoshuaJumbles/winning-couple/issues) · [Project board](https://github.com/users/JoshuaJumbles/projects/1)
- Decisions: [`decisions/`](decisions/) · Research: [`research/`](research/)
