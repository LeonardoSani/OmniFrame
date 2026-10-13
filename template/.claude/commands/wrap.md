---
description: Close out a research session — rewrite the briefing and check the brain holds together
---

Close out this session.

## 1. Rewrite the briefing

Rewrite `4_Results_and_Tracking/Where_we_are.md` so it describes the present. **Rewrite,
never append** — git holds the history, this file holds only now. Keep each section short
enough to take in at a glance.

- **Now** — what changed this session, folded into what was already true. Claims cite
  their evidence: a run record, a card, a section.
- **Why the plan looks like this** — only if a decision was actually taken. Leave it
  untouched otherwise; it holds reasoning that nothing else records.
- **Next** — the one to three moves that would genuinely happen next. Drop what got done.
  If something is blocked, say what blocks it rather than deleting it.
- **Open** — what is still undecided. Add anything this session raised and could not settle.

Set `updated:` to today. Leave `status:` alone.

If nothing of substance changed, say so and leave the file as it is.

## 2. Check the brain holds together

Two checks, with grep — do not read every file:

- every `E-id` in `4_Results_and_Tracking/Scenario_Tree.md` exists in
  `2_Idea/Experiments.md`, and every experiment appears as a node in the DAG
- every `1_Literature/Papers/<citekey>/` has a `1_Literature/Cards/<citekey>.md`

**Report what is wrong. Fix nothing.** Note anything found in `Open` so it is not lost.

(The deeper audit — cards matching `card&outputs_def.md` section for section, `refs.bib`
against the library — is a separate job. Run it when the brief changes, not every session.)

## 3. Tell me

A short summary: what you changed, what the checks found, and what is waiting next time.
