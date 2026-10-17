# Results and tracking

- [Where we are](Where_we_are.md) — the briefing. Read it first; `/wrap` rewrites it.
- [Scenario tree](Scenario_Tree.md) — the experiment DAG, and what is runnable now
- [The analysis](Results.md) — what the experiments showed, by hypothesis
- `Runs/<E-id>-<date>.md` — one record per run. Append-only, and the only source of a metric.

`Results.md` and `Where_we_are.md` are not the same thing. The analysis is the standing
record of what each experiment showed, organised by hypothesis and kept as the evidence
accumulates. The briefing is the present moment: where the work is, why the plan looks
like this, what is next. A finding belongs in the analysis; the state of play belongs in
the briefing.

## Upstream

- E-ids come from [Experiments](../2_Idea/Experiments.md); their configuration is in
  [Specs](../3_Implementation/Specs.md).
- Hypotheses being tested are in [Setup & Method](../2_Idea/Setup_and_Method.md).
