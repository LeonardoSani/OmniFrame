---
status: empty
updated: __DATE__
---

# Cards & outputs definition

The researcher owns this file. It is the only place that decides what the agent extracts
from the literature and what it writes. Edit it before asking for cards.

Two different kinds of instruction, bound differently:

- **Cards are schema-bound.** The sections below are the card, exactly, in this order.
  Change a line here and every future card changes with it.
- **Outputs are goal-bound.** Below, name the result each document must reach. The agent
  chooses its shape. It writes nothing that is not commissioned here.

## Cards

The common points to focus on for every paper. Rewrite these for this project — the
starter set is a guess, not a recommendation.

- **Problem** — what the paper is trying to solve, in its own terms
- **Method** — the mechanism, in two or three sentences
- **Benchmarks used** — datasets, tasks, metrics
- **Claimed results** — what they report, with the numbers they state
- **Limitations** — stated by the authors, and visible but unstated
- **Relevance to us** — why this paper is in this project's library at all

## Outputs

One line per commissioned document: what it must achieve. Delete the examples.

- *example* — **The gap**: what the field cannot currently do, argued from the cards,
  ending in the one sentence `2 Idea/Setup & Method.md` has to formalise.
- *example* — **Rival approaches**: the families of method that attack this problem, how
  they differ in assumption rather than in architecture, and where ours would sit.

## Notes to the agent

Anything specific to this project's reading: a paper to treat as the baseline, a term
used inconsistently across the field, a benchmark to always report.
