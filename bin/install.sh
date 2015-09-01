#!/bin/bash
# install/deploy dotfiles
cd ~/dotfiles

# deploy dotfiles(.*) to $HOME
git ls-files | sed 's/\/.*//' | uniq | grep '^\.' | xargs -n1 -I{} ln -s {} ~/ >& /dev/null

#[fix] 被参照を確認して作成したリストを利用する 

# postfix
ln -s ./main.cf /etc/postfix/main.cf >& /dev/null
# Karabiner
mkdir -p ~/Library/Application\ Support/Karabiner >& /dev/null && ln -s ./private.xml ~/Library/Application\ Support/Karabiner/private.xml >& /dev/null
# sleepwatcher
ln -s ./de.bernhard-baehr.sleepwatcher-20compatibility-localuser.plist ~/Library/LaunchAgents/de.bernhard-baehr.sleepwatcher-20compatibility-localuser.plist
launchctl load de.bernhard-baehr.sleepwatcher-20compatibility-localuser.plist
launchctl list | grep -q sleep | afternotice
