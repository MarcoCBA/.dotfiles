#!/bin/sh

# Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

log_info "Remember to install the recommended font for Powerlevel10k at $ASSETS_FOLDER in your iTerm2 default profile"
read -r -p "Press any key to continue..." key

