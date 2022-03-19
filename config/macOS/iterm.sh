#!/bin/bash

# Install the Solarized Dark theme for iTerm
open ~/.dotfiles/assets/iterm2/nord.itermcolors
open ~/.dotfiles/assets/p10k/MesloLGS\ NF\ Regular.ttf

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Allow alternate mouse scrolling.
defaults write com.googlecode.iterm2 AlternateMouseScroll -bool true

