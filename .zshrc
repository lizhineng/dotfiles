# Path to your dotfiles folder
export DOTFILES=$HOME/.dotfiles

# Specify a locale
export LANG=en_US.UTF-8

# Prompt
PS1="%(?.%F{green}.%F{red})%#%f "
RPS1='%~'

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

# Change directory without explicit "cd" command
setopt AUTO_CD

# Set up aliases to save some keystrokes
if [[ -r ~/.aliasrc ]]; then
    . ~/.aliasrc
fi

# Node version manager
export NVM_DIR="$HOME/.nvm"
if [[ -d "$NVM_DIR" ]]; then
    NODE_VERSIONS=("$NVM_DIR"/versions/node/*)
    if (( ${#NODE_VERSIONS[@]} > 0 )); then
        PATH="${NODE_VERSIONS[$((${#NODE_VERSIONS[@]}))]}/bin:$PATH"
    fi
    [ -s "$NVM_DIR/nvm.sh" ] && nvm() { . "$NVM_DIR/nvm.sh"; nvm "$@"; }
    [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
fi

# PHP dependency manager
if [[ -d $HOME/.composer/vendor/bin ]]; then
    export PATH="$HOME/.composer/vendor/bin:$PATH"
fi
