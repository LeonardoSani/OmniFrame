---
description: Close out a research session — rewrite the briefing, add a journal entry, quick checks
---

Close out this session. The rules for both files are in
`4_Results_and_Tracking/CLAUDE.md`.

## 1. Rewrite the briefing

Rewrite `4_Results_and_Tracking/Where_we_are.md` so it describes the present:

- **Now** — fold what changed this session into what was already true.
- **Next** — drop what got done. Keep what is blocked, saying what blocks it.
- **Open** — add anything this session raised and could not settle.

## 2. Add a journal entry

Append a `## YYYY-MM-DD` entry (today) at the bottom of
`4_Results_and_Tracking/Journal.md`: what was tried, decided or abandoned this session, and
why. A few lines; the reasoning, not a list of edited files. Leave every earlier entry,
including the researcher's own, as it is.

If nothing of substance happened, say so and skip both steps.

## 3. Quick checks

With grep, not by reading every file. **Report what is wrong, fix nothing:**

- a `1_Literature/PDFs/<citekey>.pdf` with no row in `1_Literature/Paper_Index.md` — added
  by hand: suggest `/lit-convert`
- a `1_Literature/Papers/<citekey>/` with no card — suggest `/lit-cards-index`
- an E-id in `4_Results_and_Tracking/Scenario_Tree.md` missing from `2_Idea/Experiments.md`

## 4. Tell me

A short summary: what changed, what the checks found, what is waiting next time.
