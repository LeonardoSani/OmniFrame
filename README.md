# ai-research-template

The structure every AI research project of mine starts from — literature, the formal
idea, implementation, results and the LaTeX paper in one place — plus the scripts that
put it on disk and keep it fed.

```
bin/research-init     copies template/ into a project, substituting tokens
bin/research-convert  converts newly dropped paper PDFs into markdown
bin/research-link     points ~/.local/bin at the scripts in this clone
template/             the structure itself. edit these as normal files.
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

## Converting papers

Drop a paper in as `1 Literature/PDFs/<citekey>.pdf`, then from anywhere in the project:

```sh
research-convert            # converts every PDF with no markdown yet
research-convert --list     # what is converted, what is new
research-convert --dry-run  # say what would happen
```

It writes `1 Literature/Papers/<citekey>/` — markdown plus the images extracted from
the paper — which is what the brain reads. Already-converted papers are skipped, so
re-running is always safe.

The backend is [marker](https://github.com/datalab-to/marker), installed separately:

```sh
uv tool install marker-pdf    # pulls torch, so expect a large download
```

Marker fetches its model weights once on first use and caches them. Conversion runs as
a single batch process, so the models load once however many papers are queued.
`--use-llm` lets marker call an LLM to clean up inline maths and tables; that costs
money unless it is pointed at a local Ollama.

This command is deliberately outside the brain: no `CLAUDE.md` mentions it, and the
agent neither runs it nor needs to know it exists.

## Tokens

Replaced in file contents *and* in file/directory names, so a template path containing
`__PKG__` lands with the real package name in it.

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

`research-link` symlinks each script in `bin/` into `~/.local/bin` — so the file on
`PATH` and the file in git are the same bytes, and editing a script is just editing a
tracked file.

It is idempotent and self-checking: run it any time to confirm the link is
right, or `research-link --check` to verify without changing anything (exit 1 if any
link is missing, dangling, or pointing at another clone). Add `--force` when a real
file, not a symlink, is sitting in the way.

## Two speeds of propagation

Both halves live in this one repo, but they reach a project differently:

- **`template/` is cloned at run time** — push a structure change and the next
  `research-init`, on any machine, already uses it.
- **the scripts run from the local clone** — a script change needs a `git pull`
  on that machine before it takes effect.
