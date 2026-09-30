# Roadmap

Status of the whole venture in one page. Phases are sequential; workstreams run
across them. Live task state is in
[Issues](https://github.com/JoshuaJumbles/winning-couple/issues) — this page is
the zoomed-out view.

**Now:** Phase 1 — research, to inform the v1 scope cut.

## Phases

### Phase 1 — Orient (current)
Understand the space before cutting scope.

- Competitor teardowns: dedicated two-player/couples trackers, general
  board-game score apps, and BGG-adjacent tools
- Hands-on trials of the closest 2–3 apps, played for real with a partner
- Community research: how people track two-player scores today (BoardGameGeek
  forums, Reddit)
- Channel scan: creators and communities covering two-player / couples gaming;
  any precedent for app sponsorship or partnership in that cohort
- **Exit:** enough evidence to write the v1 scope cut with reasons

### Phase 2 — Define
- v1 scope cut: what ships, what waits, what we deliberately won't do
- Positioning and name check (App Store name availability, search collisions)
- Entity and enrollment decision, since it gates the store listing
- **Exit:** a scope we can build against and a listing identity we can register

### Phase 3 — Build to beta
- Close the gap between today's app and the v1 scope
- CI: build + test on every PR
- Analytics approach decided and instrumented
- App icon, App Store screenshots, listing copy, privacy labels
- **Exit:** a build worth putting in front of real couples

### Phase 4 — Beta
- TestFlight with family couples (built-in screenshot feedback, no custom UI)
- Feedback triage → scope adjustments
- **Exit:** no blocking feedback; crash-free across a play session

### Phase 5 — Launch and operate
- App Store submission and release
- Landing page; outreach to channels identified in Phase 1
- Dashboard: App Store Connect metrics, in-app funnel, crash reports
- Case study assembled from `decisions/` and `research/`

## Workstreams

| Workstream | Covers | Notes |
|---|---|---|
| Product | Scope, prioritisation, UX decisions | Figma file is the design source |
| Engineering | App, CI, testing, release mechanics | Established PR workflow |
| Research | Competitors, community, channels | Phase 1 heavy, then periodic |
| Marketing | Positioning, landing page, outreach, ASO | Lightweight; exercise the full spectrum |
| Legal / Admin | Entity, agreements, privacy policy, tax | Gates listing, not code |
| Operations | Analytics, crash reporting, support, cadence | |
| Case study | Decision capture, final write-up | Continuous, assembled at the end |

## Deliberately out of scope for now

- Partner sync / multi-device (shapes the data layer; revisit after v1)
- Monetisation mechanics (assume free at launch until research says otherwise)
- Android or iPad-specific layouts
