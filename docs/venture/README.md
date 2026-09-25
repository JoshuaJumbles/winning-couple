# Winning Couple — venture docs

Winning Couple is an iOS score tracker for two-player board games, built by
**Joshua Jumbles**. This folder is the reasoning layer behind it: why the
product is what it is, what we learned, and what we decided.

It exists because the goal is not only a shipped app. It is a complete,
independently run product — research, scope, build, beta, launch, and the
operations around it — with the decision trail preserved as it happens rather
than reconstructed afterward.

## How this is organised

| Where | What belongs there |
|---|---|
| `roadmap.md` | Phases, workstreams, and what we're working on now |
| `context-map.md` | Living index: what we know, what's assumed, what's still open |
| `decisions/` | One numbered file per decision that would be expensive to revisit |
| `research/` | Findings, one file per study, in a shared brief format |

Execution state — what's next, what's in flight — lives in
[GitHub Issues](https://github.com/JoshuaJumbles/winning-couple/issues), not
here. Issues carry status; these docs carry reasoning. A ticket says *"pick an
analytics approach"*; a decision record says *why* we picked it and what we
traded away.

## Working rules

1. **Decisions get written down when made**, not in a later cleanup pass. A
   decision record takes five minutes; reconstructing intent takes an hour and
   is usually wrong.
2. **Research outputs go in `research/`, not in chat.** Anything worth acting
   on is worth a file that a future session (or a parallel agent) can read
   cold.
3. **Link tickets to reasoning.** Issues reference decision records; PRs
   reference issues. The trail should survive both of us forgetting.
4. **Keep it proportional.** Two-person team. These docs serve momentum, not
   process. If a document isn't being read or updated, delete it.

## Case study

The portfolio write-up is assembled *from* this folder at the end, not written
separately. The decision records and research findings are its raw material,
which is the main reason they're written as they happen.
