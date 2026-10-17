---
description: Propose papers for the project from 2_Idea/High_level.md — search only, nothing downloaded
argument-hint: [optional bias, e.g. "theory papers only, after 2020"]
---

Propose literature for this project. Search only: nothing is downloaded, and nothing is
written outside `1_Literature/Proposed_literature.md`.

Bias from the researcher, may be empty: $ARGUMENTS

## 1. Read the idea

Read `2_Idea/High_level.md`. If it is still `status: empty`, or has no topic and no idea
in it, **stop**: say so, and offer to draft it together — ask about the topic, the idea,
what is in and out of scope, anchor papers, keywords, then show the draft and write it
only once the researcher confirms. Never search from a guess.

The bias steers this search only: kind of paper, period, venue, method family, what to
leave out. It tilts or narrows the idea; it does not replace it. If it contradicts
`High_level.md`, say so and ask which wins.

Never assume the researcher already knows the foundations. A paper is known only if it is
in the library, in `refs.bib`, or among the anchor papers (step 2) — nothing else, however
standard it seems. If the bias would leave out foundational work the idea rests on (a
period that predates it, "no surveys", one method family), name those papers and **ask
before searching** whether to include them despite the bias. If the bias is empty, or
cuts nothing foundational, go on without asking.

## 2. Know what is already there

Collect every citekey and title already known, so nothing is proposed twice:

- `1_Literature/Paper_Index.md` — the library
- `5_Paper/refs.bib`
- `1_Literature/Proposed_literature.md` — the open proposals, `## Later`, `## Declined`

## 3. Search

Several queries, built from the keywords, the anchor papers and the bias. Semantic Scholar
(`api.semanticscholar.org`), arXiv, OpenReview, DBLP, and the web. Follow the references
and citations of the anchor papers — they are often better leads than keywords.

About 10 papers, unless the bias says otherwise. Fewer and right beats more and loose. Mix
what the project needs: foundational work, the closest prior work, recent work.
Foundations the researcher chose in step 1 to keep go in even where the bias would
exclude them; their **Why** says so.

**Every paper is real and checked.** Open its page and confirm title, authors and venue.
Never propose a paper from memory: one you could not find a page for does not go in the
table. Then look for an open PDF — arXiv, OpenReview, or `openAccessPdf` from Semantic
Scholar — and confirm the URL points at the PDF itself.

## 4. Write the rows

Append them to the first table in `1_Literature/Proposed_literature.md`. Never touch an
existing row, never fill **Keep**.

- **Keep** — blank. Always.
- **citekey** — `author2024keyword`, lowercase: first author's surname, year, one
  distinctive word of the title. Unique against everything collected in step 2.
- **Paper** — the title, exactly.
- **Venue** — as published, with year: `NeurIPS 2023`. `arXiv 2024` if only a preprint;
  if a preprint was later published, the venue.
- **Why** — one or two sentences: what in `High_level.md` this paper bears on, and its
  role — the foundation, a baseline, a rival approach, the benchmark. Not the abstract.
- **Link** — the paper's identity, as a URL: `https://doi.org/<doi>` when it has a DOI,
  else `https://arxiv.org/abs/<id>`, else its OpenReview or publisher page.
  `research-download` takes the BibTeX from it.
- **PDF** — the direct open-access PDF URL, or `—` if there is none.

Escape a `|` inside a title as `\|`. Set `updated:` to today.

## 5. Tell me

How many papers were added, the queries run, how the bias shaped the result, and anything
nearly included and why it was not. End with: mark **Keep**, then run `/lit-download` (or `research-download` in the terminal).
