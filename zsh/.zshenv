# ~/.config/zsh/.zshenv

# ---------- XDG base directories ----------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ---------- Secrets ----------
if [[ -f "$ZDOTDIR/.zshsecret" ]]; then
  source "$ZDOTDIR/.zshsecret"
fi

# ---------- GPG ----------
export GPG_TTY=$(tty)

# ---------- SDKs ----------
export PYENV_ROOT="$HOME/.pyenv"
export SDKMAN_DIR="$HOME/.sdkman"
