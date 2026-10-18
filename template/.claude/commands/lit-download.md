---
description: Bring the papers marked OK into the library — PDF, BibTeX, a row in the paper index
---

Download the papers the researcher accepted.

## 1. Check the marks

Read the **Keep** column of `1_Literature/Proposed_literature.md`, in the proposals table
and in `## Later`. If no row is marked `OK`, `LATER` or `NO`, say so and stop: there is
nothing to do until the researcher marks it. **Keep** is theirs — never fill it in, never
change a mark.

## 2. Download

Run `omniframe download` from the project root. It fetches each `OK` paper's PDF and
BibTeX, adds its row to `1_Literature/Paper_Index.md`, then resets the table: `LATER` rows
to `## Later`, `NO` rows to `## Declined`. It writes every file itself — do not edit them
around it.

## 3. Tell me

What arrived, and what was flagged. A flagged paper stays `OK` with the reason in its
**Why** cell — usually no open PDF: the researcher saves it as
`1_Literature/PDFs/<citekey>.pdf` and runs this again. End with: run `/lit-convert`.
