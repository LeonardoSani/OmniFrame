---
status: empty
updated: __DATE__
---

# Literature

Paths below are relative to `1 Literature/`.

- [Cards & outputs definition](<card&outputs_def.md>) — what a card covers, and which syntheses are commissioned

## Outputs

The syntheses produced from the reading, in `Literature Outputs/`. Only what
`card&outputs_def.md` commissions.

## Cards

One per paper, at `Cards/<citekey>.md`. The same sections in every card, set by
`card&outputs_def.md`.

## Source — read-only

- `PDFs/<citekey>.pdf` — papers as published. Gitignored.
- `Papers/<citekey>/` — converted markdown plus extracted images. Find the markdown by
  glob; the converter chose its name. Formulas in it are unreliable — see `CLAUDE.md`.
- `Human encoding/` — the researcher's handwritten notes. Human-only, no naming
  convention, not keyed to papers.

## Downstream

The literature states the gap; [Setup & Method](<../2 Idea/Setup & Method.md>) is that
gap, formalised.
