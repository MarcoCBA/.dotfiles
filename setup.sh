# RUN THIS SCRIPT IN ITERM2 ONLY

echo "Creating an SSH key for you..."
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub | pbcopy
echo "SSH Key copied to clipboard!"

echo "Please add this public key to Github \n"
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key after this..."

echo "Installing xcode-stuff"
xcode-select --install

# Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo 'Please set ZSH_THEME="powerlevel10k/powerlevel10k" in .zshrc'
read -p "Press [Enter] key after this..."

# This is made in order to configure the installed theme
source ~/.zshrc

# Check for Homebrew,
# Install if we don't have it
echo "Installing homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Next steps for brew installation
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
eval "$(/opt/homebrew/bin/brew shellenv)"

# Update homebrew recipes
echo "Updating homebrew..."
brew update

brew_apps=(
  git
  git-flow
  tree
  wget
  trash
  speedtest-cli
  thefuck
  zsh-syntax-highlighting
  pyenv
  pyenv-virtualenv
  fzf
  neovim
)

echo "Installing brew apps..."
brew install ${brew_apps[@]}
brew cleanup

# Activate syntax highlighting
echo 'source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc

# Activate thefuck
echo "eval $(thefuck --alias)" >> ~/.zshrc

# Aditional steps for pyenv
echo 'eval "$(pyenv init --path)"' >> ~/.zshrc

# Enable pyenv auto-activation
echo 'if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi' >> ~/.zshrc

# Reload zsh
source ~/.zshrc

# GUI Apps
cask_apps=(
  spotify
  visual-studio-code
  docker
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew install --cask --appdir="/Applications" ${cask_apps[@]}
brew cleanup

echo "Git config"
git config --global user.name "Marco Martinelli"
git config --global user.email markitocab@gmail.com

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

# Expanding the save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Showing all filename extensions in Finder by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disabling the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use column view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle Clmv

# Setting Dock to auto-hide and removing the auto-hiding delay
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0

# Preventing Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Install Fisa NVIM config
mkdir ~/.config/nvim && touch $_/init.vim
curl https://raw.githubusercontent.com/fisadev/fisa-vim-config/master/config.vim > ~/.config/nvim/init.vim
echo 'alias vim="nvim"' >> ~/.zshrc
# Make vim copy into MacOS clipboard
echo "set clipboard=unnamed" >> ~/.config/nvim/init.vim
source ~/.zshrc

# Install python global environment
read -p "Select python version and press enter to continue..." pythonv
pyenv install $pythonv
pyenv global $pythonv

# Alias to install Fisa NVIM dependencies on new virtual python environments
echo 'alias fisadep="pip install pynvim flake8 pylint isort"' >> ~/.zshrc

# Alias to upgrade pip
echo 'alias pip-upgrade="pip install --upgrade pip"' >> ~/.zshrc

pip-upgrade

# Install iterm2 themes.
cd ~
git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git
cd iTerm2-Color-Schemes
tools/import-scheme.sh schemes/*
cd ..
rm -rf iTerm2-Color-Schemes
echo "Remember to set your color preset from settings"

echo "Installing fzf shortcuts"
$(brew --prefix)/opt/fzf/install

echo "Downloading spectacle..."
version="Spectacle+1.2"
cd ~/Downloads && wget https://s3.amazonaws.com/spectacle/downloads/$version.zip
unzip $version.zip
mv Spectacle.app /Applications
rm -rf $version.zip
echo "Remember to configure spectacle to launch at startup"

killall Finder

echo "Done!"

