#!/bin/bash
# Initialize
unalias -a

#
# Import
#
# from [Macで少し生産性の上がるBashエイリアス集 - RickyNews](http://www.rickynews.com/blog/2014/07/19/useful-bash-aliases/)
alias up='cd ..; ls'
alias f='open .'

#
# dev
#
alias hwa='echo "hello world! 222"'

#
# General
#
alias exe='chmod +x'
alias afternotice="osascript -e 'display notification \"OK\" with title \"iTerm2\"' || osascript -e 'display notification \"NG\" with title \"iTerm2\"' && osascript -e 'tell application \"iterm\" to activate'"
 
#
# bash
#
# Edit
alias bashp='mvim ~/.bash_profile; source ~/.bash_profile'
alias bashrc='mvim ~/.bashrc; source ~/.bashrc'
alias bashf='mvim ~/.bash/conf/function-init.bash; source ~/.bashrc'
alias basha='mvim ~/.bash/conf/alias-init.bash; source ~/.bashrc'
alias bashv='mvim ~/.bash/conf/variable-init.bash; source ~/.bashrc'
alias inputrc='mvim ~/.inputrc;source ~/.inputrc'
alias rcup='source ~/.bashrc'
# Set
alias mov='set -o vi'
alias moe='set -o emacs'
# Shorten
alias path='echo "$PATH" | tr ":" "\n"'
alias addv='echo "$*" >> "$bash_conf"/variable-init.bash'
alias relogin='exec /bin/bash -l'
alias allhistory='cat ~/.bash_history'
alias lsl='ls -l'
alias ls1='ls -1'
alias lsa='ls -a'
alias ls@='ls -l@'
alias osa='osascript'
alias fc1='fc -ln|tail -n 1'
alias fcc='fc -ln|tail -n 1|pbcopy'
alias fcp='fc -ln|peco|pbcopy'
# peco
alias ap="alias | cut -d' ' -f2- | awk -F'=' '{printf \"%-12s %s\n\",\$1,\$2}' | grepeco" # [fix] delete ''
alias fp="declare -F | awk '{print \$3}' | grep -v '^_' | grepeco"
 
#
# other
#
# vim
alias vimrc='mvim ~/.vimrc'
# karabiner
alias karabiner='/Applications/Karabiner.app/Contents/Library/bin/karabiner'
# Open applications
alias tp='open -a "TaskPaper"'
alias marked='open -a "Marked 2"'
# Wrapper
alias rm='trash -a'
# ghq
# sleepwatcher
alias esw='mvim ~/Library/LaunchAgents/de.bernhard-baehr.sleepwatcher-20compatibility-localuser.plist'
# Not arranged
alias snipb='snip -b'
alias tw='tw -yes'
alias jxa="osascript -l JavaScript"
alias g='git'
alias tmp='cd /tmp/'
alias ghqroot='cd "(ghq root)"'
alias se='open -a "Script Editor"'
alias kxml='ekara'
