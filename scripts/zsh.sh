#!/bin/sh
# Configure fresh macOS instalation

# Color definitions
black='\033[0;30m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
white='\033[0;37m'

# Log utils
function log_info() { echo ">>> ${cyan}$@${white} <<<"; }
function log_success() { echo ">>> ${green}$@${white} <<<"; }

# Install Zsh & Oh My Zsh
log_info "Installing Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k
log_info "Installing Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

log_success "DONE"