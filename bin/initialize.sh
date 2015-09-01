#!/bin/bash -vx
cd "$(dirname "$0")"/..
pwd
# install with package managers
# Homebrew file
#[add]

# anyenv
#[add]

# ghq (git clone)
# ghq.txt [fix]
while read repo; do
  ghq get "$repo"
done < requirements/ghq.txt

# deploy dotfiles
./bin/deploy.sh

# deploy from Dropbox
# ln -sf ~/Dropbox/setting/main.cf /private/etc/postfix/main.cf
ln -sf ~/Library/Preferences/com.apple.symbolichotkeys.plist Library/Preferences/com.apple.symbolichotkeys.plist 

## login
# osascript -e 'tell application "System Events" to display dialog "start login" buttons {"OK"} default button "OK"'
# geeknote login
