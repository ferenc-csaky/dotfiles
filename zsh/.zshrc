# ~/.config/zsh/.zshrc

# Ghostty shell integration must load before prompt and plugin setup.
if [[ -n "${GHOSTTY_RESOURCES_DIR}" ]]; then
  source "${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration"
fi

# =============================================================================
# History
# =============================================================================

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# =============================================================================
# Shell behavior
# =============================================================================

WORDCHARS=${WORDCHARS//\//}

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT # sort file10 after file9

# =============================================================================
# Completion
# =============================================================================

# Load completion system
autoload -Uz compinit

# Init completion with cached metadata
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Enable interactive completion menu select
zstyle ':completion:*' menu select
# Make it case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# =========================================================
# Modular config files
# =========================================================

# Aliases
source "$ZDOTDIR/aliases.zsh"

# Plugins and plugin manager
source "$ZDOTDIR/plugins.zsh"

# Keep pasted commands readable while preserving syntax highlighting.
zle_highlight+=(paste:none)

# =========================================================
# Shell integrations
# =========================================================

source <(fzf --zsh)
source "$SDKMAN_DIR/bin/sdkman-init.sh"

eval "$(zoxide init zsh)"
eval "$(pyenv init - zsh)"
