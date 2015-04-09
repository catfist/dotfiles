#!/bin/bash
# install/deploy dotfiles
ln -s ./.vim ~/.vim
ln -s ./.bash ~/.bash
ln -s ./.bash* ~/
ln -s ./.vimrc ~/.vimrc
ln -s ./main.cf /etc/postfix/main.cf
ln -s ./.inputrc ~/.inputrc
# Karabiner
mkdir -p ~/Library/Application\ Support/Karabiner >& /dev/null && ln -s ./private.xml ~/Library/Application\ Support/Karabiner/private.xml


# postfix
