#!/bin/bash
# Shell Functions
# initialize - unset all functions
for f in $(declare -F | cut -d' ' -f3); do unset -f "$f"; done

# source
. $bash_conf/functions/*

#########################
# code
#########################
## sample
hwf () { # test function
  OPTIND_OLD="$OPTIND"
  OPTIND=1
  POSTFIX=""
  Usage () {
    echo "Usage: hw [-a] [-p text]" 1>&2
  }
  while getopts ap:h OPT
  do
    case $OPT in
      a) pwd 
        ;;
      p)  POSTFIX=" $OPTARG"
        ;;
      h)  Usage_exit
        return
        ;;
      \?) Usage_exit
        return
        ;;
    esac
  done
  shift $((OPTIND - 1))
  OPTIND="$OPTIND_OLD"
  echo "Hollo World!$POSTFIX"
}
# general
notify () { # display notification
  local app="iterm2"
  local text="$1:-Command is done."
  osascript -e "display notification \"$text\" with title \"app\""
}
message () {
  echo "${SCRIPTNAME:-$0}:" "$*" 1>&2
}
# bash
adda () { # add bash alias
  if type "$1" >& /dev/null; then
    echo "ERROR: This command is already exists. Overwrite? [y/'n']" 1>&2
    read ANSWER
    if [[ ! "$ANSWER" =~ [yY] ]];then
      return 0
    fi
  fi
  if [ -n "$1" -a -n "$2" ];then
    echo "alias $1='$2'" | tee -a "$bash_alias"
  else
    vim +$ +"a|alias $1='$2'" "$bash_alias"
  fi
  source ~/.bashrc
}
addf () { # add bash functions
  if type "$1" >& /dev/null; then
    echo "ERROR: This command is already exists. Overwrite? [y/'n']" 1>&2
    read ANSWER
    if [[ ! "$ANSWER" =~ [yY] ]];then
      return 0
    fi
  fi
  vim +$ +"a|$1 () {" +"a|  " +"a|}" +-1 +"normal $" "$bash_function"
  source ~/.bashrc
}
chis () { # copy shell history
  history $(($1 + 1)) | head -n 1 | cut -d ' ' -f 5- | pbcopy
  echo -n "copied: "; pbpaste 
}
shis () { # search shell history
  history | sort -r | sed 1d | grep "$*" | peco --prompt "Select history to copy:" | cut -d ' ' -f 5- | pbcopy
  pbpaste
}
alias phis=shis
alias rhis='eval "$(shis "$1")"'
ccmd () {
  {
    echo "$ $*"
    eval "$*" 2>&1
  } | pbcopy
  pbpaste
}
## git
# gcm () {
#   if [ -z "$1" ];then
#     echo "Imput commit message" 1>&2
#     read message
#   else
#     message="$1"
#   fi
#   git commit -m "$message"
# }
gacm () { # git add & commit
  find . -maxdepth 1 -mindepth 1|peco --prompt "Select to git add:"|xargs git add
  echo "Input commit massage" 1>&2
  read Message
  git commit -m "$Message"
}
gcma () { # git commit with add all
  git add -A
  git commit -m "$*"
}
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
  local res
  local branch=$(git branch --list | peco --prompt "Select branches:")
  git checkout "${branch}"
}
# MyHexo2
pub () { # publish articles with static site generator
  # PATH=$PATH:usr/local/bin
  gsed -i -e 's/status: d/status: p/' -e "s/^date: .*$/date: $(date '+%Y-%m-%d %H:%M')/" "$1" 
  title=$(grep -m1 'title:' "$1" | cut -c 8- | sed -e 's/ /-/g' -e 's/[\.\/]//g')
  mv "$1" ../_posts/"$(date '+%Y-%m-%d')-$title".md
}
# from [Macで少し生産性の上がるBashエイリアス集 - RickyNews](http://www.rickynews.com/blog/2014/07/19/useful-bash-aliases/)
cdf () { # change working directory to current directory in Finder.app
  local target="$(osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')"
  if [ "$target" != "" ]
  then
    cd "$target"
    pwd
  else
    echo 'No Finder window found' 1>&2
  fi
}
jj () { # jump to directory with grep with argument
  if [ "$1" ]; then
    JUMPDIR=$(find . -type d -maxdepth 1 | grep -i "$1" | head -n 1)
    if [[ -d "$JUMPDIR" && -n "$JUMPDIR" ]]; then
      cd "$JUMPDIR"
    else
      echo "directory not found" 1>&2
    fi
  fi
}
# ghq
fr () { # find repositories made by own
  if ! type grepeco >&/dev/null; then
    echo "ERROR: This script depends on 'grepeco'" 1>&2
    return 1
  fi
  local limit="catfist/"
  OPTIND_OLD="$OPTIND"
  OPTIND=1
  Usage () {
    echo "Usage: fr [-ah] <word>" 1>&2
  }
  while getopts ah OPT
  do
    case $OPT in
      a)
        limit=""
        ;;
      h)
        Usage
        return 0
        ;;
      ?)
        Usage
        return 1
        ;;
    esac
  done
  shift $((OPTIND - 1))
  OPTIND="$OPTIND_OLD"
  unset Usage
  dir="$(ghq root)"/"$(ghq list "$limit" | grepeco -p "select repo:" "$@")"
  [ "$(ghq root)/" = "$dir" ] && echo "ERROR: No hit." 1>&2 && return 1
  if [ -p /dev/stdout ];then
    echo "$dir"
  else
    cd "$dir"
  fi
}
# vim
fvb () { # find vim bundle
  cd "$( find ~/.vim/bundle -maxdepth 1 -type d | peco )"
  pwd
}
# Homebrew
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
  brew info "$@" &
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
  brew cask info "$@" &
}
hb () {
  formulas=()
  while read formula; do
    formulas+=("$formula")
  done < <(brew search "$1") &

  case "${#formulas[@]}" in
    0 )
      echo "ERROR: No hit." 1>&2
      return 1
      ;;
    1)
      echo "Found: ${formulas[*]}" 1>&2
      echo "install it?" 1>&2
      read answer
      if [[ ! "$answer" =~ '^n' ]];then
        brew install "${formulas[*]}" &
      fi
      ;;
    *)
      formula="$( IFS=$'\n';echo "${args[*]}" | peco --prompt "select formula to install:")"
      brew install "$formula" &
      ;;
  esac
}
# other
qltext () { # qlmanage / quick look text
  qlmanage -px -c text "$1" >& /dev/null
}
qlimg () { # qlmanage / quick look image
  qlmanage -p "$1" >& /dev/null
}
ebash () { # edit bash config files
  FILE="$({
  find ~ \( -type f -o -type l \) \( -name '*.bash' -o -name '.bash*' ! -name '.bash_history' \) -mindepth 1 -maxdepth 1
  find ~/.bash \( -type f -o -type l \) -name '*.bash' ! -path '*/bundle/*' -mindepth 1 -maxdepth 3
} | grepeco -p "select file:" "$*")"
if [ -n "$FILE" ];then
  vim "$FILE"
  source ~/.bashrc
fi
}
wcd () { # wrapper of cd:with piped stdin/find directory
  if [ ! -p /dev/stdin ]; then
    if [ $# -ge 1 ]; then
      if [ -d "$1" ];then
        # echo "cd: $1"
        cd "$1"
        return 0
      fi
      if [ -f "$1" ];then
        # echo "cd $(dirname "$1")"
        cd "$(dirname "$1")"
        return 0
      fi
      cd "$(find . -maxdepth 5 -mindepth 1 -type d -name "*$1*" | grepeco -p "Select dir to cd:")"
      shift
      if [ $# -ge 1 ]; then
        echo "Too many arguments. After second arguments are not processed." 1>&2
      fi
    else
      cd "$(find . -maxdepth 5 -mindepth 1 -type d | peco -prompt "Select dir to cd:")"
    fi
  else
    osascript -e "tell application \"iTerm\" to tell current session of current terminal to write text \"cd $(cat -)\""
  fi
}
tps () { # toggle PS1 (shell prompt)
  local defaultPS1=$(sed -n 's/^ *export PS1="\(.*\)"/\1/p' ~/.bashrc)
  local subPS1="\$ "
  if [ "$PS1" = "$subPS1" ];then
    PS1=$defaultPS1
  else
    PS1=$subPS1
  fi
}
fcd () {
  cd "$(find . -maxdepth 5 -mindepth 1 -type d | grepeco -p "Select dir to cd:" "$1")"
}
pcd () {
  if [ ! -p /dev/stdin ]; then
    if [ $# -ge 1 ]; then
      cd "$1"
      shift
      if [ $# -ge 1 ]; then
        echo "Too many arguments. After second arguments are not processed."
      fi
    else
      echo "ERROR: No stdin or argument"
      return 1
    fi
  else
    osascript -e "tell application \"iTerm\" to tell current session of current terminal to write text \"cd $(cat -)\""
  fi
} 
tim () {
  command nohup timer "$*" &
}
fp () {
  type "$(sed -nE "s/(^[0-9a-z]+) \(\) ? {?/\1/gp" "$bash_function"|grepeco "ebash"|cut -d" " -f1)"|sed 1d
}
# search in browser
g () {
  query="$(nkf -WwMQ <<< "$@" | tr = %)"
  open https://www.google.co.jp/\?gws_rd=ssl# q="$query"
}
gj () {
  query="$(nkf -WwMQ <<< "$@" | tr = %)"
  open https://www.google.co.jp/\?gws_rd=ssl# q="$query"\&tbs=lr:lang_1ja\&lr=lang_ja
}
ft () {
  if [ ! -e "$1" ]; then
    touch "$1"
  fi 
  open -a "FoldingText" "$1"
}
mvf () {
  if [ ! -d "$2" ] && [[ ! "$2" =~ '.*/' ]]; then
    tdir="$(dirname "$2")"
  else
    tdir="$2"
  fi
  mkdir "$tdir" >& /dev/null && mv "$1" "$2"
}
