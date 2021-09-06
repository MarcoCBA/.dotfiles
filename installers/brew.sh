#!/bin/sh

# Install homebrew,
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update recipes
brew update

# Install brews
while read p; do
    brew install "$p"
done < ~/.dotfiles/requirements/brew/brew.txt

# Install casks
while read p; do
    brew install --cask --appdir="/Applications" "$p"
done < ~/.dotfiles/requirements/cask.txt
