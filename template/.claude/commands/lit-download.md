---
description: Bring papers into the library — the ones marked OK, or the ones linked — downloaded and converted
argument-hint: [paper links, e.g. https://arxiv.org/abs/2403.01234]
---

Bring papers into the library. Read `1_Literature/CLAUDE.md` first.

Links from the researcher, may be empty: $ARGUMENTS

## 1. Papers given by link

For each link: open the page and confirm title, authors and venue; look for the official
code and project page. Then append a row to the first table of
`1_Literature/Proposed_literature.md`, by the column rules of `/lit-search`, with Decision
`OK` (the researcher chose this paper by giving the link) and Why `added by link`. Skip a
paper already in `1_Literature/Paper_Index.md`, and say so. A link you cannot resolve to a
real paper does not go in.

## 2. Check the marks

Read the **Decision** column of `1_Literature/Proposed_literature.md`, in the proposals
table and in `## Later`. If no row is marked `OK` or `NO` and the proposals table is
empty, there is nothing to do: say so and stop. Apart from the rows of step 1,
**Decision** is the researcher's — never fill it in, never change a mark.

## 3. Download

Run `omniframe download` from the project root. It fetches each `OK` paper's open PDF and
its BibTeX, adds its row to `1_Literature/Paper_Index.md`, then resets the table: `NO`
rows go to `## Declined`, unmarked proposals to `## Later`. It writes every file itself —
do not edit them around it.

## 4. Convert

If at least one paper arrived, run `omniframe convert` from the project root. It converts
every PDF that has no markdown yet and links it in the index. It loads a large local model
and can take minutes — say so before starting. If marker or llama.cpp is missing, relay the
install instruction it prints and stop: the papers are in, and `/lit-convert` finishes the
job once it is installed.

## 5. Tell me

What arrived and was converted, what was flagged, what moved to Later or Declined. A
flagged paper stays `OK` with the reason in its **Why** cell — usually no open PDF: the
researcher saves it as `1_Literature/PDFs/<citekey>.pdf` and runs this again. End with:
run `/lit-cards-index`.
