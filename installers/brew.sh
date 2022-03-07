#!/bin/bash

# Install homebrew.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Update recipes
brew update

# Install brews
xargs brew install < ~/.dotfiles/requirements/brew/brews.txt

# Install casks
xargs brew install --cask --appdir="/Applications" < ~/.dotfiles/requirements/brew/casks.txt

# Print extra steps and add wait for user to continue
while read p; do
    log_info "$p"
done < ~/.dotfiles/requirements/brew/extra_steps.txt
read -r -p "Press any key to continue..." key

