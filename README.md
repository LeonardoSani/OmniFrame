![OmniFrame](logo.png)

Repo template for an AI research project. Literature, formal method, implementation,
results and the LaTeX paper in one place, plus the agent instructions for working in it.

```
bin/research-init     lay template/ over a project
bin/research-convert  paper PDFs -> markdown
bin/research-link     put both on PATH
template/             the structure. plain files, edit freely.
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
uv tool install marker-pdf     # large: pulls torch
brew install llama.cpp         # marker's backend on Apple Silicon
```

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

## Convert papers

Drop a PDF as `1 Literature/PDFs/<citekey>.pdf`, then from anywhere in the project:

```sh
research-convert           # convert every PDF that has no markdown
research-convert --list    # state of the library
```

Writes `1 Literature/Papers/<citekey>/` — markdown plus extracted images. Converted
papers are skipped, so re-running is safe. One marker process per batch, so the models
load once. Also `--force`, `--only <citekey>`, `--use-llm` (costs money unless pointed
at a local Ollama).

Equations come out unevenly: some LaTeX, some flattened to HTML tags. Fine for an agent
reading a paper, never the source of a formula. The PDF is the authority.

## Structure

```
0-Master.md                  master MOC, links every area
CLAUDE.md                    agent contract: map, keys, ownership, hard rules

1 Literature/                papers in, cards out
├── card&outputs_def.md      YOU define: what a card covers, which outputs you want
├── PDFs/<citekey>.pdf       you upload. gitignored
├── Papers/<citekey>/        converted markdown + extracted images
├── Cards/<citekey>.md       agent writes, to the sections you defined
├── Literature Outputs/      agent writes, only what you commissioned
├── Human encoding/          your scans. agent never touches them
└── 1-Literature.md          area MOC

2 Idea/                      the formal layer. general, no implementation choices
├── Setup & Method.md        problem · notation · method · hypotheses
└── Experiments.md           per E-id: what it establishes, what would refute it

3 Implementation/            the concrete choices. nothing here is a claim
├── Specs.md                 per E-id: architecture, hyperparams, data, seeds, compute
├── Figures.md               what each figure must show — plots, diagrams, panels
├── Code Design.md           repo structure + modules. decides where code goes
└── 3-Implementation.md      area MOC

4 Results/
├── Results.md               the analysis
├── Scenario Tree.md         mermaid DAG: experiment dependencies, and what is runnable
├── Runs/<E-id>-<date>.md    one record per run. the only source of a metric
└── 4-Results.md             area MOC

5 Paper/                     zip the contents, upload to Overleaf
├── main.tex
├── preamble.tex             macros mirroring the notation section
├── sections/*.tex
├── refs.bib                 @citekeys identical to 1 Literature/
└── figures/                 the paper names and labels these itself
```

Every area also has its own `CLAUDE.md`, read before writing in it.

Numbering is the dependency order. Code is not scaffolded — `3 Implementation/Code
Design.md` decides its layout.

Two keys keep it greppable:

- `citekey` — spans `PDFs/`, `Papers/`, `Cards/`, `refs.bib`
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
