#!/bin/bash
# set -o vi
# ref: http://rcmdnk.github.io/blog/2013/06/01/computer-bash-linux-mac/#bash
tty -s && stty stop undef # C-s
tty -s && stty start undef # C-q

# read config files
#. $bash_conf/*
# if read in order
export bash_conf="$HOME/.bash/conf"
. "$bash_conf/variable-init.bash"
. "$bash_conf/alias-init.bash" # Init aliases
. "$bash_conf/function-init.bash" # Init functions
# source
# declare -x bash_conf
for sfile in "$bash_conf/modules/"*; do
  source "$sfile"
done
unset sfile # to avoid to succeed var to teminal.

# integration
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  . "$(brew --prefix)/etc/bash_completion"
fi
if [ -f "$(brew --prefix)/etc/bash_completion.d/brew-cask" ]; then
  . "$(brew --prefix)/etc/bash_completion.d/brew-cask"
fi
if [ -f "$(brew --prefix)/etc/bash_completion.d/git-prompt.sh" ]; then
  . "$(brew --prefix)/etc/bash_completion.d/git-prompt.sh"
  . "$(brew --prefix)/etc/bash_completion.d/git-completion.bash"
fi

# TITLE / PROMPT
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}\007"'
# MonoColored prompt
# export PS1="\$(__git_ps1)[\w]\n\$ "

function __jobs_ps1 () {
  jobs_number="$(jobs | grep -cE "Running|Stopped")"
  if [ "$jobs_number" -gt 0 ]; then
    echo "jobs:$jobs_number"
    echo ""
  fi
}
export PS1="\[\033[32m\][\t] \[\033[34m\][\w]\[\033[31m\]\$(__git_ps1)\[\033[00m\]\$(__jobs_ps1)\n\$ \[\033[0m\]"
# export PS1="\[\033[34m\][\w]\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ "
