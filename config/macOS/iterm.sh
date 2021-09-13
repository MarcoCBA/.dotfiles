#!/bin/bash

# Install the Solarized Dark theme for iTerm
open ~/.dotfiles/assets/iterm2/nord.itermcolors
log_manual "Set theme as default in iterm2 settings"

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

