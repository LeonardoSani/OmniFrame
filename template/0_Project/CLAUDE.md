# 0_Project

The project itself: what it is about, the plan, where it stands, and how it got there.

| File | Holds |
| ---- | ----- |
| `High_level.md` | the idea in plain words: topic, motivation, anchor papers, keywords. `/lit-search` starts from it |
| `Outline.md` | the researcher's plan, written right after `High_level.md`: phases, their tasks, and the goal of each task |
| `Where_we_are.md` | the briefing: read first every session, rewritten by `/wrap` |
| `Journal.md` | the history: what was tried, decided, abandoned, and why |

**`High_level.md` and `Outline.md` are the researcher's: write there only when asked.**
When you do, keep their structure and voice, and do not soften a claim into a hedge.

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
into experiments, they get E-ids in `3_Method/Experiments.md`.

## `Where_we_are.md` — the briefing

Read first every session, so keep it short: about twenty lines. **Now** (what stands,
what is running), **Next** (the one to three moves that would happen if work resumed
now), **Open** (what is undecided, and what would decide it). Cite rather than restate.
Rewrite it, never append: it describes only the present. It covers the whole project, and
follows the phases of `Outline.md`: say which phase and task the work is on. Until the
outline exists, writing it is the first Next.

## `Journal.md` — the history

Dated entries, `## YYYY-MM-DD`, added at the bottom. What was tried, decided, abandoned,
and why — the reasoning the briefing drops. `/wrap` adds one per session; the researcher
also writes entries and notes of their own, in any form. Never edit or remove an existing
entry.
