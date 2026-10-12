# OmniFrame

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
0-Master.md             master MOC
1 Literature/           PDFs, Papers (converted), Cards, Outputs, Human encoding
2 Idea/                 Setup & Method.md, Experiments.md    formal, no choices
3 Implementation/       Specs, Figures, Code Design          choices, no claims
4 Results/              Results.md, Scenario Tree.md (DAG), Runs/
5 Paper/                self-contained LaTeX; zip the contents for Overleaf
CLAUDE.md               agent contract, plus one per area
```

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
