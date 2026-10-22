# 1_Literature

Papers come in, cards and syntheses go out.

## How papers arrive

1. **`/lit-search`** proposes papers into `Proposed_literature.md`; the researcher marks
   **Decision**. The anchor papers of `3_Idea/High_level.md` not yet in the library come
   in the same way, already marked `OK`.
2. **`/lit-download`** runs `omniframe download` — each `OK` paper gets its PDF, its BibTeX,
   and a row under `## Unsorted` in `Paper_Index.md` — then `omniframe convert`, which turns
   the PDFs into markdown and links it in the index. It also brings in a paper given as a
   link, or a PDF the researcher saved into `PDFs/` by hand.
3. **`/lit-cards-index`** writes the cards and does the final indexing; **`/lit-outputs`**
   writes a synthesis when the researcher asks for one.

`Proposed_literature.md` holds three lists. You fill every column except **Decision**. The
exceptions are the `OK` that `/lit-search` writes for an anchor paper, and the one
`/lit-download` writes for a paper the researcher gave as a link or saved by hand — all
were their choice. What
`omniframe download` does with each mark:

| list | `OK` | `NO` | blank |
| ---- | ---- | ---- | ----- |
| the proposals | downloaded | moved to `## Declined` | moved to `## Later` |
| `## Later` | downloaded | moved to `## Declined` | stays |

`## Declined` is never proposed again; deleting a line lets the paper back in.

## `Paper_Index.md`

It lists and groups; it holds no analysis. `## Unsorted` holds the papers downloaded but
not yet carded — `omniframe download` needs that heading, so never rename or remove it.
`/lit-cards-index` moves each carded paper under a `## <group>` heading. The groups are the
researcher's: never regroup filed papers without asking.

## Reading a paper

Read it through its Markdown link in the index: conversion is the normal route, cheaper
and reusable. For a quick question about a paper not converted yet, you may read its PDF
directly — say that you did. Cards are always written from the markdown, so every claim
in them stays traceable.

**Formulas in the markdown are unreliable.** The converter turns some equations into clean
LaTeX and flattens others into HTML `<sup>`/`<sub>`, where a subscript and a superscript
look the same. Use the markdown to understand a paper; never copy a formula from it. When
a formula must be reproduced, read it from the PDF page itself.

## Cards and syntheses

**`Cards/<citekey>.md`** — one per paper, one screen. By default: the problem, the method,
the results it reports, its limitations, and its relevance to this project's idea. Adapt
it to the paper (a survey, a theory paper and a benchmark do not need the same card) and
to any focus the researcher gave; without one, keep the shape of the cards already
written. Every claim points to the section of the markdown it comes from; a number the
paper did not state does not belong in it.

**`Literature_Outputs/<name>.md`** — a synthesis the researcher asked for, argued from the
cards. Its shape is yours.

## Handwritten notes

`Human_encoding/` holds the researcher's scanned notes on the reading, organised from
`Human_encoding/Human_encoding.md`, with notes in `Human_encoding/Notes/` that embed the
scans. Read a note when the researcher points you to it. Asked, you may create a note or
add embeds for scans they name.
