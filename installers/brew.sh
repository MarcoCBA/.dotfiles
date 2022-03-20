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
while read p; do
    brew_install "$p"
done < ~/.dotfiles/requirements/brew/brews.txt

# Install casks
while read p; do
    cask_install "$p"
done < ~/.dotfiles/requirements/brew/casks.txt

