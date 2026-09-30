# Research

Findings live here, one file per study, named `NN-short-topic.md`. Every study
— whether run by Joshua, by me, or by a parallel agent — produces a file in the
format below, so results are comparable and readable cold.

## Why the format matters

Research is the main place we use parallel subagents (decision 0003). An agent
starts with no context beyond its brief, so the brief and the output shape have
to carry everything. A consistent format also makes the Phase 2 scope cut a
reading exercise rather than a synthesis exercise.

## Brief (given to whoever runs the study)

```
Question:     the one thing this study answers
Sources:      where to look, and what is out of bounds
Output:       docs/venture/research/NN-topic.md, in the format below
Time budget:  rough effort ceiling
Not in scope: what to deliberately ignore
```

## Output format

```markdown
# NN — Topic

- Date:
- Run by:            Joshua / Claude / subagent
- Question:
- Confidence:        high / medium / low, and why

## Summary
Three to five sentences. What someone gets if they read nothing else.

## Findings
The evidence. Cite specifics — app names, versions, prices, URLs, quotes,
dates. Distinguish what was observed from what was inferred.

## Implications for Winning Couple
What this changes about scope, positioning, or priorities. Say "nothing" if
that's the honest answer.

## Open threads
What this raised and did not settle.
```

## Standing rules

1. **Separate observation from inference.** "Six of eight trackers require
   account creation" is an observation; "people resent sign-ups" is inference.
2. **Cite enough to re-check.** A claim nobody can verify later is not usable
   in a case study.
3. **Negative results count.** "No sponsorship precedent found in this niche,
   here's where I looked" is a finding and should be written up.
4. **Do not soften the conclusion.** If research says the premise is wrong,
   that is the most valuable possible outcome and it goes in the summary.
5. **Update the index** at the bottom of this file as part of the study.
6. **Save the underlying data** next to the write-up when a study sweeps or
   scrapes anything (`NN-topic-data.json` or similar), so counts can be re-run
   instead of trusted. Study 01's 161-app sweep is not reproducible for want of
   this.

## Verification

Every study gets a sample of its citations checked independently before it is
merged — app metadata against Apple's public search API, quotes against the
public review feed, links opened, YouTube figures re-parsed from the channel
pages' own `ytInitialData`. Research agents produce fluent, plausible detail;
this step is what separates that from evidence, and it takes minutes. Each
study's spot checks are recorded in its PR.

Two cautions learned by doing it:

- **Apple's legacy customer-reviews RSS feed is unreliable.** On 2026-09-30 it
  returned HTTP 200 with zero entries for every app tried, including controls
  with six-figure rating counts. When it comes back empty, review quotes cannot
  be re-checked — say so, rather than recording them as verified.
- **Search rankings are volatile.** App Store search order moves day to day and
  varies with query parameters. Verify the *direction* of a search finding, not
  the exact ranks, and note in the study when a rank failed to reproduce.

## Index

| # | Topic | Status |
|---|---|---|
| [01](01-competitors-two-player.md) | Competitors: two-player and couples score tracking | Done — amended assumption 1 |
| [02](02-collection-and-play-logging.md) | Collection managers and play loggers | Done — BGG's API is now gated; the differentiator is the absent roster, not the win chart |
| [05](05-channels-and-creators.md) | Channels and creators reaching two-player / couples gamers | Done — amended assumption 4 |
| [06](06-sponsorship-precedent.md) | Sponsorship and partnership precedent in the niche | Done — no precedent found, and Apple removed the mechanism in 2018 |
| [07](07-name-availability.md) | App Store name availability and search collisions | Done — "Winning Couple" is uncontested everywhere checked |
| [08](08-couples-app-category.md) | The couples app category, and whether our name belongs there | Done — keep the name, position on game night |
