#!/bin/bash
export PATH="./bin:~/shellscripts:/usr/local/bin:/usr/local/sbin:$HOME/.anyenv/bin:$PATH"
source ~/.bashrc
eval "$(rbenv init -)"
eval "$(anyenv init -)"
