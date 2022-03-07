#!/bin/bash

# Install homebrew.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Update recipes
brew update

# Install brews
xargs brew install < ~/.dotfiles/requirements/brew/brews.txt

# Install casks
xargs brew install --cask --appdir="/Applications" < ~/.dotfiles/requirements/brew/casks.txt

