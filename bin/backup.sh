#!/bin/bash
# @(#)Run before reset enviroment
# @(#)Usage: $0 [-h]
readonly SCRIPTNAME="$(basename "$0")"
readonly DOTFILES_DIR="$(dirname "$0")"/..

cd "$DOTFILES_DIR"

# backup SSH keys
# (don't use '-r' option, to ignore dir path structure.)
mkdir -p ~/Dropbox/setting >& /dev/null && zip ~/Dropbox/setting/ssh.zip $(ls ~/.ssh)

# Get requirements (of package Managers)
mkdir -p "$DOTFILES_DIR"/requirements >& /dev/null && cd "$DOTFILES_DIR"/requirements
# dotfiles
find ~ -type f -name '.*' $(printf "! -name %s " $(cat ~/.gitignore_global)) -maxdepth 1 -mindepth 1 > list.txt
# [add] Homebrew file

# ghq
ghq list | while read lrepo; do
  git -C "$(ghq root)/$lrepo" remote -v
done | grep 'push' | awk '{print $2}' > ghq.txt
# other
type anyenv >& /dev/null && anyenv versions > anyenv.txt
type pip >& /dev/null && pip freeze > pip.txt
type gem >& /dev/null && gem list > gem.txt
type npm >& /dev/null && npm ls -g > npm.txt
# type go >& /dev/null && go  > go.txt
cd "$DOTFILES_DIR"

# not dotfiles
# get symlink http://oshiete.goo.ne.jp/qa/8309219.html
# dotfiles=($(ls -1 "$DOTFILES_DIR"))
# files="$(ls | awk -F\n -v ORS='|' '{print}' | sed 's/|$//')"
# find ~ -type l | grep "[$files]"
