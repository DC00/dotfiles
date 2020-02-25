#!/usr/bin/env bash

# close system preferences panes
osascript -e 'tell application "System Preferences" to quit'

sudo -v

# default directories

bin_dir="/usr/local/bin"
code_dir="$HOME/code/"
ruby_version="2.5.1"

# rbenv
# ruby
# homebrew
# ripgrep
