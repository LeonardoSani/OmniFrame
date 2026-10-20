# 4_Results_and_Tracking

What came back, what it means, and where the work stands.

## `Where_we_are.md` — the briefing

Read first every session, so keep it short: about twenty lines. **Now** (what stands,
what is running), **Next** (the one to three moves that would happen if work resumed
now), **Open** (what is undecided, and what would decide it). Cite rather than restate.
Rewrite it, never append: it describes only the present.

## `Journal.md` — the history

Dated entries, `## YYYY-MM-DD`, added at the bottom. What was tried, decided, abandoned,
and why — the reasoning the briefing drops. `/wrap` adds one per session; the researcher
also writes entries and notes of their own, in any form. Never edit or remove an existing
entry.

## `Results.md`

The analysis: what the experiments showed, in whatever shape fits. Every number names its
source (a log, an output, a tracker run). A refuted hypothesis is a finding: record it as
one, and never bend a result toward the method.

## `Scenario_Tree.md`

A mermaid diagram of how experiments depend on each other, and what can run now. A
convention that helps: a plain edge `E02 --> E03` when E03 just needs E02 done, a labelled
edge `E02 -->|"metric ≥ t"| E04` when E04 only makes sense on that outcome. Mark an
experiment that became pointless as dropped rather than deleting it.
