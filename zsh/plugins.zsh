ZPLUGINDIR="${ZDOTDIR:-$HOME/.config/zsh}/plugins"
OMZPLUGINDIR="${ZPLUGINDIR}/oh-my-zsh"

_zplugin_load() {
  local plugin_path="${ZPLUGINDIR}/${2}"
  local source_file="${3-${2}.plugin.zsh}"
  if [[ ! -d "$plugin_path" ]]; then
    mkdir -p "$ZPLUGINDIR"
    echo "Installing ${2}..."
    git clone --depth=1 "https://github.com/${1}/${2}" "$plugin_path" \
      || { echo "ERROR: failed to install ${2}" >&2; return 1; }
  fi
  [[ -n "$source_file" ]] && source "${plugin_path}/${source_file}"
}

_omzplugin_load() {
  local plugin="$1"
  local plugin_path="plugins/${plugin}"

  if [[ ! -d "$OMZPLUGINDIR/.git" ]]; then
    mkdir -p "$ZPLUGINDIR"
    echo "Installing Oh My Zsh plugin ${plugin}..."
    git clone --depth=1 --filter=blob:none --no-checkout \
      https://github.com/ohmyzsh/ohmyzsh.git "$OMZPLUGINDIR" \
      || { echo "ERROR: failed to install Oh My Zsh" >&2; return 1; }
    git -C "$OMZPLUGINDIR" sparse-checkout set --no-cone "/${plugin_path}/" \
      || { echo "ERROR: failed to check out Oh My Zsh plugin ${plugin}" >&2; return 1; }
    git -C "$OMZPLUGINDIR" checkout \
      || { echo "ERROR: failed to check out Oh My Zsh plugin ${plugin}" >&2; return 1; }
  else
    git -C "$OMZPLUGINDIR" sparse-checkout add "/${plugin_path}/" \
      || { echo "ERROR: failed to check out Oh My Zsh plugin ${plugin}" >&2; return 1; }
  fi

  source "${OMZPLUGINDIR}/${plugin_path}/${plugin}.plugin.zsh"
}

zplugin-update() {
  local dir
  for dir in "${ZPLUGINDIR}"/*/; do
    echo "Updating ${dir:t}..."
    git -C "$dir" pull --ff-only
  done
}

_zplugin_load zsh-users zsh-autosuggestions
_zplugin_load zsh-users zsh-history-substring-search
_zplugin_load sindresorhus pure ""

fpath+=("${ZPLUGINDIR}/pure")
autoload -Uz promptinit
promptinit
prompt pure

_omzplugin_load git
_omzplugin_load sudo

# Must load last so it wraps the final ZLE widget definitions.
_zplugin_load zdharma-continuum fast-syntax-highlighting
