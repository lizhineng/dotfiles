#!/usr/bin/env bash

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
