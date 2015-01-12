#!/bin/bash
bash_conf=~/.bash/conf
if [ -f $(brew --prefix)/etc/profile.d/z.sh ];then
  . $(brew --prefix)/etc/profile.d/z.sh
fi
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
# set -o vi

# PROMPT
# PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}\$(__git_ps1)\007"'
# PS1="\h@\u:\W\$(__git_ps1) \n\$ "
PS1="\W\$(__git_ps1) \n\$ "

# read config files
#. $bash_conf/*
# if read in order
. $bash_conf/variable-init.bash
. $bash_conf/alias-init.bash
. $bash_conf/function-init.bash
. $bash_conf/git-completion.bash
# . $bash_conf/prompt-init.bash   # プロンプトの設定

## Display modified time
#stat -f "%N = %Sm" -t "%Y-%m-%d %H:%M"  ~/.bashrc
#find $bash_conf -mindepth 1 -exec stat -f "%N = %Sm" -t "%Y-%m-%d %H:%M" {} \;
