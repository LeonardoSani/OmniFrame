# 1_Literature

Source comes in from the researcher; cards and syntheses go out from you.

## What is already here when you arrive

- `PDFs/<citekey>.pdf` — the paper as published. Gitignored. **Read-only.**
- `Papers/<citekey>/` — the same paper converted to markdown, together with the images
  extracted from it. Find the markdown by glob (`*.md`); the converter chose its name,
  so do not expect a fixed one. **Read-only.**
- `Human_encoding/` — the researcher's own handwritten notes, scanned. They often span
  several papers, follow no naming convention, and are not keyed to anything. You may
  list them so a human can find one. Nothing else: never rename, embed, cite, index, or
  infer a claim from a filename.

If a citekey has a PDF but no `Papers/` folder, the conversion has not happened yet —
say so and stop. Do not read the PDF in its place and do not invent the content.

### Formulas in that markdown are not reliable

The markdown comes out of an automatic PDF converter, so its maths is uneven. Some
equations arrive as clean LaTeX; others are flattened into HTML `<sup>`/`<sub>` tags, in
which a subscript and a superscript become indistinguishable — `<sup>W</sup>2σ(W1x)`
could be $W_2\sigma(W_1x)$ or something else. Tables and prose are dependable; formulas
are not, and the same document can contain both kinds.

So: **use the markdown to understand a paper, never as the source of a formula.** Do not
copy an equation out of it into a card, into `2_Idea/`, or into `5_Paper/`. Reconstructing
LaTeX from flattened markup means guessing at structure, and a symbol guessed wrong here
would travel into the notation, the preamble and the published paper.

When a formula genuinely has to be reproduced, say which one you need and ask — the PDF is
the authority, and the researcher reads it. Describing a paper's method in words, stating
what it optimises, or naming its assumptions needs no formula at all, and is almost always
what a card actually wants.

## What you produce

**`Cards/<citekey>.md`** — one card per paper, **schema-bound**. Its sections are exactly
the ones listed under `## Cards` in `card&outputs_def.md`: same sections, same order,
every time. Never add one, never drop one, never reorder. Fifty cards are only
comparable if they are identical in shape, and one edit to the brief must be able to
change every future card.

A card is short. One screen. If a section has nothing in it for this paper, write
`—` rather than padding it.

Every claim in a card is traceable to the converted markdown. Quote or point at the
section you took it from. A number the paper did not state does not belong in the card.

**`Literature_Outputs/<name>.md`** — the syntheses, **goal-bound**. Write only what
`## Outputs` in `card&outputs_def.md` commissions. The brief says what the document must
achieve; its shape, length and headings are yours to choose. If you think another output
is worth writing, propose it to the researcher — do not just add a file.

## Never edit `card&outputs_def.md`

It is the researcher's instrument for steering you. If it is ambiguous or you cannot
satisfy it, ask. Changing it yourself removes the one place where they set the terms.

## The direction of the area

The literature's job is to state the gap. `2_Idea/Setup & Method.md` is that gap,
formalised. An output that does not eventually sharpen the problem or position the
method is decoration.
