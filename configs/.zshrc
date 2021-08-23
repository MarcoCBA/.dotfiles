#       ZSH       #
# --------------- #

# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"

# Set zsh theme.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Run Powerlevel10k
source ~/.p10krc

#    HOMEBREW     #
# --------------- #

# Setup homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

#  BREW FORMULAE  #
# --------------- #

# Thefuck
eval $(thefuck --alias)

# Syntax highlighting.
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto activate pynev-virtualenvs
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Pyenv init
eval "$(pyenv init --path)"

# Setup fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#     ALIASES     #
# --------------- #

# Use neovim by default
alias vim="nvim"

# Alias to quickly update pip.
alias pip-upgrade="pip install --upgrade pip"

# Quickly source .zshrc
alias src='source ~/.zshrc'

# Jupyter aliases
alias jn='jupyter notebook'
alias jl='jupyter lab'