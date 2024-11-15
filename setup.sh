#!/usr/bin/env bash

# Define the dotfiles directory
DOTFILES="${DOTFILES:=$HOME/.dotfiles}"

# Clone the repository if needed
if [ ! -d "$DOTFILES" ]; then
    git clone git@github.com:lizhineng/dotfiles.git $DOTFILES
fi

cd $DOTFILES

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update

# Install all our dependencies with bundle (See Brewfile)
brew bundle

# Install command line tools
xcode-select --install

# Install Laravel packages
composer global require laravel/installer
composer global require laravel/valet
valet install

# Install PHP extensions with PECL
pecl install imagick redis xdebug

# Install Node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

$(brew --prefix)/opt/fzf/install

brew cleanup

# Link configurations
if [ ! -f ~/.aliasrc ]; then
    ln -s "$DOTFILES/.aliasrc" "$HOME/.aliasrc"
fi

if [ ! -d "$HOME/.config/karabiner" ]; then
    ln -s "$DOTFILES/karabiner" "$HOME/.config/karabiner"
fi

if [ ! -d "$HOME/Library/Application Support/Sublime Text/Packages/User" ]; then
    ln -s "$DOTFILES/sublime" "$HOME/Library/Application Support/Sublime Text/Packages/User"
fi
