# 3_Idea

The idea, from plain words to formal. **These are the researcher's claims: write here
only when asked.** When you do, keep their structure and voice, and do not soften a claim
into a hedge.

| File | Holds |
| ---- | ----- |
| `High_level.md` | the idea in plain words: topic, motivation, anchor papers, keywords. `/lit-search` starts from it |
| `Outline.md` | the researcher's plan, written right after `High_level.md`: the steps, and the goal of each. Any shape |
| `Setup_and_Method.md` | the idea made formal: notation, problem, method, hypotheses. Headings are a suggestion |
| `Experiments.md` | what each experiment is for, under its E-id |

A useful test, not a rule: if something could be chosen differently without changing the
idea, it is probably a spec and fits better in `4_Implementation/`.

`6_Paper/preamble.tex` mirrors the notation here; when a symbol changes, say so.

## The outline

`Outline.md` comes right after `High_level.md`, before the reading and the playground: the
steps of the work, each with its goal, meaning what the step should produce or settle. "Read
the literature" is not a goal; "read the literature to learn how the effect is measured:
which metrics, which baselines" is. These goals say what the reading, the playground and
the experiments are for: `/lit-search` searches for them, and the briefing follows the
steps.

If `High_level.md` holds a rough outline, `Outline.md` gives each of its steps a goal; if it
holds none, `Outline.md` defines the steps. When the two disagree, say so and ask which
holds. Asked to draft, refine or evaluate it, work in chat and write only what the
researcher confirms: challenge a step with no goal, or a goal with no output that would
show it is reached. As steps turn into experiments, they get E-ids in `Experiments.md`.

## Handwritten notes

`Human_encoding/` holds the researcher's scanned notes on the idea, organised from
`Human_encoding/Human_encoding.md`, with notes in `Human_encoding/Notes/` that embed the
scans. Read a note when the researcher points you to it. Asked, you may create a note or
add embeds for scans they name.
