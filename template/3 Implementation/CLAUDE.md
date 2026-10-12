# 3 Implementation

The bridge from the formal idea to something runnable. **Nothing here is a claim.**

Every file in this area answers "which one, at what size, written where" for something
`2 Idea/` stated abstractly. The boundary, in both directions:

> If it could have been chosen differently without changing the idea, it is a spec and
> belongs here. If it changes what is being claimed, it belongs in `2 Idea/`.

A new claim appearing in this area is a sign it was made in the wrong place. Say so
rather than leaving it here.

## Shapes

**`Specs.md`** — one block per E-id, mirroring the experiments in
`2 Idea/Experiments.md`. Architecture, hyperparameters, data and splits, seeds, compute.
Every value is a decision someone can disagree with; record *what* was chosen, and when
the reason is not obvious, one line on why. An E-id here that does not exist in
`2 Idea/Experiments.md` is an error.

**`Figures.md`** — what each figure must *show*. Not all figures are plots:

- a **plot** also carries a data-encoding spec: source runs, x, y, series, and what the
  reader should be able to conclude at a glance
- a **schematic** carries a description of the mechanism it has to make clear, and what
  it may safely leave out
- a **qualitative panel** carries the selection rule for its examples — including whether
  failure cases are shown, which is a claim about honesty, not taste

When producing an actual data plot, load the `dataviz` skill before writing chart code.

Figures here are **not** numbered to match the paper. The paper names and labels its own
figures (see `5 Paper/CLAUDE.md`), because figures get merged, dropped and reordered
during writing, and a shared id scheme would be a second thing to keep in sync.

**`Code Design.md`** — where the code lives and how it is split. The template ships no
code folder on purpose: that is this file's decision. Until it is written, do not scatter
modules. Whatever `uv init` created is the starting point, not a constraint.
