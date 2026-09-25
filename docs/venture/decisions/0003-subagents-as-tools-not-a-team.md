# 0003 — Subagents are a tool for bounded work, not a standing team

- **Status:** Accepted
- **Date:** 2026-09-25

## Context

A common pattern is to assign AI agents persistent roles — "Head of Product",
"Head of Marketing" — to mirror a company org chart. The venture does span
enough domains to make that tempting.

## Decision

No standing agent team. Spawn subagents for specific, bounded, parallelisable
tasks — then let them finish.

Good fits:

- **Parallel research.** Several competitor teardowns or community sweeps at
  once, each with a written brief and a file in `research/`.
- **Fresh-context review.** An agent that has not absorbed our assumptions
  reviewing a decision or a diff.

Poor fits:

- Iterative, conversational work (product shaping, design back-and-forth).
- Anything where the context needed exceeds what a brief can carry.
- Device/build verification — a `xcodebuild` destination matrix does this
  deterministically and cheaply.

## Consequences

- Agents start cold, so **written context is the enabling condition**, not the
  roster. This is the main reason `docs/venture/` exists.
- Every spawned agent needs a brief specifying its question, sources, and
  output file. Research briefs use the format in `research/README.md`.
- If a "team" ever seems necessary, that is a signal the written context is too
  thin, and the fix is the documents rather than the org chart.
