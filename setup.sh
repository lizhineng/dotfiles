# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update && brew upgrade

# Install command line tools
xcode-select --install

brew install ruby
brew install gnupg
brew install vim
brew install redis


#
# Node Development
#

brew install node


#
# PHP Development
#

brew install php
brew install mysql

# Install Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer

# Install Laravel packages
composer global require laravel/installer
composer global require laravel/valet
valet install


#
# Deisgn
#

brew cask install adobe-creative-cloud
brew cask install figma

#
# Useful cli improved
#

brew install bat
brew install prettyping
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install htop
brew install diff-so-fancy
brew install tldr
brew install fd
brew install ncdu


#
# GUI applications
#

brew cask install github
brew cask install iterm2
brew cask install sublime-text
brew cask install 1password
brew cask install tableplus
brew cask install github-desktop
brew cask isntall google-chrome
brew cask install spotify
brew cask install telegram
brew cask install discord

brew cleanup
