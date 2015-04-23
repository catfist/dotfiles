#!/bin/bash
# Shell Functions
for f in $(declare -F | cut -d' ' -f3); do unset -f "$f"; done
## sample
hwf () { #test function
  OPTIND_OLD="$OPTIND"
  OPTIND=1
  POSTFIX=""
  usage_exit() {
    echo "Usage: hw [-a] [-p text]" 1>&2
  }
  while getopts ap:h OPT
  do
    case $OPT in
      a) pwd 
        ;;
      p)  POSTFIX=" $OPTARG"
        ;;
      h)  usage_exit
        return
        ;;
      \?) usage_exit
        return
        ;;
    esac
  done
  shift $((OPTIND - 1))
  OPTIND="$OPTIND_OLD"
  echo "Hollo World!$POSTFIX"
}
# bash
ec () { #edit shell commands
  local dflag=0
  local pflag=0
  local OPTIND_OLD="$OPTIND"
  local OPTIND=1
  usage () {
    echo "Usage: ec [-dph] <comand name>" 1>&2
    echo "-d: delete command." 1>&2
    echo "-p: print aliased to/function or 'what' is file, and copy code."  1>&2
    echo "-h: print help." 1>&2
  }
  while getopts dph OPT
  do
    case $OPT in
      d)
        dflag=1
        ;;
      p)
        pflag=1
        ;;
      h)
        usage
        return 0
        ;;
      ?)
        usage
        return 1
        ;;
    esac
  done 
  shift $((OPTIND - 1))
  OPTIND="$OPTIND_OLD"
  if [ -z "$1" ]; then
    echo "ERROR: input command name to edit" 1>&2
    return 1
  fi
  if ! type "$1" >&/dev/null; then
    echo "ERROR: Undifined command." 1>&2
    return 1
  fi
  case "$(type -t "$1")" in
    "function" )
      if [ "$pflag" = 1 ]; then
        type "$1" | sed -e 1d -e 's/;$//g' | tee >(pbcopy)
        return 0
      fi
      if [ "$dflag" = 0 ]; then
        vim "$bash_function" +"/^$1 ()"
      else
        echo -e "function deleted: \033[032;m$1\033[0m" 1>&2
        sed -i '' "/^$1 () {/,/^}/d" "$bash_function" 1>&2
      fi
      source ~/.bashrc
      ;;
    "alias" )
      if [ "$pflag" = 1 ]; then
        type "$1" | sed -e 's/.* to `//' -e "s/'$// | tee >(pbcopy)" 1>&2
        return 0
      fi
      if [ "$dflag" = 0 ]; then
        vim "$bash_alias" +"/^alias $1="
      else
        gsed -n "s/^alias \($1=.*\)/alias deleted: \x1b[33;m\1\x1b[0m/p" "$bash_alias" 1>&2
        gsed -i "/^alias $1=/d" "$bash_alias"
      fi
      source ~/.bashrc
      ;;
    "file")
      local cmdpath="$(type -p "$1")"
      if file -b "$cmdpath" | grep -q 'text'; then
        if [ "$pflag" = 1 ]; then
          what "$cmdpath"
          pbcopy < "$cmdpath"
          return 0
        fi
        if [ "$dflag" = 1 ]; then
          rm "$cmdpath"
          echo "removed: '$cmdpath'" 1>&2
          return 0
        fi
        mvim "$cmdpath"
      else
        echo "Not text/script file" 1>&2
        return 1
      fi
      ;;
    "keyword"|"builtin")
      echo "$1 is shell keyword or builtin." 1>&2
      return 1
      ;;
    * )
      echo "Unexpected error." 1>&2
      type "$1"
      return 1
      ;;
  esac
}
adda () { #add bash alias
  if type "$1" >& /dev/null; then
    echo "ERROR: This command is already exists." 1>&2
    return 1
  fi
  if [ -n "$1" -a -n "$2" ];then
    echo "alias $1='$2'" | tee -a "$bash_alias"
  else
    vim +$ +"a|alias $1='$2'" "$bash_alias"
  fi
  source ~/.bashrc
}
addf () { #add bash functions
  if type "$1" >& /dev/null; then
    echo "ERROR: This command is already exists." 1>&2
    return 1
  else
    vim +$ +"a|$1 () {" +"a|  " +"a|}" +-1 +"normal $" "$bash_function"
    source ~/.bashrc
  fi
}
chis () { #copy shell history
  num=1
  grep -q '^[0-9]$' <<< "$1" && num="$1"
  history "$((num+1))" | head -n 1 | cut -d ' ' -f 5- | pbcopy
  pbpaste 
}
shis () { #search shell history
  if grep -q '^[0-9]\+$' <<< "$1";then
    history $(($1 + 1))
  else
    history
  fi | sort -r | sed 1d | peco --prompt "Select history to copy:" | cut -d ' ' -f 5- | pbcopy
  pbpaste
}
alias phis=shis
rhis () { #run shell history
  eval "$(shis "$1")"
}
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
gacm () { #git add & commit
  find . -maxdepth 1 -mindepth 1|peco --prompt "Select to git add:"|xargs git add
  echo "Input commit massage" 1>&2
  read Message
  git commit -m "$Message"
}
gcma () { #git commit with add all
  git add -A
  git commit -m "$*"
}
gpush () { #git push
  if [ "$1" ];then
    git commit -m "$*"
  fi
  git push && afternotice
}
gt () { #git tag
  git commit -m "$2"
  git tag -a "$1" -m "$2"
}
ga () { #git add
  git add "$*"
  git status
}
gpa () { #git add with peco
  git status | sed -n 's/	//p' | peco | sed 's/[^:]*://' | xargs git add
}
gcp () { #git checkout with peco
  local res
  local branch=$(git branch --list | peco --prompt "Select branches:")
  git checkout "${branch}"
}
# general
notice () { #display notification
  if [ "$1" ];then
    text="$1"
  else
    text="command is done"
  fi
  osascript -e "display notification \"$text\" with title \"iterm2\""
}
gn () { #geeknote
  file=${1##*/}
  name=${file%.*}
  cont=$( cat "$1" )
  geeknote create --title "$name" --content "$cont"
}
# MyHexo2
pub () { #publish articles with static site generator
  # PATH=$PATH:usr/local/bin
  gsed -i -e 's/status: d/status: p/' -e "s/^date: .*$/date: $(date '+%Y-%m-%d %H:%M')/" "$1" 
  title=$(grep -m1 'title:' "$1" | cut -c 8- | sed -e 's/ /-/g' -e 's/[\.\/]//g')
  mv "$1" ../_posts/"$(date '+%Y-%m-%d')-$title".md
}
# from [Macで少し生産性の上がるBashエイリアス集 - RickyNews](http://www.rickynews.com/blog/2014/07/19/useful-bash-aliases/)
cdf () { #change working directory to current directory in Finder.app
  local target="$(osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')"
  if [ "$target" != "" ]
  then
    cd "$target"
    pwd
  else
    echo 'No Finder window found' 1>&2
  fi
}
jj () { #jump to directory with grep with argument
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
fr () { #find repositories made by own
  if ! type grepeco >&/dev/null; then
    echo "ERROR: This script depends on 'grepeco'" 1>&2
    return 1
  fi
  local limit="catfist/"
  OPTIND_OLD="$OPTIND"
  OPTIND=1
  usage () {
    echo "Usage: fr [-ah] <word>" 1>&2
  }
  while getopts ah OPT
  do
    case $OPT in
      a)
        limit=""
        ;;
      h)
        usage
        return 0
        ;;
      ?)
        usage
        return 1
        ;;
    esac
  done
  shift $((OPTIND - 1))
  OPTIND="$OPTIND_OLD"
  dir="$(ghq root)"/"$(ghq list "$limit" | grepeco -p "select repo:" "$@")"
  [ "$(ghq root)/" = "$dir" ] && echo "ERROR: No hit." 1>&2 && return 1
  if [ -p /dev/stdout ];then
    echo "$dir"
  else
    cd "$dir"
  fi
}
# vim
fvb () { #find vim bundle
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
ebash () { #edit bash config files
  FILE="$({
  find ~ \( -type f -o -type l \) \( -name '*.bash' -o -name '.bash*' ! -name '.bash_history' \) -mindepth 1 -maxdepth 1
  find ~/.bash \( -type f -o -type l \) -name '*.bash' ! -path '*/bundle/*' -mindepth 1 -maxdepth 3
} | grepeco -p "select file:" "$*")"
if [ -n "$FILE" ];then
  vim "$FILE"
  source ~/.bashrc
fi
}
pcd () { #change working directory with piped stdin
  if [ ! -p /dev/stdin ]; then
    if [ $# -ge 1 ]; then
      if [ -d "$1" ];then
        cd "$1"
      fi
      if [ -f "$1" ];then
        cd "$(dirname "$1")"
      fi
      shift
      if [ $# -ge 1 ]; then
        echo "Too many arguments. After second arguments are not processed." 1>&2
      fi
    else
      echo "ERROR: No stdin or argument" 1>&2
      return 1
    fi
  else
    osascript -e "tell application \"iTerm\" to tell current session of current terminal to write text \"cd $(cat -)\""
  fi
}
tps () { #toggle PS1 (shell prompt)
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
