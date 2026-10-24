---
description: Propose papers for the project from 3_Idea/High_level.md and Outline.md — search only, nothing downloaded
argument-hint: [optional bias, e.g. "theory papers only, after 2020"]
---

Propose literature for this project, and bring in the anchor papers of `High_level.md`
the first time. Search only: nothing is downloaded, and nothing is written outside
`1_Literature/Proposed_literature.md`.

Bias from the researcher, may be empty: $ARGUMENTS

## 1. Read the idea

Read `3_Idea/High_level.md`. If it has no topic and no idea in it, **stop**: say so, and
offer to draft it together, writing it only once the researcher confirms. Never search
from a guess.

Then read `3_Idea/Outline.md`. The goals of its steps say what the reading is for: search
for those. If it is empty, say so and offer to define it first. Search from `High_level.md`
alone only if the researcher wants to go on without it. Later in a project, the rest of `3_Idea/`, `2_Playground/Results_pg.md` and
the **Open** of the briefing often say more precisely what the reading needs.

The bias tilts or narrows this search; it does not replace the idea. If it contradicts
`High_level.md`, say so and ask which wins. A paper counts as known only if it is in the
library or in `refs.bib`: if the bias leaves out foundational work the idea rests on,
search as asked, and name that work at the end.

## 2. Know what is already there

Collect every citekey and title in `1_Literature/Paper_Index.md`, `6_Paper/refs.bib` and
`1_Literature/Proposed_literature.md` (all three lists), so nothing is proposed twice.

## 3. Bring in the anchor papers

The anchor papers are the researcher's choice, so each comes into the library; the bias
does not apply to them. Match each against step 2 by title or link. One that matches
nothing: confirm it online and write its row with Decision `OK` and Why `anchor paper`.
One already in the library is done; one in `## Declined` stays there; one you cannot
identify for sure does not go in. Say which in step 6.

## 4. Search

Search where the field publishes, and follow the references and citations of the anchor
papers. Mix what the project needs: foundations, the closest prior work, recent work.
Fewer and right beats more and loose.

**Every paper is real and checked**: open its page and confirm title, authors and venue.
One you could not find a page for does not go in. Look for its official code and project
page — linked from the paper, its arXiv page or its authors, never a reimplementation.

## 5. Write the rows

Append to the first table of `1_Literature/Proposed_literature.md`. Never touch an
existing row; leave **Decision** blank, except on an anchor row. `omniframe download`
reads these rows, so:

- **citekey** — `author2024keyword`, lowercase: first author's surname, year, a word of
  the title. Unique against step 2.
- **arXiv** — always filled: `[arXiv](https://arxiv.org/abs/<id>)`, or for a paper not on
  arXiv its DOI, OpenReview or publisher page in the same `[arXiv](…)` form. The PDF and
  the BibTeX are found from it.
- **Code**, **Site** — `[code](…)`, `[site](…)`, or blank.
- **Paper**, **Venue**, **Why** — the exact title; where it was published, with the year;
  in a sentence or two, what it brings to this idea.

Escape a `|` inside a cell as `\|`. Set `updated:` to today.

## 6. Tell me

The anchor papers in, or not and why; what was proposed and how the search went; any
foundational work the bias left out. End with: mark **Decision**, then run
`/lit-download`.
