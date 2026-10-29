# 6_Paper

Self-contained LaTeX. Zip the *contents* of this folder — not the folder — and upload to
Overleaf: `main.tex` must sit at the archive root. No compiler is expected locally.

Everything the document needs lives in here. Never `\input` or `\includegraphics` a path
outside this folder: it would compile for you and break the moment it is uploaded.

## Figures

Figures the paper uses are copied from the code folder into `figures/`, named
descriptively (`encoder-overview.pdf`, with `\label{fig:encoder-overview}`). LaTeX numbers
them in document order; nothing in `4_Implementation/Figures.md` imposes a number.

## Underscores

Brain paths contain underscores (`3_Method/Setup_and_Method.md`) and LaTeX treats `_` as a
subscript marker: unescaped in text mode it fails with *Missing $ inserted*. Write
`\texttt{3\_Method/Setup\_and\_Method.md}` when you name a path in prose. Comments after `%`
and maths mode are exempt. The same applies to `\title{}` if the project name has an
underscore.

## Citations

`refs.bib` keys for papers in the library are their citekeys. Cite-only entries —
datasets, software, books — may be added to `refs.bib` directly. Never cite a work whose
page you have not found.

## Notation and claims

`preamble.tex` holds macros for the notation in `3_Method/Setup_and_Method.md`; keep the two
in step. The paper explains the idea at more length for a reader who has not seen the
brain. If writing it shows a claim should change, say so: the researcher decides whether
`3_Method/` follows.
