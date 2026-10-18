# 1_Literature

Papers come in, cards and syntheses go out.

## `Paper_Index.md`

The way into any paper — see *Finding a paper* in the root `CLAUDE.md`. It holds no
analysis — it lists and groups. Rows sit under `## <group>` headings by the criterion named
on its `Grouping:` line, which the researcher chooses (empty until then); papers not yet
carded wait under `## Unsorted`. Never change the criterion or regroup filed papers
without asking.

How a row fills in:

| Column | Filled by | When |
| ------ | --------- | ---- |
| citekey, Title, Venue, arXiv, Code, Site, PDF | `omniframe download`, copied from the proposal; `/lit-convert` / `/lit-cards` for a PDF dropped in by hand, links blank | the PDF exists |
| Markdown | `/lit-convert` (or `/lit-cards`, after a terminal `omniframe convert`), from `Papers/<citekey>/.conversion.json` | after conversion |
| Card | `/lit-cards` | the card is written, and the paper moves to its group |

## How papers arrive

`2_Idea/High_level.md` → `/lit-search` proposes papers into `Proposed_literature.md` → the
researcher marks **Decision** → `/lit-download` (`omniframe download`) fetches the OK ones → `/lit-convert`.

`Proposed_literature.md` holds three things: the open proposals, `## Later` (papers
deferred, kept across searches) and `## Declined` (never propose these again; one
``- `citekey` — title`` line each, and deleting a line lets the paper back in). You fill
every column of a proposal except **Decision** — that one is the researcher's, and you never
write in it. The column rules are in `/lit-search`. What `omniframe download` does with each mark:

| Decision | |
| ---- | - |
| `OK` | downloaded: PDF, BibTeX, a row in the index |
| `LATER` | moved to `## Later` |
| `NO` | its citekey goes to `## Declined` |
| blank | dropped; a later search may propose it again |

Every proposed paper is one whose page you opened: title, authors and venue
confirmed. A paper you remember but cannot find does not go in.

## What is already here when you arrive

- `PDFs/<citekey>.pdf` — the paper as published. Gitignored. Added to by
  `omniframe download` or the researcher (hard rule 3).
- `Papers/<citekey>/` — the same paper converted to markdown, together with the images
  extracted from it, and `.conversion.json` recording how. Read-only.
- `Human_encoding/` — the researcher's own handwritten notes, scanned (hard rule 2). Scans
  sit in the folder; `Human_encoding/Human_encoding.md` is their hub, organised as the
  researcher likes, linking note files in `Human_encoding/Notes/<name>.md` that embed the
  scans as `![](../scan.pdf)`. Notes often span several papers and are not keyed to any.

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

## Never edit `card&outputs_def.md` unasked

It is the researcher's instrument for steering you. If it is ambiguous or you cannot
satisfy it, ask. Changing it on your own removes the one place where they set the terms.

## The direction of the area

The literature's job is to state the gap. `2_Idea/Setup_and_Method.md` is that gap,
formalised. An output that does not eventually sharpen the problem or position the
method is decoration.
