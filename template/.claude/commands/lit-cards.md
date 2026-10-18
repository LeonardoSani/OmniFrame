---
description: Write the missing paper cards, then file each paper in its group in the index
argument-hint: [citekeys, default every converted paper without a card]
---

Write cards. Read `1_Literature/CLAUDE.md` first — it defines what a card is.

Citekeys asked for, may be empty: $ARGUMENTS

## 1. The brief

Read `## Cards` in `1_Literature/card&outputs_def.md`. If the file is still
`status: empty`, the sections there are an untouched starter set: **stop and fill the
brief with the researcher first.** Ask what this project needs from every paper — offer
the starter sections as options, ask what to drop, rename or add — then show the drafted
`## Cards` and write it only once they confirm. Cards written to a guessed brief would
all have to be redone.

## 2. Which papers

First, any PDF in `1_Literature/PDFs/` with no row in `1_Literature/Paper_Index.md` — one
dropped in by hand and converted from the terminal — gets a row under `## Unsorted`, the
same row `omniframe download` writes:
`| <citekey> | <title> | <venue> |  |  |  | [pdf](PDFs/<citekey>.pdf) | — | pending |`.

Then: every citekey asked for, or by default every paper in the index whose Card is not
yet a `[card](…)` link. A paper whose **Markdown** is `—` may have been converted from the
terminal, which does not touch the index: if `1_Literature/Papers/<citekey>/.conversion.json`
exists, fill the link from its `"markdown"` field and go on. If it does not, the paper
is not converted: list it, say "run `/lit-convert`", and skip it.

## 3. Write the cards

One `1_Literature/Cards/<citekey>.md` per paper, reading it through its Markdown link in
the index. Exactly the sections of `## Cards`, in order — the rules in
`1_Literature/CLAUDE.md` hold: one screen, `—` for an empty section, every claim traceable
to the markdown, no formula copied out of it.

## 4. File them in the index

In `1_Literature/Paper_Index.md`, set each new card's **Card** link: `[card](Cards/<citekey>.md)`.

Then group, by `## Grouping` in `1_Literature/card&outputs_def.md`. If that section is
missing but the index still has a filled `Grouping:` line (a project made before the
section existed), offer to move the criterion into the brief, and delete the line once
the researcher agrees. If the section is empty, propose three or four criteria that fit
this library — by approach family, by role toward our idea, by problem setting,
chronologically, or another the cards suggest — each with a preview of the groups it
would produce. Ask the researcher to pick, show the drafted `## Grouping`, and write it
only once they confirm.

Move each newly carded paper from `## Unsorted` into a `## <group>` section with the same
table. A paper that fits no existing group: ask — a new group, or a better criterion?
Never regroup papers already filed without asking.

Set `updated:` to today.

## 5. Tell me

The cards written, where each paper was filed, and anything skipped.
