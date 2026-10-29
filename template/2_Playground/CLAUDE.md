# 2_Playground

Understanding before the idea is fixed: exploring a paper's code, reproducing its results,
small proof-of-concept tests. What it teaches may change the idea. Free form.

| File | Holds |
| ---- | ----- |
| `Experiments_pg.md` | the playground experiments and what each is for |
| `Code_Design_pg.md` | how `__PLAY_DIR__/` is organised |
| `Results_pg.md` | what the playground taught, for the idea, the method, the experiments |

Playground experiments get no E-ids: those belong to `3_Method/Experiments.md`. One that
grows into a real experiment gets its E-id there.

## The playground code

`__PLAY_DIR__/` is a uv project of its own, for packages and repos not meant for the final
code; `uv add` and `uv run` inside it.

- A repo cloned into it loses its `.git`: the brain is the one repo. Note where it came
  from (URL, commit) in `Code_Design_pg.md`.
- Large data and checkpoints go in its `.gitignore`.
- `__CODE_DIR__/` never imports from it or points into it: code worth keeping is rewritten
  there.
