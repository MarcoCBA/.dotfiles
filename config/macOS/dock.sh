#!/bin/sh

# Setting Dock to auto-hide and removing the auto-hiding delay
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Reorder dock
dockutil --remove all
REQUIREMENTS=$HOME/.dotfiles/requirements/dock/apps.txt
APPLICATION_PATH=/Applications
while read p; do
    echo "$p"
    dockutil --add $APPLICATION_PATH/$p
done < $REQUIREMENTS

killall Dock

