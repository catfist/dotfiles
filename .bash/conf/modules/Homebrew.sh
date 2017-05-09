#!/bin/bash

#
# Functions
#
update () { # [add] other package managers
  caffeinate brew update && brew upgrade && brew cleanup && brew cask cleanup && softwareupdate -i -a && gem update && afternotice
}
brewup () {
  caffeinate brew update && brew upgrade && brew cleanup && brew cask cleanup && afternotice &
}
brewd () {
  caffeinate brew doctor && afternotice &
}
brews () {
  brew search "$@" &
}
brewl () {
  brew list "$@" &
}
brewi () {
  brew install "$@" &
}
brewu () {
  brew uninstall "$@" &
}
brewf () {
  brew info "$@"
}
casks () {
  brew cask search "$@" &
}
caskl () {
  brew cask list "$@" &
}
caski () {
  brew cask install "$@" &
}
casku () {
  brew cask uninstall "$@" &
}
caskf () {
  brew cask info "$@"
}
hb () {
  local formulas=()
  while read formula; do
    formulas+=("$formula")
  done < <(brew search "$1")

  case "${#formulas[@]}" in
    0 )
      echo "ERROR: No hit." 1>&2
      return 1
      ;;
    1)
      echo "Found: ${formulas[*]}" 1>&2
      echo "install it?" 1>&2
      read answer
      if [[ ! "$answer" =~ ^n ]];then
        brew install "${formulas[*]}" &
      fi
      ;;
    *)
      formula="$(for i in "$@"; do echo "$i"; done | peco --prompt "select formula to install:")"
      brew install "$formula" &
      ;;
  esac
}
alias b='brew'
alias c='brew cask'
