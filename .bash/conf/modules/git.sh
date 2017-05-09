#!/bin/bash

#
# Aliases
#
alias gst='git status'
alias grmd='git rm $(git ls-files --deleted)'
alias grmig='git rm --cached $(git ls-files --full-name -i --exclude-standard)'

#
# Functions
#
gcm () {
  git commit "${1:+"-m "}$*"
}
# gacm () { # git add & commit
#   find . -maxdepth 1 -mindepth 1|peco --prompt "Select to git add:"|xargs git add
#   echo "Input commit massage" 1>&2
#   read Message
#   git commit -m "$Message"
# }
gpush () { # git push
  if [ "$1" ];then
    git commit -m "$*"
  fi
  git push && afternotice
}
gt () { # git tag
  git commit -m "$2"
  git tag -a "$1" -m "$2"
}
ga () { # git add
  git add "$*"
  git status
}
gpa () { # git add with peco
  git status | sed -n 's/	//p' | peco | sed 's/[^:]*://' | xargs git add
}
gcp () { # git checkout with peco
  branch="$(git branch --list | peco --prompt "Select branches:")"
  git checkout "${branch}"
}
