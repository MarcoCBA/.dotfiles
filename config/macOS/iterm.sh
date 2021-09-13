#!/bin/bash

# Install the Solarized Dark theme for iTerm
open ~/.dotfiles/assets/iterm2/nord.itermcolors
log_info "Set theme as default in iterm2 settings"
read -r -p "Press any key to continue..." key

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

