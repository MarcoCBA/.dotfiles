#!/bin/bash
# Dotfiles Install Script
# {{{ Parameters:
# - none: install everything
# - INSTALL-ALL: run all installers
# - XCODE: install xcode clt
# - OH-MY-ZSH: install Oh-My-Zsh scripts
# - P10K: install Powerlevel10k theme for ohmyzsh
# - BREW: install homebrew, update, and install some requierements
# - RCS: install all dotfiles
# - GITRC: install git dotfiles
# - ZSHRC: install zsh dotfiles
# - P10KRC: install Powerlevel10k already configured theme
# - NVIMRC: install nvim dotfiles.
# - CONFIGURE: run all configuration scripts
# - DOCK: configure dock
# - FINDER: configure Finder
# - INPUT: configure text input
# - LANG: configure language
# - TIME-MACHINE: configure time machine
# - MANUAL: list manual configuration tasks
# }}}


# Load utilities
source ~/.dotfiles/utils/utils.sh

INSTALLERS_DIR=$HOME/.dotfiles/installers
RCS_DIR=$HOME/.dotfiles/runcom
CONFIGS_DIR=$HOME/.dotfiles/config
ASSETS_FOLDER=$HOME/.dotfiles/assets

# Add spaces to enable looking for isolated commands
args=" $* "

# Run installers
if [[ $args == *\ XCODE\ * ]] || [[ $args == *\ INSTALL-ALL\ * ]] || [[ $# -eq 0 ]]; then
    log_info "Installing xcode..."
    $INSTALLERS_DIR/xcode.sh
    log_success "Installation successful"
fi

if [[ $args == *\ OH-MY-ZSH\ * ]] || [[ $args == *\ INSTALL-ALL\ * ]] || [[ $# -eq 0 ]]; then
    log_info "Installing Oh My ZSH..."
    $INSTALLERS_DIR/ohmyzsh.sh
    log_success "Installation successful"
fi

if [[ $args == *\ P10K\ * ]] || [[ $args == *\ INSTALL-ALL\ * ]] || [[ $# -eq 0 ]]; then
    log_info "Installing Powerlevel10k..."
    $INSTALLERS_DIR/p10k.sh
    log_success "Installation successful"
fi

if [[ $args == *\ BREW\ * ]] || [[ $args == *\ INSTALL-ALL\ * ]] || [[ $# -eq 0 ]]; then
    log_info "Installing homebrew, its configs and requierements..."
    $INSTALLERS_DIR/brew.sh
    log_success "Installation successful"
fi

# Install rc dotfiles
if [[ $args == *\ GITRC\ * ]] || [[ $args == *\ RCS\ * ]] || [[ $# -eq 0 ]]; then
    safe_ln $RCS_DIR/.gitrc ~/.gitconfig
    log_success "GIT: Setup success"
fi

if [[ $args == *\ ZSHRC\ * ]] || [[ $args == *\ RCS\ * ]] || [[ $# -eq 0 ]]; then
    safe_ln $RCS_DIR/.zshrc ~/.zshrc
    log_success "ZSH: Setup success"
fi

if [[ $args == *\ P10KRC\ * ]] || [[ $args == *\ RCS\ * ]] || [[ $# -eq 0 ]]; then
    safe_ln $RCS_DIR/.p10krc ~/.p10krc
    log_success "P10K: Setup success"
fi

if [[ $args == *\ NVIMRC\ * ]] || [[ $args == *\ RCS\ * ]] || [[ $# -eq 0 ]]; then
    NVIM_CONF_PATH=$HOME/.config/nvim
    mkdir -p $NVIM_CONF_PATH # Path may not exist
    safe_ln $RCS_DIR/.nvimrc $NVIM_CONF_PATH/init.vim
    log_success "NVIM: Setup success"
fi

# Run configuration scripts
if [[ $args == *\ DOCK\ * ]] || [[ $args == *\ CONFIGURE\ * ]] || [[ $# -eq 0 ]]; then
    $CONFIGS_DIR/macOS/dock.sh
    log_success "DOCK: Configured"
fi

if [[ $args == *\ FINDER\ * ]] || [[ $args == *\ CONFIGURE\ * ]] || [[ $# -eq 0 ]]; then
    $CONFIGS_DIR/macOS/finder.sh
    log_success "FINDER: Configured"
fi

if [[ $args == *\ INPUT\ * ]] || [[ $args == *\ CONFIGURE\ * ]] || [[ $# -eq 0 ]]; then
    $CONFIGS_DIR/macOS/input.sh
    log_success "INPUT: Configured"
fi

if [[ $args == *\ LANG\ * ]] || [[ $args == *\ CONFIGURE\ * ]] || [[ $# -eq 0 ]]; then
    $CONFIGS_DIR/macOS/lang.sh
    log_success "LANGUAGE: Configured"
fi

if [[ $args == *\ TIME-MACHINE\ * ]] || [[ $args == *\ CONFIGURE\ * ]] || [[ $# -eq 0 ]]; then
    $CONFIGS_DIR/macOS/timemachine.sh
    log_success "TIME MACHINE: Configured"
fi

log_success "SYSTEM REBOOT IS RECOMMENDED"
log_info "Remember to install the recommended font for Powerlevel10k at $ASSETS_FOLDER in your iTerm2 default profile"
log_info "Remember to run /usr/local/opt/fzf/install to enable fzf"
log_info "Remember to make spectacle and alt-tab to run at startup"

