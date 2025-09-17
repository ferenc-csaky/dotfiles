# Add brew apps to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

export GPG_TTY=$(tty)
export PYENV_ROOT="$HOME/.pyenv"
export SDKMAN_DIR="$HOME/.sdkman"

[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
