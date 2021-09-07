# ZSH
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then # Power level instant prompt
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"          # This should be kept at top
fi

export ZSH="$HOME/.oh-my-zsh" # Path to your oh-my-zsh installation

ZSH_THEME="powerlevel10k/powerlevel10k" # Set zsh theme before sourcing oh my zsh

source $ZSH/oh-my-zsh.sh # Run oh my zsh script

source $HOME/.p10krc # Run Powerlevel10k theme after oh my zsh

# PATHS

BREW_PREFIX=$(brew --prefix) # Brew installation path

# HOMEBREW

eval "$($BREW_PREFIX/bin/brew shellenv)" # Setup homebrew

# BREW FORMULAE

eval $(thefuck --alias) # Init Thefuck

source $BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # Syntax highlighting

if which pyenv-virtualenv-init > /dev/null; then # Auto activate pynev-virtualenvs
    eval "$(pyenv virtualenv-init -)"; 
fi

eval "$(pyenv init --path)" # Pyenv init

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # Setup fzf

source $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh # Load auto suggestions

# ALIASES

alias vim="nvim" # Use neovim by default

alias pip-upgrade="pip install --upgrade pip" # Alias to quickly update pip

alias src='source ~/.zshrc' # Quickly source .zshrc

alias jn='jupyter notebook' # Jupyter notebooks shortcuts

alias jl='jupyter lab'
