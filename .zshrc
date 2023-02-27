# Path to your dotfiles folder
export DOTFILES=$HOME/.dotfiles

# Path to your oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load
ZSH_THEME="minimal"

# Custom configuration folder
ZSH_CUSTOM=$DOTFILES/zsh

# Plugins to load
plugins=(git)

# Bootstrap
source $ZSH/oh-my-zsh.sh

# Specify a locale
export LANG=en_US.UTF-8
