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

Read it as the **first action of a session**; rewrite it **before the session ends**.

Every other file in the brain holds state — what exists, what ran, what the numbers
were. This one holds **intent**, and nothing else records it: why the plan looks the way
it does, and what you were about to do when you stopped. That is what a two-week gap
destroys and what no amount of reading the files reconstructs.

Four sections, each short enough to take in at a glance:

- **Now** — what is established, what is still open, what is running. Claims cite their
  evidence: a run record, a card, a section. Before there is a result, say so plainly
  rather than describing what you expect to find.
- **Why the plan looks like this** — the *why* behind the schematics. Why
  `Scenario_Tree.md` branches where it does, why a threshold is the number it is, why an
  experiment is sequenced after another rather than beside it, why one was dropped.
  Without this the DAG is a diagram nobody can argue with. The test for a line belonging
  here: it would be *wrong* in `2_Idea/`, because it is a decision, not a claim — "0.3,
  because the pilot at 0.2 was indistinguishable from noise."
- **Next** — the one to three moves that would actually happen if work resumed now. Not
  a backlog.
- **Open** — what is undecided, and what would decide it. A question with no route to an
  answer belongs here too; say that it has none.

**Rewrite it, never append.** Git holds the history, so a log here would only be a second
chronology to maintain. It describes the present only.

Draft it from what actually happened in the session and let the researcher correct it. If
nothing changed, say so and leave it alone.

Do not restate the method here. If a line would sit comfortably in `2_Idea/`, it belongs
there instead.

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
