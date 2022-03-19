#!/bin/bash

# Install homebrew.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Update recipes
brew update

brew_install() {
    if ! brew list $1 &>/dev/null; then
        brew install $1
    fi
}

cask_install() {
    if ! brew list $1 &>/dev/null; then
        brew install --cask --appdir="/Applications" $1
    fi
}

# Install brews
xargs brew_install < ~/.dotfiles/requirements/brew/brews.txt

# Install casks
xargs cask_install < ~/.dotfiles/requirements/brew/casks.txt

