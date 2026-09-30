# 0002 — Plan in GitHub Issues, reasoning in repo docs

- **Status:** Accepted
- **Date:** 2026-09-25

## Context

The venture spans enough domains that keeping the big picture and the zoomed-in
detail straight needs a structure, not memory. Two distinct needs:

- **Execution state** — what's next, what's in flight, what's blocked.
- **Reasoning** — why decisions were made, what research found.

Options considered: GitHub Issues + Projects; Linear; Notion; documents in
Google Drive; a wiki.

## Decision

Two layers, both in this repository:

1. **Execution — GitHub Issues**, with workstream labels and phase milestones.
2. **Reasoning — markdown in `docs/venture/`**, with numbered decision records
   and research findings.

Rejected, with reasons:

- **Linear** — better board and cycle tracking, but private (invisible to
  anyone reviewing the portfolio), disconnected from PRs, and dependent on a
  connector staying authorised for the AI collaborator to keep it current.
- **Notion** — good wiki, but would duplicate the markdown layer we want
  version-controlled and diffable.
- **Google Drive** — prose without diffs; decision history becomes unreadable.

## Consequences

- `Closes #N` in a PR links decision → ticket → commit → merge with no extra
  discipline required.
- The reasoning trail is public in the repo, which serves the portfolio goal
  directly.
- We lose cycles, velocity, and a nicer board. Accepted for now.
- **Revisit trigger:** more than ~40 open issues, or a real need for cycle
  tracking. Issues export cleanly; the docs layer would not move.
