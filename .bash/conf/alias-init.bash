#!/bin/bash
# from [Macで少し生産性の上がるBashエイリアス集 - RickyNews](http://www.rickynews.com/blog/2014/07/19/useful-bash-aliases/)
alias up='cd ..; ls'
alias f='open .'
# ---user---
# apps
alias mi='open -a mi'
alias ft='open -a FoldingText'
alias marked='open -a "Marked 2"'
alias st='open -a "Sublime Text"'
alias td='todoist'
alias ce='open -a coteditor'
alias vimr='open -a vimr'
alias se='open -a "Script Editor"'
# dotfile
## bash
alias bashp='vim ~/.bash_profile; source ~/.bash_profile'
alias bashrc='vim ~/.bashrc; source ~/.bashrc'
alias bashf='vim ~/.bash/conf/function-init.bash; source ~/.bashrc'
alias basha='vim ~/.bash/conf/alias-init.bash; source ~/.bashrc'
alias bashv='vim ~/.bash/conf/variable-init.bash; source ~/.bashrc'
alias rcup='source ~/.bashrc'
## vim
alias vimrc='vim ~/.vimrc'
alias vimbundle='vim ~/.vim/conf/bundle-init.vim'
alias vimsetting='vim ~/.vim/conf/setting-init.vim'
alias vimplugin='vim ~/.vim/conf/bundle-init-pluginlist.vim'
alias mvimrc='mvim ~/.vimrc'
alias mvimbundle='mvim ~/.vim/conf/bundle-init.vim'
alias mvimsetting='mvim ~/.vim/conf/setting-init.vim'
alias mvimplugin='mvim ~/.vim/conf/bundle-init-pluginlist.vim'
alias vimrrc='vimr ~/.vimrc'
alias vimrbundle='vimr ~/.vim/conf/bundle-init.vim'
alias vimrsetting='vimr ~/.vim/conf/setting-init.vim'
alias vimrplugin='vimr ~/.vim/conf/bundle-init-pluginlist.vim'
# shell / bash
alias mov='set -o vi'
alias moe='set -o emacs'
# peco
alias lp='$(ls|peco)'
alias ap='sed -n "s/^alias //pg" $bash_conf/alias-init.bash|peco'
# Git
alias gco='git checkout'
alias gb='git branch'
alias gst='git status'
alias grmd='git rm $(git ls-files --deleted)'
# karabiner
alias karabiner='/Applications/Karabiner.app/Contents/Library/bin/karabiner'
alias kreloadxml='/Applications/Karabiner.app/Contents/Library/bin/karabiner reloadxml'
# Homebrew
alias brewup='brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup && afternotice'
alias brewd='brew doctor && afternotice'
alias brews='brew search'
alias brewl='brew list'
alias brewi='brew install'
alias brewu='brew uninstall'
alias brewf='brew info'
alias brewinfo='brew info'
alias casks='brew cask search'
alias caskl='brew cask list'
alias caski='brew cask install'
alias casku='brew cask uninstall'
alias caskf='brew cask info'
alias caskinfo='brew cask info'
# other
alias exe='chmod +x'
alias fc1='fc -ln|tail -n 1'
alias fcc='fc -ln|tail -n 1|pbcopy'
alias fcp='fc -ln|peco|pbcopy'
alias afternotice="osascript -e 'display notification \"OK\" with title \"iTerm2\"' || osascript -e 'display notification \"NG\" with title \"iTerm2\"'; osascript -e 'tell application \"iterm\" to activate'"
# Not arranged
alias allhistory='cat ~/.bash_history'
alias rm='trash'
alias ghqlist='find "$(ghq root)" -type d -maxdepth 3 -mindepth 3 > ~/dotfiles/ghqlist.txt'
alias hwa='echo "hello world!"'
alias lns='ln -s'
