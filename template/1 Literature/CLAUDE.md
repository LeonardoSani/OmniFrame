# 1 Literature

Source comes in from the researcher; cards and syntheses go out from you.

## What is already here when you arrive

- `PDFs/<citekey>.pdf` — the paper as published. Gitignored. **Read-only.**
- `Papers/<citekey>/` — the same paper converted to markdown, together with the images
  extracted from it. Find the markdown by glob (`*.md`); the converter chose its name,
  so do not expect a fixed one. **Read-only.**
- `Human encoding/` — the researcher's own handwritten notes, scanned. They often span
  several papers, follow no naming convention, and are not keyed to anything. You may
  list them so a human can find one. Nothing else: never rename, embed, cite, index, or
  infer a claim from a filename.

If a citekey has a PDF but no `Papers/` folder, the conversion has not happened yet —
say so and stop. Do not read the PDF in its place and do not invent the content.

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

**`Literature Outputs/<name>.md`** — the syntheses, **goal-bound**. Write only what
`## Outputs` in `card&outputs_def.md` commissions. The brief says what the document must
achieve; its shape, length and headings are yours to choose. If you think another output
is worth writing, propose it to the researcher — do not just add a file.

## Never edit `card&outputs_def.md`

It is the researcher's instrument for steering you. If it is ambiguous or you cannot
satisfy it, ask. Changing it yourself removes the one place where they set the terms.

## The direction of the area

The literature's job is to state the gap. `2 Idea/Setup & Method.md` is that gap,
formalised. An output that does not eventually sharpen the problem or position the
method is decoration.
