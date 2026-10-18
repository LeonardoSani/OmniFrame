---
description: Close out a research session — rewrite the briefing and check the brain holds together
---

Close out this session.

## 1. Rewrite the briefing

Rewrite `4_Results_and_Tracking/Where_we_are.md` so it describes the present. Its shape
and rules are in `4_Results_and_Tracking/CLAUDE.md` — read that section first. For this
session:

- **Now** — fold what changed this session into what was already true.
- **Next** — drop what got done. Keep what is blocked, saying what blocks it.
- **Open** — add anything this session raised and could not settle.

Set `updated:` to today, and `status: filled` if it was still `empty`.

If nothing of substance changed, say so and leave the file as it is.

## 2. Check the brain holds together

Four checks, with grep — do not read every file:

- every `E-id` in `4_Results_and_Tracking/Scenario_Tree.md` exists in
  `2_Idea/Experiments.md`, and every experiment appears as a node in the DAG
- every `1_Literature/Papers/<citekey>/` has a `1_Literature/Cards/<citekey>.md`
- every `1_Literature/PDFs/<citekey>.pdf` has a row in `1_Literature/Paper_Index.md` —
  one without was added by hand: suggest `/lit-convert`
- every document still `status: empty` has nothing under its headings — the researcher
  may have filled one by hand

**Report what is wrong. Fix nothing** — except a document found filled under
`status: empty`: ask the researcher whether to mark it `filled`, and do so if they agree.
Note anything else found in `Open` so it is not lost.

(The deeper audit — cards matching `card&outputs_def.md` section for section, `refs.bib`
against the library — is a separate job. Run it when the brief changes, not every session.)

## 3. Tell me

A short summary: what you changed, what the checks found, and what is waiting next time.
