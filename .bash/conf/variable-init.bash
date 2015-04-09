#!/bin/bash
# vim
export vim_conf=~/.vim/conf
export vim_bundle=~/.vim/bundle
# Environment variable
export OCEDITOR="vim"
export EDITOR="vim"
export GUIEDITOR="FoldingText"
# homebrew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# gisty
export GISTY_DIR=$(ghq root)/github.com/gisty
export GISTY_SSL_VERIFY="NONE"
# path
export bindir=~/bin
export gr=$(ghq root)
export alw=~/Dropbox/setting/Alfred.alfredpreferences/workflows
export KOBITODIR=~/Dropbox/articles/kobito
# sensitive
source "$bash_conf/variable-init-sensitive.bash"
