#!/bin/bash

# Get OS X Software Updates, update Homebrew, NPM, Ruby packages, dotfiles and some other software

function header() {
	echo -e "$(tput sgr 0 1)$(tput setaf 6)$1$(tput sgr0)"
}

# Ask for the administrator password upfront
sudo -v
echo

# Dotfiles
header "Updating dotfiles..."
cd "$HOME/dotfiles"
git pull
./sync.py
source "$HOME/.bashrc"
cd - > /dev/null 2>&1
echo

# OS X
header "Updating OS X..."
sudo softwareupdate -i -a
echo

# Homebrew
header "Updating Homebrew..."
brew update
brew upgrade
brew cleanup
echo

# NPM
header "Updating NPM..."
npm update npm -g
npm update -g
echo

# Ruby gems
header "Updating Ruby gems..."
sudo gem update
echo

# Python
header "Updating Python packages..."
sudo pip install --upgrade fabric
echo

# git-friendly
header "Updating git-friendly..."
sudo bash < <( curl https://raw.github.com/jamiew/git-friendly/master/install.sh)
echo

# Nyan cat! Yay!
nyan