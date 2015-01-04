#!/bin/bash
bash_conf=~/.bash/conf
. "$(brew --prefix)/etc/profile.d/z.sh"
# bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
# set -o vi #vi keybind

# PROMPT
# PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}\$(__git_ps1)\007"'
PS1="\h@\u:\W\$(__git_ps1) \$ "

# read config files
# . $bash_conf/*
## if read in order
. $bash_conf/variable-init.bash # 変数の設定
. $bash_conf/alias-init.bash    # aliasの設定
. $bash_conf/function-init.bash # 関数の設定
. ~/.bash/git-completion.bash
# . $bash_conf/prompt-init.bash   # プロンプトの設定
