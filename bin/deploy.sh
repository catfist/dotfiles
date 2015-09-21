#!/bin/bash
# @(#) Deploy dotfiles.
# @(#)Usage: $0 [-h]
readonly SCRIPTNAME="$(basename "$0")"


# deploy dotfiles(.*) to $HOME
git ls-files | sed 's/\/.*//' | uniq | grep '^\.' | xargs -n1 -I{} ln -s {} ~/ >& /dev/null

#[fix] 被参照を確認して作成したリストを利用する 

# postfix
# [fix] in dropbox ?
ln -s ./main.cf /etc/postfix/main.cf >& /dev/null
# Karabiner
# [fix] independent repository
# sleepwatcher
# [fix] in dropbox
# ln -s ./de.bernhard-baehr.sleepwatcher-20compatibility-localuser.plist ~/Library/LaunchAgents/de.bernhard-baehr.sleepwatcher-20compatibility-localuser.plist
# launchctl load de.bernhard-baehr.sleepwatcher-20compatibility-localuser.plist
# launchctl list | grep -q sleep | afternotice
