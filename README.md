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

## Convert papers

Drop a PDF as `1_Literature/PDFs/<citekey>.pdf`, then from anywhere in the project:

```sh
research-convert           # convert every PDF that has no markdown
research-convert --list    # state of the library
```

Writes `1_Literature/Papers/<citekey>/` — markdown plus extracted images. Converted papers
are skipped, so re-running is safe. One marker process per batch, so the model loads once.
Also `--force`, `--only <citekey>`, `--dry-run`.

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

## Structure

```
0-Master.md                  master MOC: the question, and links to every area
CLAUDE.md                    agent contract: map, keys, ownership, hard rules
.claude/commands/wrap.md     /wrap — close out a session

1_Literature/                papers in, cards out
├── card&outputs_def.md      YOU define: what a card covers, which outputs you want
├── PDFs/<citekey>.pdf       you upload. gitignored
├── Papers/<citekey>/        converted markdown + extracted images
├── Cards/<citekey>.md       agent writes, to the sections you defined
├── Literature_Outputs/      agent writes, only what you commissioned
├── Human_encoding/          your scans. agent never touches them
└── 1-Literature.md          area MOC

2_Idea/                      the formal layer. general, no implementation choices
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
