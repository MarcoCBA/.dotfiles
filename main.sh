#!/bin/sh

# Load utilities
source ~/.dotfiles/utils/utils.sh

INSTALLERS_DIR=$HOME/.dotfiles/installers
RCS_DIR=$HOME/.dotfiles/rc
CONFIGS_DIR=$HOME/.dotfiles/configs

# Run installers
log_info "Installing xcode..."
$INSTALLERS_DIR/xcode.sh
log_success "Success"

log_info "Installing Oh My ZSH..."
$INSTALLERS_DIR/ohmyzsh.sh
log_success "Success"

log_info "Installing Powerlevel10k..."
$INSTALLERS_DIR/p10k.sh
log_success "Success"

log_info "Installing homebrew, its configs and requierements..."
$INSTALLERS_DIR/brew.sh
log_success "Success"

# Install rc dotfiles
safe_ln ~/.dotfiles/runcom/.gitrc ~/.gitconfig
log_success "GIT: Setup success"

safe_ln ~/.dotfiles/runcom/.zshrc ~/.zshrc
log_success "GIT: Setup success"

safe_ln ~/.dotfiles/runcom/.p10krc ~/.p10krc
log_success "GIT: Setup success"

# TODO: mover esto a la carpeta de vim
# safe_ln ~/.dotfiles/runcom/.vimrc ~/.zshrc
# log_success "GIT: Setup success"



