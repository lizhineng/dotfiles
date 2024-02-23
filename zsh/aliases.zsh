# Shortcuts
alias c="clear"
alias v="nvim"
alias vim="v"
alias reloadcli="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias resetlaunchpad='defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock'

# Directories
alias dotfiles="cd $HOME/code/dotfiles"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"

# Keep system up-to-date
# Apply updates for macOS, brew, composer and npm and their installed packages.
alias update="sudo softwareupdate -ia; brew update; brew upgrade; brew cleanup; composer self-update; composer global update; npm install npm -g; npm update -g; omz update"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Copy SSH public key to clipboard
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"

# Better alternatives
# https://remysharp.com/2018/08/23/cli-improved
alias cat="bat"
alias ping="prettyping --nolegend"
alias preview="fzf --preview 'bat --color always {}'"
alias top="sudo htop"
alias help="tldr"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules --exclude vendor"
alias l="exa -la"
alias ll="exa -l"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Show/hide all desktop icons
alias cleandesk="defaults write com.apple.finder CreateDesktop false; killall Finder"
alias messydesk="defaults write com.apple.finder CreateDesktop true; killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# PHP
# Force to reinstall all vendor packages completely
alias cfresh="[[ -e composer.json ]] && rm -rf vendor/ composer.lock && composer i"
alias t="composer test"

# Laravel
alias a="php artisan"
alias ams="php artisan migrate:fresh --seed"

# PHPUnit
alias p="./vendor/bin/phpunit"
alias pf="./vendor/bin/phpunit --filter"
alias px="./vendor/bin/phpunit --stop-on-fail --stop-on-error"

# Javascript
alias watch="npm run watch"
