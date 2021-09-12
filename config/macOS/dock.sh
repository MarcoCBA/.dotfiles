#!/bin/sh

# Change window animation
defaults write com.apple.dock "mineffect" -string "scale"

# Setting Dock to auto-hide and removing the auto-hiding delay
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "autohide-delay" -float 0

# Disable show recents
defaults write com.apple.dock "show-recents" -bool "false"

# Reorder dock
dockutil --remove all
REQUIREMENTS=$HOME/.dotfiles/requirements/dock/apps.txt
APPLICATION_PATH=/Applications
while read p; do
    dockutil --add $APPLICATION_PATH/$p
done < $REQUIREMENTS

killall Dock

