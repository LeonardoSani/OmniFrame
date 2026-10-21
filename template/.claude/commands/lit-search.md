---
description: Propose papers for the project from 2_Idea/High_level.md — search only, nothing downloaded
argument-hint: [optional bias, e.g. "theory papers only, after 2020"]
---

Propose literature for this project, and bring in the anchor papers of `High_level.md`
the first time. Search only: nothing is downloaded, and nothing is written outside
`1_Literature/Proposed_literature.md`.

Bias from the researcher, may be empty: $ARGUMENTS

## 1. Read the idea

Read `2_Idea/High_level.md`. If it has no topic and no idea in it, **stop**: say so, and
offer to draft it together — ask about the topic, the idea and its motivation, anchor
papers, keywords, then show the draft and write it only once the researcher confirms.
Never search from a guess.

Later in a project, the rest of `2_Idea/` and the **Open** section of
`4_Results_and_Tracking/Where_we_are.md` often say more precisely what the reading now
needs: use them to sharpen the queries.

The bias steers this search only: kind of paper, period, venue, method family, what to
leave out. It tilts or narrows the idea; it does not replace it. If it contradicts
`High_level.md`, say so and ask which wins.

Never assume the researcher already knows the foundations. A paper is known only if it is
in the library or in `refs.bib` — nothing else, however standard it seems. If the bias
leaves out foundational work the idea rests on (a period that predates it, "no surveys",
one method family), search as asked anyway, and name those papers at the end (step 6).

## 2. Know what is already there

Collect every citekey and title already known, so nothing is proposed twice:

- `1_Literature/Paper_Index.md` — the library
- `5_Paper/refs.bib`
- `1_Literature/Proposed_literature.md` — the open proposals, `## Later`, `## Declined`

## 3. Bring in the anchor papers

The anchor papers are the researcher's choice — often given by a supervisor — and they
still have to be read, so each one comes into the library. The bias does not apply to them.
An anchor may be a title, a link, or just authors and a year: match it against step 2 by
title or by link.

For each anchor that matches nothing from step 2: find it online and confirm title, authors
and venue, with its official code and project page, as in step 4. Write its row by the
rules of step 5, with Decision `OK` and Why `anchor paper`. It does not count toward the
ten of step 4.

An anchor already in the library is done. One in `## Declined` stays there: say so. One you
cannot identify, or that matches several papers, does not go in: name it in step 6.

## 4. Search

Several queries, built from the keywords, the anchor papers and the bias. Semantic Scholar
(`api.semanticscholar.org`), arXiv, OpenReview, DBLP, and the web. Follow the references
and citations of the anchor papers — they are often better leads than keywords.

About 10 papers, unless the bias says otherwise. Fewer and right beats more and loose. Mix
what the project needs: foundational work, the closest prior work, recent work.

**Every paper is real and checked.** Open its page and confirm title, authors and venue.
Never propose a paper from memory: one you could not find a page for does not go in the
table. Then look for its official code (GitHub) and project page — linked from the paper,
its arXiv page or its authors — and open them.

## 5. Write the rows

Append them to the first table in `1_Literature/Proposed_literature.md`. Never touch an
existing row, never fill **Decision** — except `OK` on an anchor row (step 3).

- **Decision** — blank, except on an anchor row.
- **citekey** — `author2024keyword`, lowercase: first author's surname, year, one
  distinctive word of the title. Unique against everything collected in step 2.
- **Paper** — the title, exactly.
- **Venue** — as published, with year: `NeurIPS 2023`. `arXiv 2024` if only a preprint;
  if a preprint was later published, the venue.
- **Why** — one or two sentences: what in `High_level.md` this paper bears on, and its
  role — the foundation, a baseline, a rival approach, the benchmark. Not the abstract.
- **arXiv** — `[arXiv](https://arxiv.org/abs/<id>)` when the paper is on arXiv; else its
  page, as `[arXiv](…)`: `https://doi.org/<doi>`, its OpenReview forum, or the publisher
  page. Always filled. `omniframe download` finds the PDF and the BibTeX from it.
- **Code** — `[code](…)`, the official GitHub repository. Blank if there is none.
- **Site** — `[site](…)`, the official project page. Blank if there is none.

Code and Site are official only: linked from the paper, its arXiv page or its authors.
Never a third-party reimplementation.

Escape a `|` inside a title as `\|`. Set `updated:` to today.

## 6. Tell me

Which anchor papers came in, and any not found or declined. How many papers were
proposed, the queries run, how the bias shaped the result, and anything nearly included
and why it was not. Name any foundational paper the bias left out, e.g.
*"Left out by 'after 2020': `vaswani2017attention`, the foundation of this line of work —
want it proposed?"*. End with: mark **Decision** (`OK` or `NO`; unmarked rows wait in
`## Later`), then run `/lit-download`.
