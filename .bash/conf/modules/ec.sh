#!/bin/bash
ec () {
  ############################################################ 
  # [Description]
  #
  # Edit bash commands.
  # * If you source aliases/functions from other than ~/.bashrc, put them to...
  #   * ~/.bash*
  #   * ~/.bash/*
  # * If you put exexutable text-script file in $PATH, put them under the $HOME.
  #
  ############################################################  

  #
  # Initialize variables.
  #
  local dflag=0 pflag=0 dir result cmd cmdpath sfile SCRIPTNAME="$FUNCNAME"

  #
  # Set Functions.
  #
  Usage () {
    echo "Usage: $SCRIPTNAME [-dfph] <command name>" 1>&2
    echo "-d: Delete command." 1>&2
    echo "-f: Find command to edit." 1>&2
    echo "-p: Print aliased to/function or 'what' is file, and copy code."  1>&2
    echo "-h: Print help." 1>&2
  }

  #
  # getopts
  #
  local OPTIND_OLD="$OPTIND"
  local OPTIND=1
  while getopts dpf:h OPT
  do
    case $OPT in
      d)
        dflag=1
        ;;
      p)
        pflag=1
        ;;
      f)
        while read result; do
          cmd="$result"
        done < <(
          {
            declare -F | awk '{print $3}' | sed -e '/^_/d' -e 's/^/function: /g'        
            echo "$PATH" | tr ':' '\n' | grep "^$HOME" | grep -v '/\.' | while read dir; do
            ls -1 "$dir"| sed 's/^/file    : /g'
            done
          } | grepeco -p "Select command to edit:" "$OPTARG" | awk -F'[: ]' '{print $2}'
        )
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
  unset -f Usage

  #
  # Error check.
  #
  cmd="${cmd:=$1}"
  if ! type "$cmd" >&/dev/null; then
    echo "[ERROR] Not found command name to edit." 1>&2
    return 1
  fi

  #
  # Process
  #
  case "$(type -t "$cmd")" in
    "function" )
      # Get sourced file.
      while read i; do
        # sfiles+=("$i")
        sfile="$i"
      done < <(shopt -s extdebug; declare -F "$cmd" | awk '{print $3}')
      # Process
      if [ "$pflag" = 1 ]; then
        type "$cmd" | sed -e 1d -e 's/;$//g' | tee >(pbcopy)
        return 0
      elif [ "$dflag" = 1 ]; then
        echo -e "function deleted: \033[032;m$1\033[0m" 1>&2
        sed -i '' "/^$cmd ()/,/^}/d" "$sfile"
      else
        mvim "$sfile" +"/^$cmd ()"
      fi
      exec "$SHELL" -l
      ;;
    "alias" )
      sfile="$(grep -rslI "^alias $cmd" ~/.bash*)"
      if [ "$pflag" = 1 ]; then
        type "$cmd" | sed -e 's/.* to `//' -e "s/'$// | tee >(pbcopy)" 1>&2
        return 0
      elif [ "$dflag" = 1 ]; then
        gsed -n "s/^alias \($cmd=.*\)/alias deleted: \x1b[33;m\1\x1b[0m/p" "$sfile" 1>&2
        gsed -i "/^alias $cmd=/d" "$sfile"
      else
        mvim "$sfile" +"/^alias $cmd="
      fi
      exec "$SHELL" -l
      ;;
    "file")
      cmdpath="$(type -p "$cmd")"
      if file -b "$cmdpath" | grep -q 'text'; then
        if [ "$pflag" = 1 ]; then
          what "$cmdpath"
          pbcopy < "$cmdpath"
          return 0
        elif [ "$dflag" = 1 ]; then
          echo "removed: "
          rm -v "$cmdpath"
          readlink "$cmdpath" | xargs rm -v
          return 0
        else
          mvim "$cmdpath"
        fi
      else
        echo "Not text/script file" 1>&2
        return 1
      fi
      ;;
    * )
      type "$cmd"
      return 1
      ;;
  esac
}
