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

Each of these is a research target in Phase 1. They are currently beliefs, not
findings.

1. Existing trackers are built for groups, and two-player couples are
   underserved by them.
2. People who would use this are currently tracking scores on paper or in
   a notes app.
3. Personalisation (colours, emoji avatars) matters more for a couple than
   detailed statistics do.
4. There is a reachable audience: creators and communities focused on
   two-player and couples gaming.
5. Nobody is paying for this category, so free-at-launch costs us nothing.

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
| Is "Winning Couple" available and searchable on the App Store? | Listing | Research |
| Sole proprietorship or LLC, and which Apple enrollment type? | Listing, payments | Joshua |
| Free, paid, or IAP at launch? | Listing, agreements | Research → Joshua |
| Which analytics, and at what privacy-label cost? | Phase 3 | Engineering |
| Is there sponsorship or partnership precedent in this niche? | Marketing | Research |
| Status of the dormant "Jelly Bean Sciences" registration | Entity decision | Joshua |

## Links

- App repo: this repository — `WinningCouple/`, `WinningCoupleTests/`
- Design: Figma file "Winning Couple" (Joshua Jumbles team drafts)
- Tracking: [Issues](https://github.com/JoshuaJumbles/winning-couple/issues)
- Decisions: [`decisions/`](decisions/) · Research: [`research/`](research/)
