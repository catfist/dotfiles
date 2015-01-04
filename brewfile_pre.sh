#!/bin/bash -vx
# install xcode from app store
# clone dotfiles from bitbucket
sudo -s

# install Xcode comman line tools
xcode-select --install

# install homebrew with preinstalled ruby
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

brew doctor
