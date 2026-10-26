# 3_Idea

The idea, from plain words to formal. **These are the researcher's claims: write here
only when asked.** When you do, keep their structure and voice, and do not soften a claim
into a hedge.

| File | Holds |
| ---- | ----- |
| `High_level.md` | the idea in plain words: topic, motivation, anchor papers, keywords. `/lit-search` starts from it |
| `Outline.md` | the researcher's plan, written right after `High_level.md`: phases, their tasks, and the goal of each task |
| `Setup_and_Method.md` | the idea made formal: notation, problem, method, hypotheses. Headings are a suggestion |
| `Experiments.md` | what each experiment is for, under its E-id |

A useful test, not a rule: if something could be chosen differently without changing the
idea, it is probably a spec and fits better in `4_Implementation/`.

`6_Paper/preamble.tex` mirrors the notation here; when a symbol changes, say so.

## The outline

`Outline.md` comes right after `High_level.md`, before the reading and the playground. It
is the phases of the work, in order. Each phase holds its tasks, one or more; each task has
a short description and a goal, meaning what the task should produce or settle. "Read the
literature" is not a goal; "read the literature to learn how the effect is measured: which
metrics, which baselines" is. How precise a goal is, is the researcher's call: precise when
they know what the task must produce, general when they do not yet have the context to be
sure. The same holds for whole phases: the near ones are specified, task by task; the far
ones may stay a name, and are filled in as the work gets close. These goals say what the
reading, the playground and the experiments are for: `/lit-search` searches for them, and
the briefing follows the phases.

`High_level.md` may hold a more general outline, or none. `Outline.md` is the proper
outline: it specifies the plan, the nearer phases better. Both stay, at different levels of
detail; that is not a disagreement. If `High_level.md` holds a general outline, its steps
become the phases; if it holds none, `Outline.md` defines them. The two must agree on the
phases: when they do not, say so, ask which holds, and align the other once the researcher
answers.

Asked to draft, refine or evaluate the outline, work in chat, in this shape, and write only
what the researcher confirms: challenge a task with no goal; suggest a sharper goal where
you see one, but do not push precision the researcher does not have yet. As tasks turn
into experiments, they get E-ids in `Experiments.md`.

## Handwritten notes

`Human_encoding/` holds the researcher's scanned notes on the idea, organised from
`Human_encoding/Human_encoding.md`, with notes in `Human_encoding/Notes/` that embed the
scans. Read a note when the researcher points you to it. Asked, you may create a note or
add embeds for scans they name.
