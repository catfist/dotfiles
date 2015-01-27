#!/bin/bash
# integration
if [ -f "$(ghq root)/github.com/b4b4r07/favdir/favdir.sh" ]; then
  . "$(ghq root)/github.com/b4b4r07/favdir/favdir.sh"
fi
if [ -f "$(brew --prefix)"/etc/profile.d/z.sh ]; then
  . "$(brew --prefix)"/etc/profile.d/z.sh
fi
if [ -f "$(brew --prefix)"/etc/bash_completion ]; then
  . "$(brew --prefix)"/etc/bash_completion
fi
if [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ]; then
  . "$(brew --prefix)/etc/bash_completion.d/git-completion.bash"
fi
# set -o vi

# TITLE / PROMPT
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}\007"'
# PS1="\h@\u:\W\$(__git_ps1) \n\$ "
PS1="[\w]\$(__git_ps1) $(inputsource|sed 's/.*\.//')\n\$ "

# read config files
#. $bash_conf/*
# if read in order
export bash_conf=~/.bash/conf
. $bash_conf/variable-init.bash
. $bash_conf/alias-init.bash
. $bash_conf/function-init.bash
export bash_alias="$bash_conf/alias-init.bash"
export bash_function="$bash_conf/function-init.bash"
# . $bash_conf/prompt-init.bash   # プロンプトの設定

## Display modified time
#stat -f "%N = %Sm" -t "%Y-%m-%d %H:%M"  ~/.bashrc
#find $bash_conf -mindepth 1 -exec stat -f "%N = %Sm" -t "%Y-%m-%d %H:%M" {} \;
