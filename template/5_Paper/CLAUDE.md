# 5_Paper

Self-contained LaTeX. Zip the *contents* of this folder — not the folder — and upload to
Overleaf: `main.tex` must sit at the archive root. No compiler is expected locally.

Everything the document needs lives in here. Never `\input` or `\includegraphics` a path
outside this folder: it would compile for you and break the moment it is uploaded.

## Figures have their own indexing here

Files in `figures/` are named descriptively (`encoder-overview.pdf`, not `F03.pdf`) and
carry their own `\label{fig:encoder-overview}`. LaTeX numbers them in document order.

The ids in `3_Implementation/Figures.md` are **not** imposed on them. Figures get
created, merged, dropped and reordered while writing, and sharing an id scheme across the
two areas would only create a second thing to keep in sync. The link between a figure and
its spec is its name and its caption, not a number.

## Underscores

Brain paths contain underscores (`2_Idea/Setup_and_Method.md`) and LaTeX treats `_` as a
subscript marker: unescaped in text mode it fails to compile with *Missing $ inserted*.
Write `\texttt{2\_Idea/Setup\_and\_Method.md}` whenever you name a path in prose. Comments
after `%` are exempt, and so is anything already inside maths mode.

The same applies to `\title{}` if the project folder's own name has an underscore — check
it compiles before trusting it.

## Citations

`refs.bib` keys are the project citekeys, identical to `1_Literature/`. A `\cite` whose
key has no card is a citation of something nobody read — do not add it.

## Notation

`preamble.tex` holds macros mirroring `## Notation` in `2_Idea/Setup_and_Method.md`. Change
a symbol there and change the macro here. Never introduce a notation in the paper that
the method section of the brain does not define.

## Prose

The paper is written for a reader who has not read the brain. That is the one place where
expanding on `2_Idea/`'s compressed formalisation is correct rather than padding — but
the claims must not drift from it. If writing the paper makes you want to change a claim,
that change belongs in `2_Idea/` first.
