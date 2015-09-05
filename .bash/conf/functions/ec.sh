#!/bin/bash
ec () { # Edit shell commands
  #
  # Initialize variables.
  #
  local dflag=0
  local pflag=0
  local cmd=""
  local cmdpath=""
  local sfile=""
  # declare bash_function bash_alias bash_conf

  #
  # Set Functions.
  #
  Usage () {
    echo "Usage: ${FUNCNAME} [-dfph] <command name>" 1>&2
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
            declare -F | cut -d' ' -f3- | sed -e '/^_/d' -e 's/^/function: /g'        
            echo "$PATH" | tr ':' '\n' | grep "^$HOME" | grep -v '/\.' | while read dir; do
            ls -1 "$dir"| sed 's/^/file: /g'
            done
          } | grepeco -p "Select command to edit:" "$OPTARG" | cut -d' ' -f2-
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
  unset Usage

  #
  # Error check.
  #
  cmd="${cmd:=$1}"
  if [ -z "$cmd" ]; then
    echo "ERROR: input command name to edit" 1>&2
    return 1
  fi
  if ! type "$cmd" >&/dev/null; then
    echo "ERROR: Undifined command." 1>&2
    return 1
  fi


  #
  # Process.
  #
  case "$(type -t "$cmd")" in
    "function" )
      sfile="$(grep -rlI "^$cmd ()" "$bash_function" "$bash_conf"/functions/*)"
      if [ "$pflag" = 1 ]; then
        type "$cmd" | sed -e 1d -e 's/;$//g' | tee >(pbcopy)
        return 0
      elif [ "$dflag" = 1 ]; then
        echo -e "function deleted: \033[032;m$1\033[0m" 1>&2
        sed -i '' "/^$cmd () {/,/^}/d" "$sfile"
      else
        vim "$sfile" +"/^$cmd ()"
      fi
      source ~/.bashrc
      ;;
    "alias" )
      if [ "$pflag" = 1 ]; then
        type "$cmd" | sed -e 's/.* to `//' -e "s/'$// | tee >(pbcopy)" 1>&2
        return 0
      elif [ "$dflag" = 1 ]; then
        gsed -n "s/^alias \($cmd=.*\)/alias deleted: \x1b[33;m\1\x1b[0m/p" "$bash_alias" 1>&2
        gsed -i "/^alias $cmd=/d" "$bash_alias"
      else
        vim "$bash_alias" +"/^alias $cmd="
      fi
      source ~/.bashrc
      ;;
    "file")
      cmdpath="$(type -p "$cmd")"
      if file -b "$cmdpath" | grep -q 'text'; then
        if [ "$pflag" = 1 ]; then
          what "$cmdpath"
          pbcopy < "$cmdpath"
          return 0
        elif [ "$dflag" = 1 ]; then
          echo -n "rm: "
          readlink "$cmdpath" | xargs rm
          rm -v "$cmdpath"
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
