#!/bin/bash
# set -o vi

# TITLE / PROMPT
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}\007"'
# MonoColored prompt
# export PS1="\$(__git_ps1)[\w]\n\$ "

# read config files
#. $bash_conf/*
# if read in order
export bash_conf=~/.bash/conf
. $bash_conf/variable-init.bash
. $bash_conf/alias-init.bash
. $bash_conf/function-init.bash
export bash_alias="$bash_conf/alias-init.bash"
export bash_function="$bash_conf/function-init.bash"
export bash_variable="$bash_conf/variable-init.bash"
# inspection
. $bash_conf/inspection.bash

# integration
if [ -f "$(brew --prefix)"/etc/profile.d/z.sh ]; then
  . "$(brew --prefix)"/etc/profile.d/z.sh
fi
if [ -f "$(brew --prefix)"/etc/bash_completion ]; then
  . "$(brew --prefix)"/etc/bash_completion
fi
if [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ]; then
  # . /usr/local/etc/bash_completion.d/git-prompt.sh
  # . /usr/local/etc/bash_completion.d/git-completion.bash
  # export GIT_PS1_SHOWDIRTYSTATE=true
  # export PS1="\[\033[34m\][\w]\[\033[31m\]$(__git_ps1)\[\033[00m\]\\n\$ "
  export PS1="\[\033[34m\][\w]\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ "
else
  echo "Not found: $(brew --prefix)/etc/bash_completion.d/git-completion.bash" 1>&2
fi
## Display modified time
#stat -f "%N = %Sm" -t "%Y-%m-%d %H:%M"  ~/.bashrc
#find $bash_conf -mindepth 1 -exec stat -f "%N = %Sm" -t "%Y-%m-%d %H:%M" {} \;
