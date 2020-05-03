#!/usr/bin/env bash

# close system preferences panes
osascript -e 'tell application "System Preferences" to quit'

sudo -v

# make and set default directories

# need to make them first

bin_dir="/usr/local/bin"
code_dir="$HOME/code/"
ruby_version="2.5.1"
script_dir="~/.scripts"

# rbenv
# ruby
# homebrew
# ripgrep

# mac specific

# key repeat
# defaults write NSGlobalDomain KeyRepeat -int 0

