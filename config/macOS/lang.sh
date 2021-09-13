#!/bin/bash

# Change system language to english
# Set language and text formats
# TODO: ver los defaults en la mac del trabajo y comparar
defaults write NSGlobalDomain AppleLanguages -array "en-AR" "es-AR"
defaults write NSGlobalDomain AppleLocale -string "en_AR"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Show language menu in the top right corner of the boot screen
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

sudo systemsetup -settimezone "America/Argentina/Cordoba" > /dev/null

