![OmniFrame](logo.png)

Repo template for an AI research project. Literature, formal method, implementation,
results and the LaTeX paper in one place, plus the agent instructions for working in it.

```
bin/research-init      lay template/ over a project
bin/research-download  papers you marked OK -> PDFs, refs.bib, paper index
bin/research-convert   paper PDFs -> markdown
bin/research-link      put them on PATH
template/              the structure. plain files, edit freely.
```

## Install

```sh
git clone https://github.com/LeonardoSani/OmniFrame.git ~/Projects/OmniFrame
~/Projects/OmniFrame/bin/research-link
```

`research-link` symlinks the scripts into `~/.local/bin`. Idempotent; `--check` verifies
without changing anything.

For paper conversion, once:

```sh
uv tool install marker-pdf     # the converter. large: pulls torch
```

marker reads PDFs with its own vision model, which needs a local inference backend:

| hardware | backend | install |
| --- | --- | --- |
| Apple Silicon, or CPU | llama.cpp | `brew install llama.cpp` |
| NVIDIA GPU | vLLM | Docker + NVIDIA Container Toolkit |

Both are local and free. Weights download once on first use and are cached.

## New project

```sh
mkdir ~/Projects/MYPROJ && cd ~/Projects/MYPROJ
uv init
research-init
```

Existing files are skipped, so uv's `pyproject.toml` survives. `.gitignore` is appended to.

| flag | |
| --- | --- |
| `--dry-run` | print the plan, write nothing |
| `--force` | overwrite existing files |
| `--name "Title"` | LaTeX title, when nicer than the folder name |
| `--repo DIR` | use a local template clone instead of GitHub |

## Literature workflow

From an idea to read, carded papers. Commands starting with `/` run in Claude Code; the
others run in the terminal, from anywhere inside the project.

| # | step | run | result |
| - | ---- | --- | ------ |
| 1 | write the idea | — | `2_Idea/High_level.md`: topic, scope, anchor papers, keywords |
| 2 | find papers | `/lit-search ["bias"]` | ~10 proposals in `1_Literature/Proposed_literature.md` |
| 3 | choose | — | you mark each proposal's **Keep** column |
| 4 | download | `research-download` | PDFs, BibTeX, a row each in `1_Literature/Paper_Index.md` |
| 5 | convert | `research-convert` or `/lit-convert` | PDFs become markdown the agent reads |
| 6 | cards | `/lit-cards` | one card per paper; papers grouped in the index |
| 7 | syntheses | `/lit-outputs` | the documents commissioned in `card&outputs_def.md` |

`1_Literature/Paper_Index.md` is the library: every paper once, with links to its **pdf**
(for you), its converted **md** (for the agent) and its **card**.

### 2 · Find papers

```
/lit-search                                          # from High_level.md alone
/lit-search "theory only, after 2020, no surveys"    # steered by a bias
```

The **bias** is optional: a sentence in your own words that steers this one search — kind
of paper, period, venue, method family, what to leave out. It narrows `High_level.md`,
never replaces it, and is not saved anywhere. Foundational work is not assumed known: a
paper counts as known only if it is already in the library, in `refs.bib`, or among your
anchor papers. If the bias would cut a foundation — "after 2020" against the 2017 paper the
field rests on — the agent names it and asks before searching.

Every proposal comes with its venue, why it fits the idea, and its link. Each is a paper
the agent found and opened, never one recalled from memory. Nothing is downloaded yet. If
`High_level.md` is empty, the agent offers to write it with you first.

### 3 · Choose

| Keep | what happens at download |
| ---- | ------------------------ |
| `OK` | downloaded into the library |
| `LATER` | moved to `## Later`, kept across searches; mark it `OK` there any time |
| `NO` | moved to `## Declined`, never proposed again |
| blank | dropped; a later search may propose it again |

### 4 · Download

```sh
research-download --dry-run   # what would happen
research-download             # do it, then reset the table
research-download --list      # every proposal and its mark
```

For each `OK` paper: the PDF lands in `1_Literature/PDFs/<citekey>.pdf`, its BibTeX in
`5_Paper/refs.bib` (taken from its DOI or arXiv, never typed), and a row in the index.
An existing PDF is never overwritten. A paper with no open PDF stays `OK` with the reason
in its row: drop the PDF in by hand under that name and run it again.

### 5 · Convert

```sh
research-convert           # every PDF that has no markdown yet
research-convert --list    # state of the library
```

Writes `1_Literature/Papers/<citekey>/`: markdown plus extracted images. Converted papers
are skipped, so re-running is safe. One marker process per batch, so the model loads
once. Also `--force`, `--only <citekey>`, `--dry-run`. `/lit-convert` runs the same thing
from Claude Code and links each result in the index.

A PDF you already have needs no search: drop it in as `1_Literature/PDFs/<citekey>.pdf`
and start here.

Equations come out unevenly: some LaTeX, some flattened to HTML tags. Accepted on purpose —
the agent reads this markdown, you read the PDF. Both `CLAUDE.md` files tell the agent to
use it to understand a paper and never as the source of a formula.

`--use-llm` is the escape hatch, off by default. It is a *second* model: an external LLM
(Gemini, Claude, OpenAI, or a local Ollama) doing a cleanup pass on inline maths and tables,
unlike the local vision model above that does the conversion itself. Costs money unless
pointed at Ollama. Worth it per paper, not as a standing setting:

```sh
research-convert --force --only <citekey> --use-llm
```

### 6–7 · Cards and syntheses

`1_Literature/card&outputs_def.md` is your brief: the sections every card has, and the
documents you want written from them. If it is still empty, `/lit-cards` and
`/lit-outputs` ask you questions to fill it first, and write only what you confirm.

The first `/lit-cards` also asks how to group the index — by approach, by role toward
your idea, by problem setting… — offering options for you to pick.

### Your own notes

Scans of handwritten notes go in `1_Literature/Human_encoding/`. Organise them in
`Human_encoding.md`, with one note per topic in `Notes/` that embeds the scans:
`![](../scan_03.pdf)`. The agent never reads them; asked, it can set up a note for you.

## Links

Every link in the brain is a standard markdown link with a path relative to its file —
`[card](Cards/x.md)`, `![](../scan.pdf)` — never an Obsidian `[[wikilink]]`. That way it
opens in Obsidian, GitHub and VS Code, and the agent can follow it exactly. The template
ships `.obsidian/app.json`, so links Obsidian creates for you follow the same rule.

## Structure

```
0-Master.md                  master MOC: the question, and links to every area
CLAUDE.md                    agent contract: map, keys, links, ownership, hard rules
.claude/commands/            /lit-search /lit-convert /lit-cards /lit-outputs /wrap
.obsidian/app.json           makes Obsidian write markdown links, not wikilinks

1_Literature/                papers in, cards out
├── Paper_Index.md           every paper, grouped: pdf · md · card. the way into the library
├── Proposed_literature.md   /lit-search proposes, you mark Keep, research-download fetches
├── card&outputs_def.md      YOU define: what a card covers, which outputs you want
├── PDFs/<citekey>.pdf       research-download or you. gitignored, never overwritten
├── Papers/<citekey>/        converted markdown + extracted images
├── Cards/<citekey>.md       agent writes, to the sections you defined
├── Literature_Outputs/      agent writes, only what you commissioned
├── Human_encoding/          your scans, Human_encoding.md hub + Notes/ embedding them.
│                            agent never reads them
└── 1-Literature.md          area MOC

2_Idea/                      the idea, from plain words to formal. no implementation choices
├── High_level.md            the idea in plain words. what /lit-search reads
├── Setup_and_Method.md      problem · notation · method · hypotheses
└── Experiments.md           per E-id: what it establishes, what would refute it

3_Implementation/            the concrete choices. nothing here is a claim
├── Specs.md                 per E-id: architecture, hyperparams, data, seeds, compute
├── Figures.md               what each figure must show — plots, diagrams, panels
├── Code_Design.md           repo structure + modules. decides where code goes
└── 3-Implementation.md      area MOC

4_Results_and_Tracking/      results, and where the work stands
├── Where_we_are.md          the briefing: read first each session, rewritten by /wrap
├── Results.md               the analysis
├── Scenario_Tree.md         mermaid DAG: experiment dependencies, and what is runnable
├── Runs/<E-id>-<date>.md    one record per run. the only source of a metric
└── 4-Results_and_Tracking.md  area MOC

5_Paper/                     zip the contents, upload to Overleaf
├── main.tex
├── preamble.tex             macros mirroring the notation section
├── sections/*.tex
├── refs.bib                 @citekeys identical to 1_Literature/
└── figures/                 the paper names and labels these itself
```

Every area also has its own `CLAUDE.md`, read before writing in it.

Numbering is the dependency order. Code is not scaffolded — `3_Implementation/Code_Design.md` decides its layout.

Two keys keep it greppable:

- `citekey` — born in `Proposed_literature.md`; spans `PDFs/`, `Papers/`, `Cards/`, `Paper_Index.md`, `refs.bib`
- `E-id` — spans `Experiments.md`, `Specs.md`, `Runs/`, `Results.md`, the DAG

## Editing the template

`template/` is cloned at run time, so a pushed change reaches the next `research-init` on
any machine. The scripts run from the local clone and need `git pull`.

Test changes before pushing:

```sh
research-init --repo ~/Projects/OmniFrame
```

Tokens substituted in file contents and in path names: `__PROJECT_NAME__`, `__SLUG__`,
`__PKG__`, `__AUTHOR__`, `__YEAR__`, `__DATE__`.
