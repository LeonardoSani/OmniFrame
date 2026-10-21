---
description: Bring papers into the library — marked OK, linked, or saved by hand — downloaded and converted
argument-hint: [paper links, e.g. https://arxiv.org/abs/2403.01234]
---

Bring papers into the library. Read `1_Literature/CLAUDE.md` first.

Links from the researcher, may be empty: $ARGUMENTS

A paper can arrive three ways: marked `OK` in `1_Literature/Proposed_literature.md`, given
here as a link, or saved by the researcher straight into `1_Literature/PDFs/`. Steps 1 and
2 turn the last two into `OK` rows, so step 4 handles them all alike.

## 1. Papers given by link

For each link: open the page and confirm title, authors and venue; look for the official
code and project page. Then append a row to the first table of
`1_Literature/Proposed_literature.md`, by the column rules of `/lit-search`, with Decision
`OK` (the researcher chose this paper by giving the link) and Why `added by link`. Skip a
paper already in `1_Literature/Paper_Index.md`, and say so. A link you cannot resolve to a
real paper does not go in.

## 2. PDFs saved by hand

List the PDFs in `1_Literature/PDFs/` whose name has no row in
`1_Literature/Paper_Index.md`. Each was saved there by the researcher. For each one:

1. **Identify it.** Read its first page for title, authors and venue, then find the paper
   online and confirm it, with its official code and project page if any. If it cannot be
   identified, say so and leave it for the researcher.
2. **Ask**, for all of them at once, whether each may be renamed to its citekey,
   `author2024keyword` (see `/lit-search`): `attention.pdf` → `vaswani2017attention.pdf`.
   Renaming is the only change to `PDFs/` allowed, and only with this permission. If the
   researcher refuses, the file name as it is becomes the citekey.
3. **Write its row** at the end of the first table of `Proposed_literature.md`, by the
   column rules of `/lit-search`, with Decision `OK` (adding the file was their choice) and
   Why `added by hand`.

## 3. Check there is something to do

Read the **Decision** column, in the proposals table and in `## Later`. If no row is
marked `OK` or `NO`, the proposals table is empty, and no paper in the index is still
waiting for its markdown, say so and stop. Apart from the rows of steps 1 and 2,
**Decision** is the researcher's — never fill it in, never change a mark.

## 4. Download

Run `omniframe download` from the project root. For each `OK` paper it fetches the open
PDF (or finds it already in place) and the BibTeX, and adds its row to
`1_Literature/Paper_Index.md`. Then it resets the table: `NO` rows go to `## Declined`,
unmarked proposals to `## Later`. It writes every file itself — do not edit them around it.

## 5. Convert

Run `omniframe convert` from the project root. It converts every PDF that has no markdown
yet — the papers just downloaded, and any left from before — and links it in the index.
Papers already converted are skipped. It loads a large local model and can take minutes —
say so before starting. If marker or llama.cpp is missing, relay the install instruction
it prints and stop: the papers are in, and running this command again once it is
installed converts them.

## 6. Tell me

What arrived and was converted, what was flagged, what moved to Later or Declined. A
flagged paper stays `OK` with the reason in its **Why** cell — usually no open PDF: the
researcher saves it as `1_Literature/PDFs/<citekey>.pdf` and runs this again. End with:
run `/lit-cards-index`.
