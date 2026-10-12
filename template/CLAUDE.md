# __PROJECT_NAME__ — the research brain

This repo holds one research project whole: the literature, the formal idea, the
implementation decisions, the results, and the paper. You are working inside a
researcher's thinking. Your job is to fill, connect and check it — not to author it.

**Before writing anything in an area, read that area's `CLAUDE.md` first.** Each one
defines the shape of its files and what counts as done. Do not skip it because a file
looks obvious.

## The map

| Area | Holds |
| ---- | ----- |
| `0-Master.md` | the master MOC: links to everything |
| `1 Literature/` | papers in, cards and syntheses out |
| `2 Idea/` | the formal layer: problem, notation, method, hypotheses, experiments |
| `3 Implementation/` | the concrete choices: specs, figures, code design |
| `4 Results/` | run records, the analysis, and the experiment DAG |
| `5 Paper/` | self-contained LaTeX, ready to upload to Overleaf |

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
| `PDFs/`, `Papers/` | the researcher — uploaded source. you read it, never touch it |
| `Human encoding/` | the researcher. you may list it and nothing else |
| `card&outputs_def.md` | the researcher. it governs your cards and commissions your outputs |
| `Cards/`, `Literature Outputs/` | you |
| `2 Idea/` | the researcher. you write here only when asked |
| `3 Implementation/`, `4 Results/Results.md`, `Scenario Tree.md`, `5 Paper/` | both |
| `4 Results/Runs/` | you, from real runs only |
| any `status: stable` | the researcher, only |

## Hard rules

1. **Never invent a number.** Every metric traces to a file in `4 Results/Runs/`. If
   there is no run record, the number does not exist — say so.
2. **Never touch `Human encoding/`.** Those are the researcher's own handwritten notes,
   often spanning several papers. List them if asked. Never rename, embed, cite, index,
   or treat a filename as evidence for a claim.
3. **Never modify `PDFs/` or `Papers/`.** Uploaded source material is read-only.
4. **No choices in `2 Idea/`, no claims in `3 Implementation/`.** The test: if it could
   have been chosen differently without changing the idea, it is a spec.
5. **Never write in `2 Idea/` unasked.** Those are the researcher's claims, not yours.
6. **Never set `status: stable`.** Only the researcher promotes a file.
7. **Never cite a page you have not read.** In a card, cite the source markdown in
   `Papers/<citekey>/`.
8. **Never copy a formula out of `Papers/` markdown.** It is converter output: some
   equations are clean LaTeX, others are flattened into HTML `<sup>`/`<sub>` where a
   subscript is indistinguishable from a superscript. Use it to understand a paper, not
   as the source of notation. If a formula must be reproduced in `2 Idea/` or
   `5 Paper/`, name the one you need and ask — the PDF is the authority.
9. When a rule and a request conflict, say which rule and ask. Do not quietly pick.

## Consistency check

When asked to check the brain, verify the following and **report** what is wrong — fix
nothing silently:

- every `Papers/<citekey>/` has a `Cards/<citekey>.md`, and every card has source material
- every `@citekey` in `5 Paper/refs.bib` exists in the library, and vice versa
- every card's sections match `## Cards` in `card&outputs_def.md`, in the same order
- every output commissioned in `## Outputs` exists, and nothing in `Literature Outputs/`
  is uncommissioned
- every E-id in `Specs.md`, `Runs/` and the DAG exists in `2 Idea/Experiments.md`
- every experiment is a node in the DAG and every node is an experiment; no cycles; every
  labelled edge carries a condition
- `## Runnable now` agrees with the DAG and the run records
- every `status:` is one of the three legal values
- no unsubstituted template placeholder survives (a bare double-underscored
  uppercase name, as written by the scaffolder)

## This repo's README

Keep `README.md` to a short paragraph saying what the project is, pointing at
`0-Master.md`. The brain is the documentation; the README is a doorway.
