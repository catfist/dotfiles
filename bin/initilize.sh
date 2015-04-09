#!/bin/bash -vx

# for search Apps installed by cask in Alfred
brew cask alfred link

# other package manager
rbenv install 2.1.2 #install ruby 2.1.2 
npm install -g hexo
pip install git+https://github.com/uchida/yamlfred
pip install bitbucket-cli
pip install pyful
# rubygem
# (sudo) gem install
gem install gist
gem install gisty
gem install jekyll
gem install vmail

# go get
# go get github.com/motemen/ghq
# ghq config
echo "
[ghq]
  root = ~/.ghq" >> ~/.gitconfig

# ghq (git clone)
# ghq get https://github.com/

# ghqlist.txt [fix]



# install/deploy dotfiles
cd "$(ghq root)/github.com/catfist/dotfiles"
./bin/install.sh

# login
  osascript -e 'tell application "System Events"
  display dialog "start login" buttons {"OK"} default button "OK" 
  end tell'
geeknote login
