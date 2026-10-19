# 2_Idea

The idea, from plain words to formal: what the project is after, then the problem, the
notation, the method, the hypotheses, and what each experiment establishes. Three files —
`High_level.md` comes first; the other two are the formal layer, written and rewritten
together. Beside them, `Human_encoding/` holds the researcher's handwritten notes.

**These are the researcher's claims. Do not write here unless asked.** When you are
asked, you are editing someone's formalisation — match what is there, do not restructure
it, and do not soften a claim into a hedge.

## House style

This is the thinking itself, so the prose is held to a standard. Clean, direct,
notation-driven.

- **Every sentence defines something or claims something.** No motivation padding, no
  retelling the literature, no restating the previous paragraph.
- **Notation-driven.** Define a symbol once and then use it. If a sentence can be an
  equation, make it one — prefer a display equation to a paragraph describing an
  equation. Reuse the symbols already in `## Notation`; never introduce a second symbol
  for something already named.
- **Direct.** Short active sentences. Cut "in order to", "it is worth noting that", "we
  believe that", "due to the fact that". One clause per idea.
- **Formal but general.** The method is an abstraction: an objective, its constraints,
  the mapping, and the assumptions it needs to hold.

Clean means a reader can find a definition in five seconds. Not that the file is short.

## The boundary that keeps this area general

> If it could have been chosen differently without changing the idea, it is a spec, not
> the idea — it belongs in `3_Implementation/Specs.md`.

So nothing here names a layer count, a width, a hidden dimension, a learning rate, an
optimiser, a batch size, a dataset-and-split, hardware, a library, or a seed. This area
says *there is an encoder with these properties*; Implementation says *which one, at what
size*. `Experiments.md` says what an experiment establishes; `Specs.md` says how it runs.

If you find a concrete choice in here, say so — it leaked from the wrong area.

## Handwritten notes

`Human_encoding/` — the researcher's own handwritten notes on the idea, scanned. Scans sit
in the folder; `Human_encoding/Human_encoding.md` is their hub, organised as the
researcher likes, linking note files in `Human_encoding/Notes/<name>.md` that embed the
scans as `![](../scan.pdf)`.

Read a note only when the researcher points you to it, and only for the task they named.
Asked, you may create a note `.md` or add embed lines for scans they name. Never cite a
note as a source: what it says becomes a claim only once the researcher writes it into
one of the three files.

## Shapes

**`High_level.md`** — the one file here **outside the house style above**: plain words,
and intuition is allowed.

- **Topic** — one line: the field, and the problem inside it.
- **The idea** — a paragraph: what the researcher suspects, wants to try, or wants to
  understand.
- **In scope, out of scope** — what the literature should cover, and what looks close but
  is not this project.
- **Anchor papers** — papers already known to be central. Optional; their references and
  citations are often the best leads.
- **Keywords** — the field's terms for this, synonyms included.

It is the seed `/lit-search` reads to propose papers — a vague keyword list here
becomes a vague reading list. When it is empty and the researcher wants
help, draft it *with* them: ask, propose, and write only what they confirm.

**`Setup_and_Method.md`** — suggested headings: Problem · Notation · Method · Hypotheses ·
Anticipated experiments. They are a prompt, not a schema: rename them, add to them, drop
one that does not fit the project.

- **Problem** — the gap, formally: what is given, what is wanted, what makes it hard.
- **Notation** — the single source of truth for symbols. `5_Paper/preamble.tex` mirrors it.
- **Method** — the objective, its constraints, the mapping, its assumptions.
- **Hypotheses** — each falsifiable, numbered `H1`, `H2`…, naming the E-ids that test it.
- **Anticipated experiments** — three or four lines; the detail lives in `Experiments.md`.

**`Experiments.md`** — one `### E01 — <name>` block per experiment: **Establishes** (which
hypothesis, and how), **Why worth doing**, **Design** (what varies, what is held fixed),
**Expected outcome**, **Would refute** (if nothing could, it is not an experiment). The
E-id is assigned here, once, and is the key every other area uses. Never renumber an
existing experiment: its id is already in `Specs.md`, in `Runs/` filenames and in the
DAG. Append a new id instead, and if an experiment is abandoned, mark it rather than
removing the block.
