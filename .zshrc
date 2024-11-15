# Path to your dotfiles folder
export DOTFILES=$HOME/.dotfiles

# Specify a locale
export LANG=en_US.UTF-8

# Include additional zsh configurations
\. "$DOTFILES/zsh/aliases.zsh"
\. "$DOTFILES/zsh/path.zsh"

# Start up Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
