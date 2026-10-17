# 4_Results_and_Tracking

What came back, what it means, and where the work stands.

## The rule that matters most here

**Never invent a number.** Every metric in `Results.md` traces to a file in `Runs/`. If
a run record does not exist, the number does not exist — say so and stop. This is the
area where a plausible-looking fabrication does the most damage, because everything
downstream treats it as evidence.

Equally: **never edit a result to agree with the method.** A refuted hypothesis is a
finding. Record it as one.

## `Where_we_are.md` — the briefing

Read it as the **first action of a session**. `/wrap` rewrites it at the end of one.

It exists to orient, and nothing more. It is read before anything else every session, so
its length is a cost paid every time: **keep it under twenty lines.** Past that it has
stopped being a briefing.

Three sections:

- **Now** — what is established, what is running. Cite rather than restate: write
  "E01 ran, 0.794 (`Runs/E01-2026-10-11.md`)", not the table. The reader follows the link
  only if they need the detail.
- **Next** — the one to three moves that would actually happen if work resumed now. Not a
  backlog. If something is blocked, name what blocks it.
- **Open** — what is undecided, and what would decide it. A question with no route to an
  answer belongs here too; say that it has none.

**Rewrite it, never append.** Git holds the history; this file describes only the present.

**Do not put reasoning here.** Every kind of "why" already has a home, and duplicating it
means two copies that drift:

- why an experiment is worth doing → `2_Idea/Experiments.md`, under *Why worth doing*
- why a concrete choice was made → `3_Implementation/Specs.md`, under *Notes*
- what an experiment showed → `Results.md`

`Results.md` and this file are not the same thing. The analysis is the standing record of
what each experiment showed against what was expected, organised by hypothesis, and it
grows. The briefing is the present moment, and it stays short.

## Shapes

**`Runs/<E-id>-<YYYY-MM-DD>.md`** — one record per run, append-only. Frontmatter carries
`expid`, `date`, `seed` and `commit` — no `status`: a record is written once,
complete, and whether it matched expectation is judged in `Results.md`. The body carries a
metrics table and the paths to artifacts. Two runs of the same experiment on the same day get a `-b` suffix
rather than overwriting. A record is never edited to look better; a run that went wrong
is recorded as having gone wrong.

**`Results.md`** — the analysis. Organised by hypothesis, not by run: one `## H<n> — <claim>`
block each, with **Evidence** (which runs, and what they show — cite run records by
filename), **Verdict** (supported · refuted · inconclusive) and **Open** (what is
unresolved, and what would resolve it). `## Cross-cutting observations` holds what the
experiments showed that no hypothesis predicted.

**`Scenario_Tree.md`** — one mermaid DAG (`flowchart LR`) of the dependencies between
experiments, then `## Runnable now` and `## Blocked`. Node ids are the E-ids, verbatim, so
one grep finds an experiment's dependencies and dependents. Three relations, drawn
differently — the distinction is the point of the file:

- **parallel** — a node with no incoming edge. Several roots run at the same time.
- **unconditional** — a plain edge, `E02 --> E03`: E03 needs E02 *finished*, whatever
  the outcome (a checkpoint, an artifact).
- **outcome-conditional** — a labelled edge carrying the condition,
  `E02 -->|"metric ≥ threshold"| E04`. Diverging labelled edges are a branch point: only
  one side will happen.

Only a labelled edge can make an experiment never happen. Conflating the two either
serialises work that could run in parallel, or runs an experiment whose premise was
already refuted. `## Runnable now` lists each experiment whose dependencies are
satisfied; `## Blocked` lists the rest, each with what it waits on.

## Updating the DAG

When an outcome lands, both files move in the same sitting: the run record is written,
`Results.md` absorbs it, and `## Runnable now` is recomputed. A dependency counts as
satisfied only on the evidence of a run record — never on an expectation of how an
experiment will turn out.

If an outcome makes a planned experiment pointless, do not delete its node. Mark it
dropped and leave the reason visible: the fact that it became unnecessary is itself a
result.
