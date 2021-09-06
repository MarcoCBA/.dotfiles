#!/bin/sh

# Load utilities
source ~/.dotfiles/utils/utils.sh

INSTALLERS_DIR=$HOME/.dotfiles/installers
RCS_DIR=$HOME/.dotfiles/rc
CONFIGS_DIR=$HOME/.dotfiles/configs

# Run installers
log_info "Installing xcode..."
$INSTALLERS_DIR/xcode.sh > /dev/null
log_success "Success"

log_info "Installing Oh My ZSH..."
$INSTALLERS_DIR/ohmyzsh.sh > /dev/null
log_success "Success"

log_info "Installing Powerlevel10k..."
$INSTALLERS_DIR/p10k.sh > /dev/null
log_success "Success"

log_info "Installing homebrew, its configs and requierements..."
$INSTALLERS_DIR/brew.sh > /dev/null
log_success "Success"

# Install rc dotfiles
safe_ln ~/.dotfiles/git-template/gitconfig.global ~/.gitconfig
log_success "GIT: Setup success"
