---
description: Write the missing paper cards, then file each paper in a group of the index
argument-hint: [citekeys] ["focus", e.g. "assumptions and benchmarks"]
---

Write cards. Read `1_Literature/CLAUDE.md` first.

Citekeys and focus, may be empty: $ARGUMENTS

## 1. Which papers

Every citekey asked for, or by default every paper in `1_Literature/Paper_Index.md` whose
Card is not yet a `[card](…)` link. A paper whose **Markdown** is still `—` is not
converted: list it, say "run `/lit-convert`", and skip it.

## 2. Write the cards

One `1_Literature/Cards/<citekey>.md` per paper, read through its Markdown link. With no
focus given, the default card of `1_Literature/CLAUDE.md`; with a focus, shape the card
around it.

## 3. File them in the index

Set each new card's **Card** link, `[card](Cards/<citekey>.md)`, and move the paper's row
from `## Unsorted` to a `## <group>` section with the same table.

- **Groups exist:** file each paper in the one that fits. If none fits, ask: a new group,
  or regroup?
- **No groups yet:** propose three or four ways to group this library — by approach
  family, by role toward the idea, by problem setting, or whatever the cards suggest —
  each with a preview of the groups it gives, and say the researcher can name their own.
  Create the headings they choose.

Never regroup papers already filed without asking. Set `updated:` to today.

## 4. Tell me

The cards written, where each paper was filed, and anything skipped.
