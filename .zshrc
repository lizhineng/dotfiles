# Path to your dotfiles folder
export DOTFILES=$HOME/.dotfiles

# Specify a locale
export LANG=en_US.UTF-8

# Persist history permanently
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.history
HISTORY_IGNORE='(clear|ls|pwd|exit|uptime)*'

# Record history in real time
setopt INC_APPEND_HISTORY

# Universal history list
setopt SHARE_HISTORY

# Record execution time and duration
setopt EXTENDED_HISTORY

# Do not store consecutive duplicate command line
setopt HIST_IGNORE_DUPS

# Do not save the command that starts with a space to history
setopt HIST_IGNORE_SPACE

# Do not save history for "history" command
setopt HIST_NO_STORE

# Include additional zsh configurations
\. "$DOTFILES/zsh/aliases.zsh"
\. "$DOTFILES/zsh/path.zsh"

# Start up Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
