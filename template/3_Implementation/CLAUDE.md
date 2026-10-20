# 3_Implementation

The concrete choices that make the idea runnable.

| File | Holds |
| ---- | ----- |
| `Specs.md` | the choices for each experiment: model, data, hyperparameters, seeds, compute… |
| `Figures.md` | what each figure should show |
| `Code_Design.md` | how `__CODE_DIR__/` is organised, including where data and results go |

When drawing a chart, load the `dataviz` skill before writing chart code.

## The code folder

`__CODE_DIR__/` holds the code and nothing else, because it will be exported alone into a
public repo. So:

- Nothing in it reads or writes a path outside it — no `../`, no absolute path, no brain
  content.
- Dependencies through `uv add`, run inside `__CODE_DIR__/`.
- Its `README.md` is public: what the code does, how to install and run it. Never a link
  into the brain.

Logs, seeds and metrics stay wherever the code writes them, as `Code_Design.md` decides,
or in a tracker such as W&B. When you quote a number in the brain, name the file or run
it comes from.
