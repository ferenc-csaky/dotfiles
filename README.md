# Portable `.config`

To create the `.zshrc` in your home folder, run:

```bash
cat > ~/.zshrc << 'EOF'
# Set ZDOTDIR to use .config/zsh
export ZDOTDIR="$HOME/.config/zsh"

# Source main zsh configuration (includes Zim)
source "$ZDOTDIR/zshrc"

# Source environment variables
source "$ZDOTDIR/env"
source "$ZDOTDIR/secret-env"

# Source tool configurations
source "$HOME/.config/homebrew/init.zsh"
source "$HOME/.config/fzf/init.zsh" 
source "$HOME/.config/pyenv/init.zsh"

# Source SDKMAN (must be at the end)
source "$HOME/.config/sdkman/init.zsh"
EOF
```
