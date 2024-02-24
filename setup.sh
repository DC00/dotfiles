#!/bin/zsh

WORKSPACE="~/code"

echo "SETUP:creating directories"
mkdir -p $WORKSPACE
mkdir -p ~/mycode
mkdir -p ~/.scripts

echo "SETUP:cloning dotfiles"
git clone git@github.com:DC00/dotfiles.git ~/mycode

echo "SETUP:backing up zshrc"
cp ~/.zshrc ~/.zshrc.bak

echo "SETUP:copying zshrc"
cp ~/mycode/dotfiles/zsh/.zshrc ~/.zshrc

echo "SETUP:copying gitconfig"
cp ~/mycode/dotfiles/git/.gitconfig ~/.gitconfig

echo "SETUP:copying git-open"
cp ~/mycode/dotfiles/git/git-open ~/.scripts/git-open

echo "SETUP:chmoding git-open
chmod +x ~/.scripts/git-open

echo "SETUP:copying rubygems config"
cp ~/mycode/dotfiles/rubygems/gemrc ~/.gemrc

echo "SETUP:copying vim config"
cp ~/mycode/dotfiles/vim/.vimrc ~/.vimrc

echo "SETUP:copying tmux config"
cp ~/mycode/dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo "SETUP:installing xcode tools"
xcode-select --install

echo "installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "adding brew to env"
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "SETUP:updating homebrew"
brew update

echo "SETUP:upgrading homebrew"
brew upgrade

echo "SETUP:installing git"
brew install git

echo "SETUP:installing openssl"
brew install openssl@1.1

echo "SETUP:openssl version"
brew --prefix openssl

echo "SETUP:installing rbenv"
brew install rbenv

echo "SETUP:sourcing startup script"
source ~/.zshrc

echo "SETUP:installing ruby 2.7.4"
rbenv install 2.7.4
rbenv rehash

echo "SETUP:setting shell"
rbenv shell 2.7.4
ruby -v

echo "SETUP:installing pyenv"
brew install pyenv

echo "SETUP:install python 3.10.6"
pyenv install 3.10.6"

echo "SETUP:setting python version"
pyenv global 3.10.6

echo "SETUP:sourcing startup script"
source ~/.zshrc

echo "SETUP:updating gems"
gem update --system
rbenv rehash

echo "SETUP:installing bundler"
gem install bundler
rbenv rehash

echo "SETUP:setting global version"
rbenv global 2.7.4
rbenv rehash

echo "SETUP:installing postgres"
brew install postgresql@15

echo "SETUP:installing redis"
brew install redis

echo "SETUP:starting services"
brew services start --all

echo "SETUP:sourcing startup script"
source ~/.zshrc

echo "SETUP:installing tree"
brew install tree

echo "SETUP:installing jq"
brew install jq

echo "SETUP:installing tmux"
brew install tmux

echo "SETUP:installing reattach-to-user-namespace"
brew install reattach-to-user-namespace

echo "SETUP:installing ripgrep"
brew install ripgrep

echo "SETUP:sourcing startup script"
source ~/.zshrc

echo "done"
