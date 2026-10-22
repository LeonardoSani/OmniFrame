# 2_Playground

The stage before the idea is fixed: understanding the literature and its code,
reproducing anchor-paper results, small proof-of-concept experiments. It runs side by side
with `3_Idea/`, and what it teaches may change the idea. Free form: no E-ids needed, no
structure to impose.

| File | Holds |
| ---- | ----- |
| `Code_Design.md` | how `__PLAY_DIR__/` is organised |
| `Results.md` | what the playground taught: what helps define the idea, the method, the experiments |

## The playground code

`__PLAY_DIR__/` is a uv project of its own, beside `__CODE_DIR__/`: its own environment,
for packages and repos that are not meant for the final code. `uv add` and `uv run` inside
it.

- A paper's repo cloned into it loses its `.git`: the brain is the one repo. Note its
  source URL and commit in `Code_Design.md`.
- Large data and checkpoints go in its `.gitignore`.
- It may read anything. `__CODE_DIR__/` never imports from or points into it: code worth
  keeping is rewritten there.

## `Results.md`

Hard rule 1 applies: each finding names the run or log it comes from. A failed
reproduction is a finding. Write what it means for the idea, not only the number.
