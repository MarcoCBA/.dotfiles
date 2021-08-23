#!/bin/sh
# Configure fresh macOS instalation

# Color definitions
black='\033[0;30m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
white='\033[0;37m'

# Log utils
function log_info() { echo ">>> ${cyan}$@${white} <<<"; }
function log_success() { echo ">>> ${green}$@${white} <<<"; }

# Install homebrew,
log_info "Installing homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update recipes
log_info "Updating brew recipes..."
brew update

# Install brews
log_info "Installing brew formulae"
while read p; do
    brew install "$p"
done < ~/.dotfiles/requirements/brew.txt

# Install casks
log_info "Installing brew cask formulae"
while read p; do
    brew install --cask --appdir="/Applications" "$p"
done < ~/.dotfiles/requirements/cask.txt

log_success "DONE"