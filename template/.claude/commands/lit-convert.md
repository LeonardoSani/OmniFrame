---
description: Convert new paper PDFs to markdown and link each one in the paper index
---

Convert the papers that are in the library but not yet readable.

## 1. Convert

Run `research-convert` from the project root. It converts only PDFs that have no markdown,
so running it is always safe. It loads a large local model and can take minutes — say so
before starting.

If it fails because marker or llama.cpp is missing, relay the install instruction it
prints and stop. Do not try to read the PDFs in its place.

## 2. Update the index

In `1_Literature/Paper_Index.md`:

- every PDF in `1_Literature/PDFs/` with no row gets one under `## Unsorted` — a paper the
  researcher dropped in by hand — the same row `research-download` writes:
  `| <citekey> | <title> | <venue> | [pdf](PDFs/<citekey>.pdf) | — | pending |`.
  Take the title from the converted markdown; Venue is `—` if the paper does not state it.
- every converted paper gets its **Markdown** link:
  `[md](Papers/<citekey>/<file>)`, where `<file>` is the `"markdown"` field of
  `1_Literature/Papers/<citekey>/.conversion.json`.

Change nothing else in the index. Set `updated:` to today.

## 3. Tell me

What was converted, what failed, and which papers now wait for `/lit-cards`.
