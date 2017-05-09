#!/bin/bash
# Edit
adda () { # add bash alias
  local SCRIPTNAME="$FUNCNAME"
  local sfile="${bash_conf:=~/.bash/conf}/alias-init.bash"
  OPTIND_OLD="$OPTIND"
  OPTIND=1
  Usage () {
    echo "Usage: \$SCRIPTNAME [-s] [filename]" 1>&2
  }
  while getopts hs: OPT
  do
    case "$OPT" in
      s)
        sfile="$bash_conf/modules/$OPTARG.sh"
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
  shift "$((OPTIND - 1))"
  OPTIND="$OPTIND_OLD"
  unset Usage
  if type "$1" >& /dev/null; then
    echo "[ERROR] This command is already exists. Overwrite? [y/'n']" 1>&2
    read ANSWER
    if [[ ! "$ANSWER" =~ [yY] ]];then
      return 0
    fi
  fi
  if [ -n "$1" -a -n "$2" ];then
    echo "alias $1='$2'" | tee -a "$sfile"
  else
    mvim -f +$ +"a|alias $1='$2'" "$sfile"
  fi
  exec $SHELL -l
}
addf () { # add bash functions
  local SCRIPTNAME="$FUNCNAME"
  local sfile="${bash_conf:=~/.bash/conf}/function-init.bash"
  OPTIND_OLD="$OPTIND"
  OPTIND=1
  Usage () {
    echo "Usage: $SCRIPTNAME [-s] [filename] [funcname]" 1>&2
  }
  while getopts hs: OPT
  do
    case "$OPT" in
      s)
        sfile="$bash_conf/modules/$OPTARG.sh"
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
  shift "$((OPTIND - 1))"
  OPTIND="$OPTIND_OLD"
  unset Usage
  if type "$1" >& /dev/null; then
    echo "[ERROR] This command is already exists. Overwrite? [y/'n']" 1>&2
    read ANSWER
    if [[ ! "$ANSWER" =~ [yY] ]];then
      return 0
    fi
  fi
  mvim -f +$ +"a|$1 () {" +"a|  " +"a|}" +-1 +"normal $" "$sfile"
  exec $SHELL -l
}
