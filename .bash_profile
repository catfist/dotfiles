#!/bin/bash
export PATH="$HOME/bin:$PATH:/usr/local/sbin:$HOME/.anyenv/bin:./bin"
source ~/.bashrc
eval "$(rbenv init -)"
eval "$(anyenv init -)"
# inspection
echo "" > "$bash_conf"/inspection.bash
