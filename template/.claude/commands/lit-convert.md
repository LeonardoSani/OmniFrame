---
description: Bring in any PDF added by hand, and convert the papers not converted yet
---

Convert the papers that are in the library but not yet readable. Read
`1_Literature/CLAUDE.md` first.

## 1. PDFs added by hand

List the PDFs in `1_Literature/PDFs/` whose citekey has no row in
`1_Literature/Paper_Index.md`. Each one was saved there by the researcher, with no
proposal. If there are none, go to step 2. For each one:

1. **Identify it.** Read its first page — only for title, authors and venue, not as a
   substitute for the conversion. Find the paper online and confirm it, as `/lit-search`
   does: its page, and its official code and project page if any. If it cannot be
   identified, say so and leave it for the researcher.
2. **Ask the researcher**, for all of them at once, whether each may be renamed to its
   citekey, `author2024keyword` (see `/lit-search`), when its file name is not one
   already: `attention.pdf` → `vaswani2017attention.pdf`. Renaming is the only change to
   `PDFs/` allowed, and only with this permission. If the researcher refuses, the file
   name stays the citekey.
3. **Write its proposal row** at the end of the first table of
   `1_Literature/Proposed_literature.md`, by the column rules of `/lit-search` — with
   Decision `OK` (the researcher chose this paper by adding it) and Why `added by hand`.

Then run `omniframe download` from the project root. It finds each PDF already in place,
so it fetches nothing but the BibTeX, and writes the index row under `## Unsorted`.

## 2. Convert

Run `omniframe convert` from the project root. It converts every PDF that has no
markdown, then writes the Markdown link into the index row of each converted paper. It
loads a large local model and can take minutes — say so before starting.

If it fails because marker or llama.cpp is missing, relay the install instruction it
prints and stop: the papers stay unconverted until it is installed.

## 3. Tell me

What was added by hand, what was converted, what failed, and which papers now wait for
`/lit-cards-index`.
