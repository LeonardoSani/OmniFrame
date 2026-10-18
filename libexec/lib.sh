# lib.sh -- what `omniframe init` and `omniframe update` share. Sourced, not run;
# the caller defines die() and info(). Written for bash 3.2 (macOS's own).

TEMPLATE_REPO="${OMNIFRAME_TEMPLATE_REPO:-https://github.com/LeonardoSani/OmniFrame.git}"
TEMPLATE_REF="${OMNIFRAME_TEMPLATE_REF:-main}"
TEMPLATE_SUBDIR="${OMNIFRAME_TEMPLATE_SUBDIR:-template}"

# the record a project keeps of its tokens and of what the template installed
RECORD=".omniframe"

slugify() {
  printf '%s' "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | sed -e 's/[^a-z0-9]\{1,\}/-/g' -e 's/^-//' -e 's/-$//'
}

# set T_* from a project name, a code folder name, an author and a start date
set_tokens() {
  T_PROJECT_NAME="$1"
  T_CODE_DIR="$2"
  T_SLUG="$(slugify "$1")"
  [[ -n "$T_SLUG" ]] || die "could not derive a slug from '$1'; pass --name"
  T_PKG="$(printf '%s' "${3:-$T_SLUG}" | tr '[:upper:]-' '[:lower:]_')"
  T_AUTHOR="$4"
  T_DATE="$5"
  T_YEAR="${5%%-*}"
  export T_PROJECT_NAME T_CODE_DIR T_SLUG T_PKG T_AUTHOR T_YEAR T_DATE
}

expand_path() {
  local p="$1"
  p="${p//__PROJECT_NAME__/$T_PROJECT_NAME}"
  p="${p//__CODE_DIR__/$T_CODE_DIR}"
  p="${p//__SLUG__/$T_SLUG}"
  p="${p//__PKG__/$T_PKG}"
  p="${p//__AUTHOR__/$T_AUTHOR}"
  p="${p//__YEAR__/$T_YEAR}"
  p="${p//__DATE__/$T_DATE}"
  printf '%s' "$p"
}

is_text() {
  [[ ! -s "$1" ]] && return 0            # empty counts as text
  LC_ALL=C grep -Iq . "$1" 2>/dev/null
}

substitute() {
  perl -pe '
    s/__PROJECT_NAME__/$ENV{T_PROJECT_NAME}/g;
    s/__CODE_DIR__/$ENV{T_CODE_DIR}/g;
    s/__SLUG__/$ENV{T_SLUG}/g;
    s/__PKG__/$ENV{T_PKG}/g;
    s/__AUTHOR__/$ENV{T_AUTHOR}/g;
    s/__YEAR__/$ENV{T_YEAR}/g;
    s/__DATE__/$ENV{T_DATE}/g;
  ' "$1"
}

# a template file as it lands in a project: tokens substituted when it is text
render() {
  if is_text "$1"; then substitute "$1"; else cat "$1"; fi
}

render_hash() { render "$1" | shasum | cut -d' ' -f1; }
file_hash()   { shasum < "$1" | cut -d' ' -f1; }

# true when the file exists and does not end in a newline
needs_newline() {
  [[ -s "$1" ]] && [[ -n "$(tail -c 1 "$1")" ]]
}

# sets src and origin to the template skeleton; needs $tmp from the caller
fetch_template() {
  if [[ -d "$TEMPLATE_REPO" ]]; then
    src="$TEMPLATE_REPO/$TEMPLATE_SUBDIR"
    origin="$TEMPLATE_REPO (local)"
  else
    git clone --quiet --depth 1 --branch "$TEMPLATE_REF" "$TEMPLATE_REPO" "$tmp/repo" \
      || die "could not clone $TEMPLATE_REPO at ref '$TEMPLATE_REF'"
    src="$tmp/repo/$TEMPLATE_SUBDIR"
    origin="$TEMPLATE_REPO@$TEMPLATE_REF"
  fi
  [[ -d "$src" ]] || die "template repo has no '$TEMPLATE_SUBDIR/' directory"
  src="$(cd "$src" && pwd -P)"
  template_rev="$(git -C "$src" rev-parse --short HEAD 2>/dev/null || echo unknown)"
}

# every template file the record tracks, relative to $src: not .DS_Store,
# .gitkeep (a folder marker) or *.append (merged line by line, not owned)
tracked_files() {
  (cd "$src" && find . -type f \
      ! -name .DS_Store ! -name .gitkeep ! -name '*.append' | sed 's|^\./||' | sort)
}

# write $1/.omniframe: the tokens, the template revision, and $2, the base of
# each tracked file as "hash<TAB>path" lines (the template version it last got)
write_record() {
  {
    printf 'project_name\t%s\n' "$T_PROJECT_NAME"
    printf 'code_dir\t%s\n'     "$T_CODE_DIR"
    printf 'slug\t%s\n'         "$T_SLUG"
    printf 'pkg\t%s\n'          "$T_PKG"
    printf 'author\t%s\n'       "$T_AUTHOR"
    printf 'year\t%s\n'         "$T_YEAR"
    printf 'date\t%s\n'         "$T_DATE"
    printf 'template\t%s\n'     "$template_rev"
    printf '%s' "$2" | sed '/^$/d; s/^/file\t/'
  } > "$1/$RECORD"
}

# one value from a record: record_get FILE KEY
record_get() { awk -F'\t' -v k="$2" '$1 == k { print $2; exit }' "$1"; }

# the recorded hash of a project path: record_base FILE PATH
record_base() { awk -F'\t' -v p="$2" '$1 == "file" && $3 == p { print $2; exit }' "$1"; }
