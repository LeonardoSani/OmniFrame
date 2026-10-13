# 4_Results

What came back, what it means, and what to run next.

## The rule that matters most here

**Never invent a number.** Every metric in `Results.md` traces to a file in `Runs/`. If
a run record does not exist, the number does not exist — say so and stop. This is the
area where a plausible-looking fabrication does the most damage, because everything
downstream treats it as evidence.

Equally: **never edit a result to agree with the method.** A refuted hypothesis is a
finding. Record it as one.

## Shapes

**`Runs/<E-id>-<YYYY-MM-DD>.md`** — one record per run, append-only. Frontmatter carries
`expid`, `date`, `seed`, `commit` and `status`; the body carries a metrics table and the
paths to artifacts. Two runs of the same experiment on the same day get a `-b` suffix
rather than overwriting. A record is never edited to look better; a run that went wrong
is recorded as having gone wrong.

**`Results.md`** — the analysis. Organised by hypothesis, not by run: for each one, what
the evidence says, which runs support it, and what remains unresolved. Cite run records
by filename.

**`Scenario_Tree.md`** — one mermaid DAG, the dependency structure between experiments,
plus a `## Runnable now` list. See the file's own notes for the three edge kinds.

## Updating the DAG

When an outcome lands, both files move in the same sitting: the run record is written,
`Results.md` absorbs it, and `## Runnable now` is recomputed. A dependency counts as
satisfied only on the evidence of a run record — never on an expectation of how an
experiment will turn out.

If an outcome makes a planned experiment pointless, do not delete its node. Mark it
dropped and leave the reason visible: the fact that it became unnecessary is itself a
result.
