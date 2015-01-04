#!/bin/bash
# from [Macで少し生産性の上がるBashエイリアス集 - RickyNews](http://www.rickynews.com/blog/2014/07/19/useful-bash-aliases/)
alias md='vim ./*.md'
alias up='cd ..; ls'
alias f='open .'
# ---user---
# apps
alias mi='open -a mi'
alias ft='open -a FoldingText'
alias marked='open -a "Marked 2"'
alias st='open -a "Sublime Text"'
alias td='$(ghq root)/github.com/KryDos/todoist-cli/todoist.py'
alias ce='open -a coteditor'
alias vimr='open -a vimr'
# dotfile
## bash
alias bashprofile='vim ~/.bash_profile; source ~/.bash_profile'
alias bashrc='vim ~/.bashrc; source ~/.bashrc'
alias rcupdate='source ~/.bashrc'
alias stbashrc='open -W -n -a "Sublime Text" ~/.bashrc; source ~/.bashrc'
alias bashfunction='vim ~/.bash/conf/function-init.bash; source ~/.bashrc'
alias bashalias='vim ~/.bash/conf/alias-init.bash; source ~/.bashrc'
alias bashvariable='vim $bash_conf/variable-init.bash; source ~/.bashrc'
## vim
alias vimrc='vim ~/.vimrc'
alias vimbundle='vim ~/.vim/conf/bundle-init.vim'
alias vimsetting='vim ~/.vim/conf/setting-init.vim'
alias vimplugin='vim ~/.vim/conf/bundle-init-pluginlist.vim'
# other
alias exe='chmod +x'
alias fc1='fc -ln|tail -n 1'
alias fcc='fc -ln|tail -n 1|pbcopy'
alias fcp='fc -ln|peco|pbcopy'
alias afternotice="osascript -e 'display notification \"OK\" with title \"iTerm2\"' || osascript -e 'display notification \"NG\" with title \"iTerm2\"'; osascript -e 'tell application \"iterm\" to activate'"
# peco
alias lp='$(ls|peco)'
alias ap='grep "^alias" $bash_conf/alias-init.bash|peco'
# Git
alias gco='git checkout'
alias gb='git branch'
alias gst='git status'
# karabiner
alias karabiner='/Applications/Karabiner.app/Contents/Library/bin/karabiner'
alias kreloadxml='/Applications/Karabiner.app/Contents/Library/bin/karabiner reloadxml'
# Homebrew
alias brewup='brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup && notice'
alias brewdoctor='brew doctor && afternotice'
# Not arranged
alias se='open -a "Script Editor"'
alias allhistory='cat ~/.bash_history'
alias editsh='vim ~/scripts/'
