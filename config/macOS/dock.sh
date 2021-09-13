#!/bin/bash

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Change window animation
defaults write com.apple.dock "mineffect" -string "scale"

# Don't animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Don't automatically rearrange Spaces based on most recent use
defaults write com.apple.dock "mru-spaces" -bool "false"

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

