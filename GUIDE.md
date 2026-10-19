# OmniFrame Guide

How to use OmniFrame as designed, from an empty folder to a paper. To install it, see the
[README](README.md).

1. [The whole pipeline](#the-whole-pipeline)
2. [Commands at a glance](#commands-at-a-glance)
3. [Set up a project](#1-set-up-a-project)
4. [The session loop](#2-the-session-loop)
5. [Write the idea](#3-write-the-idea)
6. [Literature](#4-literature)
7. [Formalise the method](#5-formalise-the-method)
8. [Plan the experiments](#6-plan-the-experiments)
9. [Run and track](#7-run-and-track)
10. [Write the paper](#8-write-the-paper)
11. [Publish the code](#9-publish-the-code)
12. [Reference](#10-reference)
13. [Update and edit OmniFrame](#11-update-and-edit-omniframe)

---

## The whole pipeline

```mermaid
flowchart TD
  classDef shell fill:#e5e7eb,stroke:#374151,color:#111
  classDef claude fill:#fde2cf,stroke:#c2410c,color:#111
  classDef chat fill:#dbeafe,stroke:#1d4ed8,color:#111
  classDef you fill:#fef3c7,stroke:#a16207,color:#111

  init["omniframe init MYPROJ"]:::shell
  hl["2_Idea/High_level.md"]:::you
  se["/lit-search"]:::claude
  dec{"Decision"}:::you
  dl["/lit-download"]:::claude
  cv["/lit-convert"]:::claude
  ca["/lit-cards"]:::claude
  ou["/lit-outputs"]:::claude
  me["2_Idea/Setup_and_Method.md"]:::chat
  ex["2_Idea/Experiments.md"]:::chat
  spec["3_Implementation/Specs.md"]:::chat
  tree["Scenario_Tree.md"]:::chat
  run["uv run in MYPROJ/"]:::shell
  rec["Runs/E-id-date.md"]:::chat
  res["Results.md"]:::chat
  paper["5_Paper/"]:::chat

  init --> hl --> se --> dec --> dl --> cv --> ca --> ou --> me --> ex
  ex --> spec
  ex --> tree
  spec --> tree
  tree --> run --> rec --> res --> paper
```

`Scenario_Tree.md` is the experiment DAG: built from the experiments in `2_Idea/` and their
specs in `3_Implementation/`, it says which experiment you can run today.

| colour | where you type it |
| --- | --- |
| grey | the terminal |
| orange | a slash command in Claude Code |
| blue | Claude Code, asked in plain words |
| yellow | you: an edit or a decision |

At the end of every session, whatever you did: `/wrap`.

## Commands at a glance

Two kinds of command, typed in two different places.

**In Claude Code** — typed into the chat, inside the project. They start with `/`. This is
where the work happens.

| Command | Does |
| ------- | ---- |
| `/lit-search ["bias"]` | proposes papers from `2_Idea/High_level.md` |
| `/lit-download` | fetches the papers marked `OK`: PDF, BibTeX, index row |
| `/lit-convert` | turns PDFs into markdown; brings in PDFs you added by hand |
| `/lit-cards [citekeys]` | writes a card per paper, and files it in its group |
| `/lit-outputs [name]` | writes the syntheses in your brief |
| `/wrap` | ends the session: rewrites the briefing, checks the brain |

Everything else — the idea, specs, run records, results, the paper — you ask for in plain
words in the chat.

**In the terminal** — a shell, outside Claude. For setting up, and for the code.

| Command | Does |
| ------- | ---- |
| `omniframe link` | puts `omniframe` on your PATH. Once per machine |
| `omniframe init MYPROJ` | creates `MYPROJ_Brain/` and its code folder |
| `omniframe update` | brings a project's commands and rules up to date |
| `uv add …` / `uv run …` | inside `MYPROJ/`, for your code |

`omniframe download` and `omniframe convert` also exist: they are the scripts that
`/lit-download` and `/lit-convert` run. You never need to call them yourself — except
`omniframe convert --use-llm`, for a paper whose formulas need cleaning
([§4](#4-literature)).

---

## 1. Set up a project

**In the terminal:**

```sh
cd ~/Projects
omniframe init MYPROJ
```

```
MYPROJ_Brain/          the brain: one git repo, your Obsidian vault
├── 0-Master.md  CLAUDE.md  README.md  1_Literature/ … 5_Paper/
└── MYPROJ/            the code only: the future public repo (uv project, MIT)
```

| flag | |
| --- | --- |
| `--dry-run` | print the plan, write nothing |
| `--force` | overwrite existing files |
| `--name "Title"` | project name, if nicer than `MYPROJ` |
| `--author NAME` | defaults to `git config user.name`. Also goes in `LICENSE` |

Open `MYPROJ_Brain/` in Obsidian and Claude Code. Start from `0-Master.md`.

**The code folder** is exported alone later ([§9](#9-publish-the-code)), so it stands alone:

| | |
| --- | --- |
| environment | `MYPROJ/.venv/`. Run `uv add` / `uv run` inside `MYPROJ/` |
| artifacts | `data/`, `outputs/` inside it, gitignored |
| paths | never outside `MYPROJ/` |
| `README.md`, `.gitignore` | the public repo's. The brain has its own |

**Every file you fill starts as a blank form**: headings, table headers and field labels,
with no instructions inside. This guide says what goes under each heading. The agent's
rules live in the `CLAUDE.md` files, never in your content.

## 2. The session loop

1. **Start.** The agent reads `4_Results_and_Tracking/Where_we_are.md`, the **briefing**:
   **Now**, **Next**, **Open**, under twenty lines.
2. **Work.**
3. **End.** Run `/wrap` in Claude Code. It rewrites the briefing and runs a quick consistency check. It
   reports problems and fixes nothing.

The briefing is rewritten each time, never appended to. Git keeps the history.

**Status.** Every file someone writes (the idea, specs, results, cards…) has a `status`:

| status | means | set by |
| --- | --- | --- |
| `empty` | the form is untouched | the template |
| `filled` | it has content | whoever writes in it first |

`grep -rn "status: empty"` lists what is left to write. If you fill a file by hand, change
its label yourself, or `/wrap` will spot it and ask. Lists kept by scripts (the paper
index, the proposals), run records and navigation pages have no status.

## 3. Write the idea

`2_Idea/High_level.md` seeds everything after it. Write in plain words:

| section | what goes in |
| --- | --- |
| Topic | one line: the field, and the problem inside it |
| Idea & Motivation | a paragraph: what you suspect, want to try or want to understand, and why |
| Anchor papers | papers you already know are central (optional) |
| Keywords | the field's terms, synonyms included |

A vague keyword list gives you a vague reading list. If the file is empty, ask the agent to
draft it with you. It asks questions and writes only what you confirm.

## 4. Literature

One pipeline, one command per step. **All in Claude Code:**

```mermaid
flowchart TD
  classDef claude fill:#fde2cf,stroke:#c2410c,color:#111
  classDef you fill:#fef3c7,stroke:#a16207,color:#111
  classDef note fill:#f3f4f6,stroke:#9ca3af,color:#111

  se["<b>1 · /lit-search #quot;bias#quot;</b><br/>~10 proposals from High_level.md"]:::claude
  dec{"you mark<br/>Decision"}:::you
  dl["<b>2 · /lit-download</b><br/>PDF · BibTeX · row under ## Unsorted"]:::claude
  cv["<b>3 · /lit-convert</b><br/>markdown, linked in the index"]:::claude
  ca["<b>4 · /lit-cards</b><br/>a card per paper; the row moves to its group"]:::claude
  ou["<b>5 · /lit-outputs</b><br/>the syntheses in your brief"]:::claude
  later["kept in ## Later<br/>mark OK there any time"]:::note
  no["never proposed again"]:::note

  se --> dec
  se -. "another bias" .-> se
  dec -->|OK| dl --> cv --> ca --> ou
  dec -->|LATER| later
  dec -->|NO| no
```

The library is `1_Literature/Paper_Index.md`. Every paper has one row, linking its
**arXiv**, **code** and **site** (when they exist), the **pdf** (for you), the **md** (for
the agent) and the **card**. Rows sit under groups you choose; **`## Unsorted`** holds the
papers downloaded but not yet carded — download puts every new paper there, and
`/lit-cards` moves it to its group.

### Step 1 — propose

```
/lit-search                                          from High_level.md alone
/lit-search "theory only, after 2020, no surveys"    steered by a bias
```

The agent adds about ten proposals to `1_Literature/Proposed_literature.md`, each with its
venue, why it fits and its links. Each paper is one the agent found and opened online,
never one recalled from memory.

| Link | holds |
| ---- | ----- |
| **arXiv** | the arXiv page, or the paper's own page if it is not on arXiv. Always there |
| **Code** | the official GitHub repo. Blank if none |
| **Site** | the official project page. Blank if none |

The optional **bias** steers this one search. It narrows `High_level.md` and is not saved.
If it would exclude a foundational paper (for example, "after 2020" would drop the 2017
paper the field rests on), the agent names that paper and asks you before searching.

**Your decision.** Fill the **Decision** column. Only you write in it; a legend above the
table repeats the marks.

| Decision | at the next download |
| ---- | ----------- |
| `OK` | downloaded into the library |
| `LATER` | moved to `## Later`, kept across searches. Mark it `OK` there at any time |
| `NO` | moved to `## Declined`, never proposed again. Delete its line to let it back in |
| blank | dropped. A later search may propose it again |

### Step 2 — download

```
/lit-download
```

For each `OK` paper:

- finds the open PDF from the arXiv link (arXiv, OpenReview, or Semantic Scholar by DOI)
  and saves it as `1_Literature/PDFs/<citekey>.pdf`, never overwriting an existing one
- adds its BibTeX to `5_Paper/refs.bib`, taken from the DOI or arXiv
- adds its row under `## Unsorted` in the index, with the paper's links

**No open PDF online?** The paper stays `OK`, with the reason in its row. Get the PDF
yourself, save it as `1_Literature/PDFs/<citekey>.pdf`, and run `/lit-download` again: it
finds the file in place and does the rest.

### Step 3 — convert

```
/lit-convert
```

Turns every new PDF into `1_Literature/Papers/<citekey>/` — the markdown plus extracted
images — with a local model (slow: minutes), and puts the markdown link into the index.
Papers already converted are skipped, so running it again is safe.

When a PDF does not arrive the normal way:

```mermaid
flowchart LR
  classDef claude fill:#fde2cf,stroke:#c2410c,color:#111
  classDef you fill:#fef3c7,stroke:#a16207,color:#111

  subgraph H["You downloaded a PDF yourself"]
    direction LR
    h1["save it in PDFs/<br/>under any name"]:::you --> h2["/lit-convert"]:::claude
    h2 --> h3(["it asks:<br/>rename to citekey?"]):::you
    h3 --> h4["download + convert<br/>like any other paper"]:::claude
  end

  subgraph M["No open PDF online"]
    direction LR
    m1["/lit-download flags it<br/>row stays OK"]:::claude --> m2["save it as<br/>PDFs/#lt;citekey#gt;.pdf"]:::you
    m2 --> m3["/lit-download"]:::claude
  end
```

**A PDF you downloaded yourself.** Save it into `1_Literature/PDFs/` under any name and run
`/lit-convert`. It identifies the paper and asks whether it may rename the file to its
citekey (`paper (1).pdf` → `lu2022dpm.pdf`). Then it puts the paper through download — for
the BibTeX and the index row — and conversion. Afterwards it is like any other paper. No
search needed.

**Formulas.** The converter outputs some equations as clean LaTeX and flattens others into
HTML. This is by design: the agent uses the markdown to understand a paper and never
copies a formula from it. When it needs a formula, it asks you, and the PDF is the
authority. For a paper whose maths matters, an external LLM can clean it up — the one
time you run the converter yourself. It costs money, unless you use a local Ollama. **In
the terminal:**

```sh
omniframe convert --force --only <citekey> --use-llm
```

### Steps 4–5 — cards and syntheses

`1_Literature/card&outputs_def.md` is your **brief** to the agent, the one content file
that gives it instructions:

- **`## Cards`** sets the sections every card has, in order. Edit a line and every future
  card follows.
- **`## Grouping`** sets how the paper index groups the library.
- **`## Outputs`** lists the **syntheses** you want, one line each, saying what each must
  achieve. The agent chooses their shape and writes nothing you haven't listed.
- **`## Notes to the agent`** holds anything specific to this project's reading.

```
/lit-cards                 a card for every converted paper that has none
/lit-cards smith2024foo    only these
/lit-outputs               every synthesis in the brief
/lit-outputs "The gap"     only this one
```

If the brief is still untouched, both commands first fill it with you. If `## Grouping`
is empty, `/lit-cards` proposes a few ways to group the index (by approach, by role toward
your idea, by problem setting…), writes your choice there, and moves each carded paper
from `## Unsorted` to its group. A card fits on one screen, and every claim in it points
to the paper's markdown.

**Handwritten notes.** Put scans in `1_Literature/Human_encoding/`. Organise them from
`Human_encoding.md`, with one note per topic in `Notes/` that embeds the scans:
`![](../scan_03.pdf)`. The agent never reads them. If you ask, it can set up a note, but it
never interprets one. Notes on the idea itself go in `2_Idea/Human_encoding/` (section 5).

## 5. Formalise the method

`2_Idea/Setup_and_Method.md` states the gap the literature showed, formally:

| section | what goes in |
| --- | --- |
| Notation | every symbol, once. `5_Paper/preamble.tex` mirrors this table |
| Problem | what is given, what is wanted, what makes it hard |
| Method | the objective, its constraints, the mapping, its assumptions |
| Hypotheses & Value | `H1`, `H2`…, each falsifiable; then a short paragraph on what the field gains if they hold |
| Anticipated experiments | three or four lines. The detail goes in `Experiments.md` |

Rename or drop any heading that doesn't fit. `2_Idea/` holds your claims: the agent writes
there only when you ask, in a direct, notation-driven style.

**The boundary.** If something could be chosen differently without changing the idea, it is
a spec and goes in `3_Implementation/`. So `2_Idea/` never names a layer count, a learning
rate, a dataset, a library or a seed. It says *an encoder with these properties*.
`3_Implementation/` says *which encoder, at what size*.

**Handwritten notes on the idea.** Put scans in `2_Idea/Human_encoding/`, organised like
the literature notes: a `Human_encoding.md` hub, one note per topic in `Notes/`. Here the
agent reads a note when you point it to one, e.g. while you formalise the method together.
It never cites a note: a claim counts once it is written in `Setup_and_Method.md`.

## 6. Plan the experiments

**`2_Idea/Experiments.md`** defines each experiment once, under a permanent **E-id**:

| field | what goes in |
| --- | --- |
| Establishes | which hypothesis, and how |
| Why worth doing | what stays unknown without it |
| Design | what varies, what is held fixed (in the abstract) |
| Expected outcome | what happens if the hypothesis holds |
| Would refute | the outcome against it. If nothing could refute it, it isn't an experiment |

E-ids are never renumbered. Mark an abandoned experiment as abandoned instead of deleting it.

**`3_Implementation/`** makes each experiment runnable. Nothing here is a claim.

| file | what goes in |
| --- | --- |
| `Specs.md` | per E-id: model, hyperparameters, data / splits, seeds, compute, metrics, plus a note for any choice whose reason isn't obvious |
| `Figures.md` | one block per figure. A **plot** needs its source runs and encoding, a **schematic** the mechanism it shows and what it leaves out, a **panel** its rule for choosing examples |
| `Code_Design.md` | how `MYPROJ/` is laid out: modules, entry points, artifacts. The template ships only its shell, so decide the layout here first |

**`4_Results_and_Tracking/Scenario_Tree.md`** is a mermaid DAG of the experiments:

```mermaid
flowchart LR
  E01["E01 · baseline"]
  E02["E02 · probe transfer"]
  E02 --> E03["E03 · scale up"]
  E02 -->|"metric ≥ threshold"| E04["E04 · ablation"]
  E02 -->|"metric < threshold"| E05["E05 · diagnose"]
```

| drawn as | means |
| --- | --- |
| no incoming edge | independent, can run in parallel |
| plain edge `-->` | needs the other experiment finished, whatever its result |
| labelled edge `-->\|"cond"\|` | runs only on that outcome. Diverging labels mark a branch point |

Under the DAG, `## Runnable now` lists what you can launch today, and `## Blocked` lists
what each remaining experiment is waiting on.

## 7. Run and track

When a run finishes, ask the agent to do all three steps in one go:

1. **Record it** in `4_Results_and_Tracking/Runs/<E-id>-<YYYY-MM-DD>.md`: frontmatter with
   `expid`, `date`, `seed` and `commit`, then a metrics table and the artifact paths. A second run on the same day gets a `-b` suffix. Records are never edited, and a
   failed run is recorded as failed.
2. **Analyse it** in `Results.md`, one block per hypothesis: **Evidence** (the runs, cited
   by filename), **Verdict** (supported · refuted · inconclusive), **Open**. Anything no
   hypothesis predicted goes under **Cross-cutting observations**. A refuted hypothesis is a
   finding.
3. **Update the DAG.** A dependency counts as met only when its run record exists. If an
   outcome makes an experiment pointless, mark its node dropped, with the reason, instead
   of deleting it.

**No invented numbers.** Every metric in the project traces back to a file in `Runs/`. If
there is no record, the agent says the number doesn't exist.

## 8. Write the paper

`5_Paper/` is self-contained LaTeX: `main.tex`, `preamble.tex`, `sections/*.tex`,
`refs.bib`, `figures/`. To compile, zip the folder's **contents**, so that `main.tex` sits
at the root of the archive, and upload the zip to Overleaf.

- **Citations.** `refs.bib` keys are the library's citekeys. The agent won't `\cite` a
  paper that has no card.
- **Notation.** `preamble.tex` macros mirror `## Notation`. When you change a symbol, change
  it in both.
- **Figures.** The code writes them to `MYPROJ/outputs/`; copy the ones the paper uses
  into `figures/`. Name them descriptively, e.g. `encoder-overview.pdf` with
  `\label{fig:encoder-overview}`, not by their number in `Figures.md`.
- **Claims.** The paper can explain `2_Idea/` at more length, but it must not claim
  anything different. If a claim has to change, change it in `2_Idea/` first.

## 9. Publish the code

The contents of `MYPROJ/` become a new repo with one commit. History stays in the brain.
Only committed files are exported, so commit first. **In the terminal:**

```sh
mkdir ~/Projects/MYPROJ-public && cd ~/Projects/MYPROJ-public
git -C ~/Projects/MYPROJ_Brain archive HEAD:MYPROJ | tar -x
uv sync && uv run main.py                 # runs without the brain?
git init && git add . && git commit -m "Initial release"
gh repo create MYPROJ --public --source . --push
```

Check the file list first: everything committed in `MYPROJ/` goes public.

**New release:**

```sh
cd ~/Projects/MYPROJ-public
git rm -rq . && git -C ~/Projects/MYPROJ_Brain archive HEAD:MYPROJ | tar -x
git add . && git commit -m "Release v1.1" && git push
```

---

## 10. Reference

### The two keys

One identifier is reused verbatim everywhere, so a single grep finds everything about a
paper or an experiment.

- **citekey** (`author2024keyword`) names a paper's PDF, `Papers/` folder, card, index
  row and `refs.bib` entry.
- **E-id** (`E01`, `E02`…) names an experiment in `Experiments.md`, `Specs.md`, `Runs/`,
  `Results.md` and the DAG.

### Who writes what

| path | written by |
| --- | --- |
| `2_Idea/` | you. The agent writes there only when asked |
| `card&outputs_def.md`, the Decision column, both `Human_encoding/` folders | you |
| `Cards/`, `Literature_Outputs/`, `Runs/` (real runs only) | the agent |
| `3_Implementation/`, `MYPROJ/`, `Results.md`, `Scenario_Tree.md`, `5_Paper/` | both |
| `PDFs/` | you and `omniframe download`. Never overwritten; renamed to its citekey only with your permission |
| `Papers/` | `omniframe convert` only. Read-only |
| `Paper_Index.md` | `omniframe download` (rows) and `omniframe convert` (markdown links); the agent, for cards and groups |

### Where the agent takes instructions from

The agent takes instructions only from the `CLAUDE.md` files, the `/commands`, your brief
(`card&outputs_def.md`) and you in chat. Everything else is content: your other files, the
converted papers, web pages. If any of these contains text that reads like an instruction,
the agent points it out and doesn't follow it.

### Links

Every link is a standard markdown link with a path relative to its file, like
`[card](Cards/x.md)` or `![](../scan.pdf)`. Never use an Obsidian `[[wikilink]]`.
Standard links open in Obsidian, GitHub and VS Code, and the agent can follow them. The
bundled `.obsidian/app.json` makes Obsidian create links in this form.

### Checking the brain

`/wrap` runs four quick checks. For a full audit (cards against the brief, `refs.bib`
against the library, the DAG against the run records), ask the agent to *check the brain*.
It reports problems and fixes nothing.

---

## 11. Update and edit OmniFrame

| what | updated by |
| --- | --- |
| the `omniframe` commands | `git pull` in the clone (`omniframe update` does it) |
| new projects | nothing: `omniframe init` downloads the template each run |
| an existing project | `omniframe update`, from inside it |

**In the terminal:**

```sh
cd ~/Projects/MYPROJ_Brain
omniframe update             # --dry-run to preview
```

It needs a clean `git status`, and leaves its changes uncommitted: review with `git diff`.

| template changed a file you… | result |
| --- | --- |
| never touched | replaced |
| edited, agent or navigation file (`CLAUDE.md`, `/commands`, MOCs) | diff shown, you choose |
| edited, your content (forms, lists, paper, code) | never touched, listed |

`.omniframe` records what the template installed. Never edit it.

**Editing the template.** Test a change before pushing, uncommitted edits included. **In
the terminal:**

```sh
omniframe init --repo ~/Projects/OmniFrame /tmp/Try
omniframe update --no-pull   # inside a project: uses the clone's template as it is
```

Tokens replaced in file contents and path names: `__PROJECT_NAME__`, `__CODE_DIR__` (the
plain name, `MYPROJ`), `__SLUG__`, `__PKG__`, `__AUTHOR__`, `__YEAR__`, `__DATE__`.
