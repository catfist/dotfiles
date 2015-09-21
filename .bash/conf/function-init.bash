#!/bin/bash
# Shell Functions
# initialize - unset all functions
while read func; do
  unset -f "$func"
done < <(declare -F | awk '{print $3}')

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

#
# General
#
notify () { # display notification
  local app="iterm2"
  local text="$1:-Command is done."
  osascript -e "display notification \"$text\" with title \"$app\""
}
Message () {
  echo -e "${SCRIPTNAME:-$0}:" "$*" 1>&2
}

#
# bash
#
# History
chis () { # copy shell history
  history $(($1 + 1)) | head -n 1 | sed 's/^ *[0-9]* *//' | pbcopy
  echo -n "copied: "; pbpaste 
}
shis () { # search shell history
  history | sort -r | sed 1d | grep "$*" | peco --prompt "Select history to copy:" | sed 's/^  [0-9]*  //' | pbcopy
  pbpaste
}
alias phis=shis
rhis () {
  eval "$(shis "$1")"
}
ccmd () {
  {
    echo "$ $*"
    eval "$*" 2>&1
  } | pbcopy
  pbpaste
}

#
# Other
#
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
# vim
fvb () { # find vim bundle
  cd "$( find ~/.vim/bundle -maxdepth 1 -type d | peco )"
  pwd
}
# other
qltext () { # qlmanage / quick look text
  qlmanage -px -c text "$1" >& /dev/null
}
qlimg () { # qlmanage / quick look image
  qlmanage -p "$1" >& /dev/null
}
ebash () { # edit bash config files [fix] Can't open file
  {
    find ~ \( -type f -o -type l \) -name '.bash*' ! -name '.bash_history'  -maxdepth 1
    find ~/.bash/* \( -type f -o -type l \) -name '*.bash' $(printf "! -name %s " $(git config --get core.excludesFile | sed "s@^~@$HOME@" | xargs egrep -v '^$|^#'))
  } | grepeco -p "Select file:" "$*" | xargs mvim -f && source ~/.bashrc
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
      echo "[ERROR] No stdin or argument"
      return 1
    fi
  else
    osascript -e "tell application \"iTerm\" to tell current session of current terminal to write text \"cd $(cat -)\""
  fi
} 
tim () {
  command nohup timer "$*" &
}
# search in browser
# g () {
#   query="$(nkf -WwMQ <<< "$@" | tr = %)"
#   open https://www.google.co.jp/\?gws_rd=ssl# q="$query"
# }
# gj () {
#   query="$(nkf -WwMQ <<< "$@" | tr = %)"
#   open https://www.google.co.jp/\?gws_rd=ssl# q="$query"\&tbs=lr:lang_1ja\&lr=lang_ja
# }
ft () {
  if [ ! -e "$1" ]; then
    touch "$1"
  fi 
  open -a "FoldingText" "$1"
}
mvf () {
  if [ ! -d "$2" ] && [[ ! "$2" =~ .*/ ]]; then
    tdir="$(dirname "$2")"
  else
    tdir="$2"
  fi
  mkdir "$tdir" >& /dev/null && mv "$1" "$2"
}
