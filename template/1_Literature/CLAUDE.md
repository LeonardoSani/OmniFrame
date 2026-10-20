# 1_Literature

Papers come in, cards and syntheses go out.

## How papers arrive

1. **`/lit-search`** proposes papers into `Proposed_literature.md`; the researcher marks
   **Decision**.
2. **`/lit-download`** runs `omniframe download`: each `OK` paper gets its PDF, its BibTeX,
   and a row under `## Unsorted` in `Paper_Index.md`.
3. **`/lit-convert`** runs `omniframe convert`: PDFs become markdown, and the index gets
   the Markdown links. It first brings in any PDF the researcher saved into `PDFs/` by hand.
4. **`/lit-cards`**, then **`/lit-outputs`** when the researcher asks for a synthesis.

`Proposed_literature.md` holds the open proposals, `## Later` (deferred) and `## Declined`
(never propose these again). You fill every column except **Decision**; the one exception
is the `OK` that `/lit-convert` writes for a PDF the researcher added by hand.

## `Paper_Index.md`

It lists and groups; it holds no analysis. `## Unsorted` holds the papers downloaded but
not yet carded — `omniframe download` needs that heading, so never rename or remove it.
`/lit-cards` moves each carded paper under a `## <group>` heading. The groups are the
researcher's: never regroup filed papers without asking.

## Reading a paper

Read it through its Markdown link in the index. If a paper has a PDF but no `Papers/`
folder, it is not converted yet: say so, do not read the PDF in its place.

**Formulas in the markdown are unreliable.** The converter turns some equations into clean
LaTeX and flattens others into HTML `<sup>`/`<sub>`, where a subscript and a superscript
look the same. Use the markdown to understand a paper; never copy a formula from it. When
a formula must be reproduced, read it from the PDF page itself.

## Cards and syntheses

**`Cards/<citekey>.md`** — one per paper, one screen. By default: the problem, the method,
the results it reports, its limitations, and its relevance to this project's idea. Adapt
it to the paper (a survey, a theory paper and a benchmark do not need the same card) and
to any focus the researcher gave. Every claim points to the section of the markdown it
comes from; a number the paper did not state does not belong in it.

**`Literature_Outputs/<name>.md`** — a synthesis the researcher asked for, argued from the
cards. Its shape is yours.

## Handwritten notes

`Human_encoding/` holds the researcher's scanned notes on the reading, organised from
`Human_encoding/Human_encoding.md`, with notes in `Human_encoding/Notes/` that embed the
scans. Read a note when the researcher points you to it. Asked, you may create a note or
add embeds for scans they name.
