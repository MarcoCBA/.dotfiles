#!/bin/sh

# TODO: ordenar el dock e instalar apps faltantes usando dockutils

# Setting Dock to auto-hide and removing the auto-hiding delay
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0

killall Dock