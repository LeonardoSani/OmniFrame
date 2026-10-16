---
status: empty
updated: __DATE__
---

# Proposed literature

Papers `/lit-search` found for [High level](../2_Idea/High_level.md). Nothing here is in
the library yet. Mark **Keep** on each row, then run `research-download` in the terminal:

- `OK` — take it: PDF to `PDFs/<citekey>.pdf`, BibTeX to `5_Paper/refs.bib`, a row in
  [the index](Paper_Index.md)
- `LATER` — not now: the row moves to `## Later`, kept for another day
- `NO` — not relevant: the row goes, its citekey to `## Declined`, never proposed again
- blank — the row goes; a later search may propose it again

The agent fills every column except **Keep**, which is yours alone. **Link** is the
paper's page (DOI or arXiv first); **PDF** is a direct open-access file, or `—` when there
is none — then drop `PDFs/<citekey>.pdf` in by hand and run `research-download` again.

| Keep | citekey | Paper | Venue | Why | Link | PDF |
| ---- | ------- | ----- | ----- | --- | ---- | --- |

## Later

Marked `LATER`, kept across searches. Mark `OK` or `NO` here exactly as above.

| Keep | citekey | Paper | Venue | Why | Link | PDF |
| ---- | ------- | ----- | ----- | --- | ---- | --- |

## Declined

`citekey — title`, one per line. `/lit-search` never proposes these again; delete a line
to let a paper back in.
