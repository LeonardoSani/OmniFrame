# 3_Implementation

The bridge from the formal idea to something runnable. **Nothing here is a claim.**

Every file in this area answers "which one, at what size, written where" for something
`2_Idea/` stated abstractly. The boundary, in both directions:

> If it could have been chosen differently without changing the idea, it is a spec and
> belongs here. If it changes what is being claimed, it belongs in `2_Idea/`.

A new claim appearing in this area is a sign it was made in the wrong place. Say so
rather than leaving it here.

## Shapes

**`Specs.md`** — one `### <E-id>` block per experiment in `2_Idea/Experiments.md`: a
table of Model, Hyperparameters, Data / splits, Seeds, Compute, Metrics, then **Notes**.
Every value is a decision someone can disagree with; record *what* was chosen, and when
the reason is not obvious, one line on why. An E-id here that does not exist in
`2_Idea/Experiments.md` is an error.

**`Figures.md`** — what each figure must *show*, one `### <name> · <kind>` block each.
Not all figures are plots, and each kind has its own fields:

- **plot** — **Shows** (what the reader concludes at a glance), **Source** (which runs in
  `4_Results_and_Tracking/Runs/`), **Encoding** (x, y, series, error representation)
- **schematic** — **Shows** (the mechanism it makes clear), **Leaves out** (what is
  deliberately not drawn)
- **panel** (qualitative) — **Shows**, **Selection rule** (how examples are chosen,
  including whether failures are shown — a claim about honesty, not taste)

Every kind ends with **Where it goes**: a paper section, or "exploratory, not for the
paper".

When producing an actual data plot, load the `dataviz` skill before writing chart code.

Figures here are **not** numbered to match the paper. The paper names and labels its own
figures (see `5_Paper/CLAUDE.md`), because figures get merged, dropped and reordered
during writing, and a shared id scheme would be a second thing to keep in sync.

**`Code_Design.md`** — where the code lives and how it is split: **Repo structure**,
**Modules** (module · responsibility), **Entry points** (how an E-id reaches the code that
runs it), **Artifacts** (where checkpoints and logs go, which are gitignored; paper
figures go to `5_Paper/figures/`). The template ships no code folder on purpose: that is
this file's decision. Until it is written, do not scatter
modules. Whatever `uv init` created is the starting point, not a constraint.
