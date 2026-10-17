![OmniFrame](logo.png)

**One repo for one research project: the reading, the idea, the experiments and the paper,
kept in shape by an AI agent that follows your rules.**

OmniFrame is a template for AI research. It lays a fixed structure over a project: the
literature, the formal method, the implementation decisions, the results and the LaTeX
paper, each in its own folder with its own rules. You open it in Obsidian; Claude Code works
in it next to you. Every folder tells the agent what it may write, what it must never touch
and what counts as done. The result is a research brain you can both navigate, and one that
doesn't make things up.

## What it does

- **Papers from an idea.** Describe the idea in plain words. `/lit-search` proposes papers
  the agent actually found and opened, you mark which to keep, and `/lit-download` fetches the
  PDFs and the BibTeX.
- **Papers the agent can read.** `research-convert` turns PDFs into markdown with a local
  vision model. It is free and runs offline.
- **Cards and syntheses on your terms.** You decide what every paper card covers and which
  summary documents you want. `/lit-cards` and `/lit-outputs` write exactly that.
- **One library index.** Every paper appears once, with links to its PDF (for you), its
  markdown (for the agent) and its card.
- **Idea kept apart from implementation.** Claims live in `2_Idea/` and concrete choices in
  `3_Implementation/`, so the method stays general and the specs stay honest.
- **Experiments as a dependency graph.** Each experiment has an id. A mermaid DAG shows what
  depends on what and what you can run today.
- **No invented numbers.** Every metric traces back to a run record. If there is no record,
  the number does not exist.
- **Session continuity.** The agent reads a briefing of under twenty lines when a session
  starts. `/wrap` rewrites it when the session ends and checks that the brain still holds
  together.
- **A paper ready for Overleaf.** `5_Paper/` is self-contained LaTeX, with citekeys shared
  with the library.
- **Clean files, guarded agent.** Your files start as blank forms, and the agent's rules
  live in `CLAUDE.md` files. Text in a paper or a note that looks like an instruction is
  flagged, never followed.

## Structure

```
0-Master.md                  the front page: links to every area
CLAUDE.md                    the agent's contract: map, keys, ownership, hard rules
.claude/commands/            /lit-search /lit-download /lit-convert /lit-cards /lit-outputs /wrap

1_Literature/                papers in, cards out
├── Paper_Index.md           every paper once: pdf · md · card
├── Proposed_literature.md   proposals awaiting your Keep mark
├── card&outputs_def.md      YOU define what a card covers and which syntheses you want
├── PDFs/  Papers/  Cards/  Literature_Outputs/
└── Human_encoding/          your scanned handwritten notes. the agent never reads them

2_Idea/                      the claims. no implementation choices
├── High_level.md            the idea in plain words. what /lit-search reads
├── Setup_and_Method.md      problem · notation · method · hypotheses
└── Experiments.md           per E-id: what it establishes, what would refute it

3_Implementation/            the choices. nothing here is a claim
├── Specs.md                 per E-id: architecture, hyperparams, data, seeds, compute
├── Figures.md               what each figure must show
└── Code_Design.md           where the code goes

4_Results_and_Tracking/      what came back
├── Where_we_are.md          the briefing. read first, rewritten by /wrap
├── Results.md               the analysis, by hypothesis
├── Scenario_Tree.md         the experiment DAG and what is runnable now
└── Runs/<E-id>-<date>.md    one record per run. the only source of a metric

5_Paper/                     self-contained LaTeX for Overleaf
```

Every area has its own `CLAUDE.md`, which the agent reads before it writes there.

## Install

```sh
git clone https://github.com/LeonardoSani/OmniFrame.git ~/Projects/OmniFrame
~/Projects/OmniFrame/bin/research-link       # puts the scripts on PATH (~/.local/bin)
uv tool install marker-pdf                   # the PDF converter. large: pulls torch
brew install llama.cpp                       # its local backend (Apple Silicon / CPU)
```

On an NVIDIA GPU, use vLLM as the backend instead (Docker + NVIDIA Container Toolkit).

## Start a project

```sh
mkdir ~/Projects/MYPROJ && cd ~/Projects/MYPROJ
uv init
research-init
```

Then open the folder in Obsidian and Claude Code, and write `2_Idea/High_level.md`.

**→ [The Guide](GUIDE.md)** explains how to use every part, in the order you'll need it.
