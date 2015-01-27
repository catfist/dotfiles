#!/bin/bash
# Shell Functions
## sample
hwf () {
  OPTIND_OLD="$OPTIND"
  OPTIND=1
  POSTFIX=""
  usage_exit() {
    echo "Usage: hw [-a] [-p text]"
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
  shift $(("$OPTIND" - 1))
  OPTIND="$OPTIND_OLD"
  echo "Hollo World!$POSTFIX"
}
## git
gitconfig () {
  if [ -f .git/config ];then
    vim .git/config
  else
    vim ~/.gitconfig
  fi
}
gitignore () {
  if [ -f .gitignore ];then
    vim .gitignore
  else
    vim ~/.gitignore
  fi
}
# gcm () {
#   if [ -z "$1" ];then
#     echo "Imput commit message"
#     read message
#   else
#     message="$1"
#   fi
#   git commit -m "$message"
# }
gacm () {
  find . -maxdepth 1 -mindepth 1|peco --prompt "Select to git add:"|xargs git add
  echo "Input commit massage"
  read Message
  git commit -m "$Message"
}
gcma () {
  git add -A
  git commit -m "$1"
}
gps () {
  if [ "$1" ];then
    git commit -m "$1"
  fi
  git push && afternotice
}
gt () {
  git commit -m "$2"
  git tag -a "$1" -m "$2"
}
ga () {
  git add "$*"
  git status
}
## other
notice () {
    if [ "$1" ];then
      text="$1"
    else
      text="command is done"
    fi
    osascript -e "display notification \"$text\" with title \"iterm2\""
}
cb () {
  if [ -z "$1" ]
  then
    exp=sh
  else
    exp=$1
  fi
  if [ -z "$2" ]
  then
    edi="Sublime Text"
  else
    edi=$2
  fi
  tmp=/tmp/$( date '+%s' ).$exp
  pbpaste > "${tmp}"
  open -a "$edi" "$tmp"
}
gn () {
  file=${1##*/}
  name=${file%.*}
  cont=$( cat "$1" )
  geeknote create --title "$name" --content "$cont"
}
mvup () {
  ls -a
  echo "Move all to parent directory? ['Y'/n]"
  read ANSWER
  ANSWER=$(echo "$ANSWER" | tr y Y)
  case "$ANSWER" in
    ""|Y* )
      find . -mindepth 1 -maxdepth 1 -exec mv {} .{} \;
      cd=$(pwd)
      cd ..; rm -rf "$cd"; pwd; ls -A
      ;;
    *  )
      echo "Canceled";;
  esac
}
# MyHexo2
pub () {
  # PATH=$PATH:usr/local/bin
  gsed -i -e 's/status: d/status: p/' -e "s/^date: .*$/date: $(date '+%Y-%m-%d %H:%M')/" "$1" 
  title=$(grep -m1 'title:' "$1" | cut -c 8- | sed -e 's/ /-/g' -e 's/[\.\/]//g')
  mv "$1" ../_posts/"$(date '+%Y-%m-%d')-$title".md
}
addpath () {
  gsed -i "s%^\(export PATH=.*\)\"$%\1:${1}\"%" ~/.bash_profile
  source ~/.bash_profile
}
# from [Macで少し生産性の上がるBashエイリアス集 - RickyNews](http://www.rickynews.com/blog/2014/07/19/useful-bash-aliases/)
cdf () {
  target=$(osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')
  if [ "$target" != "" ]
  then
    cd "$target"
    pwd
  else
    echo 'No Finder window found' >&2
  fi
}
jj () {
  if [ "$1" ]; then
    JUMPDIR=$(find . -type d -maxdepth 1 | grep -i "$1" | head -n 1)
    if [[ -d "$JUMPDIR" && -n "$JUMPDIR" ]]; then
      cd "$JUMPDIR"
    else
      echo "directory not found"
    fi
  fi
}
afunction () {
  tmp=/tmp/$(date '+%s').sh
  echo "$1 () {

}" > "$tmp"
vim "$tmp" +2
echo "Add this function? ['Y'/n]"
read ANSWER
ANSWER=$(echo "$ANSWER" | tr y Y)
case "$ANSWER" in
  ""|Y* )
    cat "$tmp" >> $"bash_function"
    source ~/.bashrc
    ;;
  *  )
    echo "Canceled"
    ;;
esac
}
# ghq
gp () {
  dir=$(ghq list -p catfist/|grep -i "$(ghq root)/.*/catfist/.*$1.*"|peco)
  if [ -d "$dir" ]; then
    cd "$dir"
    pwd
  else
    echo "ERROR:No hit"
  fi
}
gpa () {
  dir=$(ghq list -p "$1"|peco)
  if [ -d "$dir" ]; then
    cd "$dir"
    pwd
  else
    echo "ERROR:No hit"
  fi
}
fr () {
  dir=$(ghq list -p "catfist/"|grep -im1 "$(ghq root)/[^/]*/catfist/.*$1.*")
  if [ -d "$dir" ]; then
    cd "$dir"
    pwd
  else
    echo "ERROR:No hit"
  fi
}
fra () {
  dir=$(ghq list -p|grep -im1 ".*$1.*")
  if [ -d "$dir" ]; then
    cd "$dir"
    pwd
  else
    echo "ERROR:No hit"
  fi
}
ghqfetch () {
  for repo in $(ghq list -p)
  do
    cd "$repo"
    pwd
    git fetch
  done
}
fdotfiles () {
  file=$(find . -mindepth 1 -maxdepth 1 ~/dotfiles|peco)
  if [ "$file" ];then
    vim "$file"
  fi
}
csh () {
  if [ "$1" ];then
    tmp=/tmp/$(date '+%s')_$1.sh
    echo "#!/bin/bash" > "${tmp}"
    echo "" >> "${tmp}"
    vim "${tmp}" +2
    echo "Add this script? [Y/'n']"
    read ANSWER
    ANSWER=$(echo "$ANSWER" | tr y Y)
    case "$ANSWER" in
      Y* )
        mv "${tmp}" ~/scripts/"$1".sh
        chmod +x ~/scripts/"$1".sh
        ln -s ~/scripts/"$1".sh /usr/local/bin/"$1"
        echo "Script created"
        ;;
      *  )
        echo "Canceled"
        ;;
    esac
  else
    echo Input script name
  fi
}
zp () {
  dir=$(z "$1" | peco)
  if [ "$dir" ]
    then
    cd "/${dir#*/}"
  fi
}
bbcreate () {
  username=catfist
  password=$(grep password ~/.bitbucket | sed 's/password = //')
  reponame="$1"
  curl --user "$username:$password" https://api.bitbucket.org/1.0/repositories/ --data name="$reponame" --data is_private='true'
  git remote add origin "git@bitbucket.org:$username/$reponame.git"
  git push -u origin --all
}
addalias () {
  if [ -n "$1" -a -n "$2" ];then
    echo "alias $1='$2'" | tee -a "$bash_alias"
    source "$bash_alias"
  else
    if [ -z "$1" ];then
      echo "Input alias name"
      read Name
    fi
    if [ -z "$2" ];then
      echo "Input alias substance"
      read Sub
    fi
    if [ -n "$Name" -a -n "Sub" ];then
      echo "alias $Name='$Sub'" | tee -a "$bash_alias"
      source "$bash_alias"
    else
      echo "Canceled"
    fi
  fi
}
addbundle () {
  if pbpaste | grep 'NeoBundle '\''[0-9a-zA-Z]\+/[0-9a-zA-Z.-]\+'\''';then
    pbpaste >> ~/.vim/conf/bundle-init-pluginlist.vim
    echo "Added Bundle \"$(pbpaste)\""
  else
    vim -c $ ~/.vim/conf/bundle-init-pluginlist.vim
  fi
}
qltext () { # qlmanage / quick look text
  qlmanage -px -c text "$1" >& /dev/null
}
qlimg () { # qlmanage / quick look image
  qlmanage -p "$1" >& /dev/null
}
initreadme () {
  echo readme | vim - README.md
}
fvb () {
  cd "$( find ~/.vim/bundle -maxdepth 1 -type d | peco )"
  pwd
}
kobitocreate () {
  cd ~/Dropbox/kobito
  touch "$1".md
  kobito link "$1".md
  open -a "FoldingText" "$1".md
}
snip () { # cd & edit neosnippet [fix]
  cd "$vim_conf/snippets"
  if [ -n "$1" ];then
    vim "$(find . -mindepth 1 -maxdepth 1 | grep -im1 "$1")"
  else
    vim "$(find . -mindepth 1 -maxdepth 1 | peco)"
  fi

  # CREATOR=USER
  # DIR=("$HOME/.vim/bundle/neosnippet-snippet/neosnippet-snippet" "$HOME/.vim/conf/snippets")
  # usage () {
  #   echo "snip [-b] [-h] [name]"
  # }
  # while getopts "hub" OPT
  # do
  #   case "$OPT" in
  #     h) usage ;;
  #     u) CREATOR=1 ;;
  #     b) CREATOR=0 ;;
  #     ?) echo "undifined option";usage ;;
  #   esac
  # done
  # cd ${DIR[$CREATOR]}
  # if [ -n "$1" ];then
  #   vim $(ls | grep -im1 "$1")
  # else
  #   vim $(ls | peco)
  # fi
}
list () { # alternative 'ls' with 'find'
  # initialize variables
  OPTNAME=""
  if [ -n "$1" ];then
    OPTNAME=" -name $1"
  fi
  find . -mindepth 1 -maxdepth 1"$OPTNAME"
}
apath () { # echo absolute path of argument
  local cmd="$(cd "$(dirname "$1")" && pwd)"/"$(basename "$1")"
  echo "$cmd"
  echo "$cmd" | pbcopy
}
ec () {
  if type "$1" | grep -q 'is a function';then
    vim "$bash_function" -c "/^$1 ()"
    source "$bash_function"
    return
  fi
  if type "$1" | grep -q 'is aliased';then
    vim "$bash_alias" -c "/^alias $1="
    source "$bash_alias"
    return
  fi
  if type "$1" | grep -q 'is /';then
    local cmdpath="$(which "$1")"
    if file "$cmdpath" | sed 's/^[^:]*: //' | grep -q 'text'; then
      mvim "$cmdpath"
      return
    else
      echo "Not text/script file"
      return
    fi
  fi
  if ! which "$1" 1>/dev/null ; then
    echo "This command is not existing"
    return
  else
    echo "This command is not editable"
    type "$1"
    return
  fi
}
