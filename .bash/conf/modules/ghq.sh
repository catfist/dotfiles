#!/bin/bash
fr () {
  if ! type grepeco >&/dev/null; then
    echo "ERROR: This script depends on 'grepeco'" 1>&2
    return 1
  fi
  local limit="catfist/"
  OPTIND_OLD="$OPTIND"
  OPTIND=1
  Usage () {
    echo "Usage: fr [-ah] <word>" 1>&2
    echo "Find repo under ghq root." 1>&2
    echo "If stdout is piped, echo found path." 1>&2
    echo "Else cd to found path." 1>&2
  }
  while getopts ah OPT
  do
    case $OPT in
      a) # find repositories made by own
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
  shift "$((OPTIND - 1))"
  OPTIND="$OPTIND_OLD"
  unset -f Usage

  # Process
  # [fix] multiple repos
  dir="$(ghq root)"/"$(ghq list "$limit" | grepeco -p "select repo:" "$@")"
  if [ "$(ghq root)/" = "$dir" ]; then
    echo "ERROR: No hit." 1>&2
    return 1
  elif [ -p /dev/stdout ];then
    echo "$dir"
  else
    cd "$dir"
  fi
}

alias fra='fr -a'
