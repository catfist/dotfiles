#!/bin/bash
export GOENV_ROOT="$HOME/.goenv"
export GOPATH="$HOME/gocode"
export PATH="$HOME/bin:$PATH:/usr/local/sbin:$HOME/.anyenv/bin:$GOENV_ROOT/bin:$GOPATH/bin:./bin"
HISTFILESIZE=10000

. ~/.bashrc

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
if type anyenv >& /dev/null; then
  eval "$(anyenv init -)"  
fi
if type goenv >& /dev/null; then
  eval "$(goenv init -)"
fi
