#!/bin/sh

# Load utilities
source ~/.dotfiles/utils/utils.sh

# Run installers
log_info "Installing xcode..."
$INSTALLERS_DIR/xcode.sh
log_success "Success"

log_info "Installing Oh My ZSH..."
$INSTALLERS_DIR/ohmyzsh.sh
log_success "Success"

# Reload utilities since shell was change and restarted
source ~/.dotfiles/utils/utils.sh

log_info "Installing Powerlevel10k..."
$INSTALLERS_DIR/p10k.sh
log_success "Success"

log_info "Installing homebrew, its configs and requierements..."
$INSTALLERS_DIR/brew.sh
log_success "Success"

# Install rc dotfiles
safe_ln ~/.dotfiles/git-template/gitconfig.global ~/.gitconfig
log_success "GIT: Setup success"
