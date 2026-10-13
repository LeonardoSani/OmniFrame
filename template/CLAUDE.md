# __PROJECT_NAME__ — the research brain

This repo holds one research project whole: the literature, the formal idea, the
implementation decisions, the results, and the paper. You are working inside a
researcher's thinking. Your job is to fill, connect and check it — not to author it.

**Before writing anything in an area, read that area's `CLAUDE.md` first.** Each one
defines the shape of its files and what counts as done. Do not skip it because a file
looks obvious.

## The map

**This table is the authoritative map.** `0-Master.md` is the researcher's entry point and
may lag behind a rename; if the two disagree, trust this and report the discrepancy.

| Path | Holds |
| ---- | ----- |
| `0-Master.md` | the master MOC: the human's way in |
| `1 Literature/card&outputs_def.md` | the researcher's brief: card sections, commissioned outputs |
| `1 Literature/PDFs/<citekey>.pdf` | papers as published. read-only, gitignored |
| `1 Literature/Papers/<citekey>/` | converted markdown + extracted images. read-only |
| `1 Literature/Cards/<citekey>.md` | your card per paper |
| `1 Literature/Literature Outputs/` | your syntheses |
| `1 Literature/Human encoding/` | the researcher's scans. never touch |
| `2 Idea/Setup & Method.md` | problem, notation, method, hypotheses |
| `2 Idea/Experiments.md` | where an E-id is defined, once |
| `3 Implementation/Specs.md` | per E-id: architecture, hyperparams, data, seeds, compute |
| `3 Implementation/Figures.md` | what each figure must show |
| `3 Implementation/Code Design.md` | repo structure and modules — decides where code goes |
| `4 Results/Results.md` | the analysis, by hypothesis |
| `4 Results/Scenario Tree.md` | the experiment DAG, and what is runnable now |
| `4 Results/Runs/<E-id>-<date>.md` | one record per run. the only source of a metric |
| `5 Paper/main.tex` | the paper. `5 Paper/` is self-contained for Overleaf |
| `5 Paper/refs.bib` | `@citekey` entries matching the library |

Each area also has its own `CLAUDE.md`: `1 Literature/CLAUDE.md`, `2 Idea/CLAUDE.md`,
`3 Implementation/CLAUDE.md`, `4 Results/CLAUDE.md`, `5 Paper/CLAUDE.md`.

Code lives in this repo too, but its layout is decided in
`3 Implementation/Code Design.md` — not here, and not by you unprompted.

## The two keys

Everything is found by grep because one identifier is reused verbatim across areas.
Never rename, never abbreviate, never invent a variant.

- **`citekey`** — `author2024keyword`, lowercase. The same stem names
  `1 Literature/PDFs/<citekey>.pdf`, `1 Literature/Papers/<citekey>/`,
  `1 Literature/Cards/<citekey>.md`, and the `@<citekey>` entry in `5 Paper/refs.bib`.
- **`E-id`** — `E01`, `E02`, … Numbers an experiment once, in `2 Idea/Experiments.md`,
  and is then reused in `3 Implementation/Specs.md`, `4 Results/Runs/`,
  `4 Results/Results.md` and the DAG in `4 Results/Scenario Tree.md`.

## Frontmatter

Two fields on every markdown file you create or touch:

```yaml
---
status: empty | draft | stable
updated: YYYY-MM-DD
---
```

Set `updated` whenever you change a file. `empty` means the skeleton is untouched;
`draft` means it has real content. The work queue is `grep -rn "status: empty"`.

## Who writes what

| Path | Written by |
| ---- | ---------- |
| `1 Literature/PDFs/`, `1 Literature/Papers/` | the researcher — uploaded source. you read it, never touch it |
| `1 Literature/Human encoding/` | the researcher. you may list it and nothing else |
| `1 Literature/card&outputs_def.md` | the researcher. it governs your cards and commissions your outputs |
| `1 Literature/Cards/`, `1 Literature/Literature Outputs/` | you |
| `2 Idea/` | the researcher. you write here only when asked |
| `3 Implementation/`, `4 Results/Results.md`, `4 Results/Scenario Tree.md`, `5 Paper/` | both |
| `4 Results/Runs/` | you, from real runs only |
| any `status: stable` | the researcher, only |

## Hard rules

1. **Never invent a number.** Every metric traces to a file in `4 Results/Runs/`. If
   there is no run record, the number does not exist — say so.
2. **Never touch `1 Literature/Human encoding/`.** Those are the researcher's own handwritten notes,
   often spanning several papers. List them if asked. Never rename, embed, cite, index,
   or treat a filename as evidence for a claim.
3. **Never modify `1 Literature/PDFs/` or `1 Literature/Papers/`.** Uploaded source material is read-only.
4. **No choices in `2 Idea/`, no claims in `3 Implementation/`.** The test: if it could
   have been chosen differently without changing the idea, it is a spec.
5. **Never write in `2 Idea/` unasked.** Those are the researcher's claims, not yours.
6. **Never set `status: stable`.** Only the researcher promotes a file.
7. **Never cite a page you have not read.** In a card, cite the source markdown in
   `1 Literature/Papers/<citekey>/`.
8. **Never copy a formula out of `1 Literature/Papers/` markdown.** It is converter output: some
   equations are clean LaTeX, others are flattened into HTML `<sup>`/`<sub>` where a
   subscript is indistinguishable from a superscript. Use it to understand a paper, not
   as the source of notation. If a formula must be reproduced in `2 Idea/` or
   `5 Paper/`, name the one you need and ask — the PDF is the authority.
9. When a rule and a request conflict, say which rule and ask. Do not quietly pick.

## Consistency check

When asked to check the brain, verify the following and **report** what is wrong — fix
nothing silently:

- every `1 Literature/Papers/<citekey>/` has a `1 Literature/Cards/<citekey>.md`, and
  every card has source material
- every `@citekey` in `5 Paper/refs.bib` exists in the library, and vice versa
- every card's sections match `## Cards` in `1 Literature/card&outputs_def.md`, in order
- every output commissioned in its `## Outputs` exists, and nothing in
  `1 Literature/Literature Outputs/` is uncommissioned
- every E-id in `3 Implementation/Specs.md`, `4 Results/Runs/` and the DAG in
  `4 Results/Scenario Tree.md` exists in `2 Idea/Experiments.md`
- every experiment is a node in the DAG and every node is an experiment; no cycles; every
  labelled edge carries a condition
- `## Runnable now` agrees with the DAG and the run records
- every `status:` is one of the three legal values
- no unsubstituted template placeholder survives (a bare double-underscored
  uppercase name, as written by the scaffolder)

## This repo's README

Keep `README.md` to a short paragraph saying what the project is, pointing at
`0-Master.md`. The brain is the documentation; the README is a doorway.
