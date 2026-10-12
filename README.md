# ai-research-template

The structure every AI research project of mine starts from — LLM wiki, code, and
LaTeX in one place — plus the two scripts that put it on disk.

```
bin/research-init   copies template/ into a project, substituting tokens
bin/research-link   points ~/.local/bin/research-init at this clone
template/           the structure itself. edit these as normal files.
```

## Starting a project

```sh
mkdir ~/Projects/MYPROJ && cd ~/Projects/MYPROJ
uv init
research-init
```

`research-init` clones this repo to a temp dir, copies everything in `template/`
into the current folder, and substitutes the tokens below. Files that already
exist are **skipped**, so what `uv init` wrote (`pyproject.toml`,
`.python-version`) survives untouched. `--force` overwrites them instead.

Useful flags:

```sh
research-init --dry-run                      # see the plan, write nothing
research-init --name "MINO Evaluation Suite" # prettier title than the folder name
research-init --repo ~/Projects/ai-research-template   # test local edits
```

## Tokens

Replaced in file contents *and* in file/directory names, so
`template/src/__PKG__/` becomes `src/myproj/`.

| token | value | source |
|---|---|---|
| `__PROJECT_NAME__` | `MINO-EVAL` | the project folder's name, or `--name` |
| `__PKG__` | `mino_eval` | `name` in `pyproject.toml`, dashes → underscores |
| `__SLUG__` | `mino-eval` | lowercased, url-safe |
| `__AUTHOR__` | `Leonardo Sani` | `git config user.name`, or `--author` |
| `__YEAR__` | `2026` | today |
| `__DATE__` | `2026-10-12` | today |

Tokens are optional — use them only where they save typing. A `template/` with
none in it is copied verbatim. `.gitkeep` and `.DS_Store` are never copied.

## On a new machine

```sh
git clone https://github.com/LeonardoSani/ai-research-template.git ~/Projects/ai-research-template
~/Projects/ai-research-template/bin/research-link
```

`research-link` creates `~/.local/bin/research-init` as a symlink to
`bin/research-init` in the clone — so the file on `PATH` and the file in git are
the same bytes, and editing the script is just editing a tracked file.

It is idempotent and self-checking: run it any time to confirm the link is
right, or `research-link --check` to verify without changing anything (exit 1
if the link is missing, dangling, or pointing at another clone). Add `--force`
when a real file, not a symlink, is sitting in the way.

## Two speeds of propagation

Both halves live in this one repo, but they reach a project differently:

- **`template/` is cloned at run time** — push a structure change and the next
  `research-init`, on any machine, already uses it.
- **the scripts run from the local clone** — a script change needs a `git pull`
  on that machine before it takes effect.
