#!/bin/bash
# Shell Functions
## sample
hw () {
  OPTIND_OLD="$OPTIND"
  OPTIND=1
  usage_exit() {
    echo "Usage: hw [-a] [-p text]"
  }
  while getopts ap:h OPT
  do
    case $OPT in
      a)  FLAG_A=1
        ;;
      p)  POSTFIX="$OPTARG"
        ;;
      h)  usage_exit
          return
        ;;
      \?) usage_exit
          return
        ;;
    esac
  done
  shift $(($OPTIND - 1))
  OPTIND=$OPTIND_OLD
  echo Hollo World!
  if [ "$FLAG_A" = 1 ];then
    pwd
  fi
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
gcm () {
  git add -A
  git commit -m "$1"
}
gpush () {
  if [ "$1" ];then
    git add -A
    git commit -m "$1"
  fi
  git push && afternotice
}
gtag () {
  git add -A
  git commit -m "$2"
  git tag -a "$1" -m "$2"
}
## other
alwrelease () {
  if pwd | grep -q 'Alfred.alfredpreferences/workflows/';then
    if [ -d .git ]; then
      echo Input name of workflow
      read Name
      echo Input Tag
      read Tag
      if [ ! -n "$Name" -a -n "$Tag" ];then
        zip -r "$Name.alfredworkflow" "$(git ls-files)"
        ghr "$Tag" "$Name".alfredworkflow
      else echo "No Workflow Name or Git Tag"
      fi
    else echo "Not a Git repository"
    fi
  else echo "Not a Alfred Workflow directory"
  fi
}
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
  echo "Move all to parent directory? [Y/n]"
  read ANSWER
  ANSWER=$(echo "$ANSWER" | tr y Y | tr -d '[\[\]]')
  case "$ANSWER" in
    ""|Y* )
      cd=$(pwd)
      for f in $(ls -A)
      do
        mv -f "$f" ../"$f"
      done
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
  mv "$1" ../_posts/$(date '+%Y-%m-%d')-"$title".md
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
echo "Add this function? [Y/n]"
read ANSWER
ANSWER=$(echo "$ANSWER" | tr y Y | tr -d '[\[\]]')
case "$ANSWER" in
  ""|Y* )
    cat "$tmp" >> ${bash_conf}/function-init.bash
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
  if [ "$dir" ]
    then
    cd "$dir"
    pwd
  else
    echo "ERROR:No hit"
  fi
}
gpa () {
  dir=$(ghq list -p "$1"|peco)
  if [ "$dir" ]
    then
    cd "$dir"
    pwd
  else
    echo "ERROR:No hit"
  fi
}
fr () {
  dir=$(ghq list -p "catfist/"|grep -im1 "$(ghq root)/.*/catfist/.*$1.*")
  if [ "$dir" ]
    then
      cd "$dir"
      pwd
    else
      q=$(echo $1|awk '{ print toupper(substr($0, 1, 1)) substr($0, 2, length($0) - 1) }') #capitarize
      dir=$(ghq list -p "catfist/"|grep -m1 "$(ghq root)/.*/catfist/.*$q.*")
    if [ "$dir" ]
    then
      cd "$dir"
      pwd
    else
      echo "ERROR:No hit"
    fi
  fi
}
fra () {
  dir=$(ghq list -p "$1"|grep -m1 ".*$1.*")
  if [ "$dir" ]
    then
    cd "$dir"
    pwd
  else
    q=$(echo $1|awk '{ print toupper(substr($0, 1, 1)) substr($0, 2, length($0) - 1) }') #capitarize
    dir=$(ghq list -p "$q"|grep -m1 ".*$q.*")
    if [ "$dir" ]
    then
      cd "$dir"
      pwd
    else
      echo "ERROR:No hit"
    fi
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
  file=$(ls -a ~/dotfiles|peco)
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
    echo "Add this script? [Y/n]"
    read ANSWER
    ANSWER=$(echo "$ANSWER" | tr y Y | tr -d '[\[\]]')
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
  curl --user $username:$password https://api.bitbucket.org/1.0/repositories/ --data name=$reponame --data is_private='true'
  git remote add origin git@bitbucket.org:$username/$reponame.git
  git push -u origin --all
}
addalias () {
  if [ -n "$1" -a -n "$2" ];then
    echo "alias $1='$2'" | tee -a ~/.bash/conf/alias-init.bash
    source ~/.bashrc
  else
    echo ERROR: Input Name & Alias
  fi
}
addbundle () {
  if [ "$(pbpaste | grep 'NeoBundle '\''[0-9a-zA-Z]\+/[0-9a-zA-Z.-]\+'\''')"  ];then
    pbpaste >> ~/.vim/conf/bundle-init-pluginlist.vim
    echo "Added Bundle \"$(pbpaste)\""
  else
    vim -c $ ~/.vim/conf/bundle-init-pluginlist.vim
  fi
}
fp () {
  OPTIND_OLD="$OPTIND"
  OPTIND=1
  usage_exit() {
    echo "Usage: fp [-eh]"
  }
  while getopts "eh" OPT
  do
    case $OPT in
      e)
        flag="$OPT"
        ;;
      h)  usage_exit
          return
        ;;
      \?)  echo "unknown option"
          usage_exit
          return
        ;;
    esac
  done
  shift $(($OPTIND - 1))
  OPTIND=$OPTIND_OLD
  bash_function="$bash_conf/function-init.bash"
  fname=$( grep '^[0-9a-zA-Z]\+ () {' "$bash_function" | sort | sed 's/ () {//' | peco )
  if [ "$flag" = e ];then
    vim "$bash_function" -c "/$fname" -c noh
  else
    type $fname
  fi
}
hlnpwd () {
  Host="$(ls $(ghq root)/|peco --prompt "Select Git Host:")"
  echo "Input Project Name"
  read Name
  Dir="$(ghq root)/$Host/catfist/$Name"
  if [ -d "$Dir" ];then
    echo "ERROR: Dirctory is exsiting"
  else
    hln $(pwd) $Dir
  fi
}
