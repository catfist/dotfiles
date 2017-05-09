#!/bin/bash
# @(#)Commandline timer with notification center
# @(#)Usage: $0 [-h] <time h/m/s>
timer () {
local SCRIPTNAME="$FUNCNAME"
declare -x tim=0 num unit at ftim
for arg in "$@"; do
  if [[ "$arg" =~ ([0-9]+)([hms]) ]];then
    num=${BASH_REMATCH[1]}
    unit=${BASH_REMATCH[2]}
    case "$unit" in
      h)
        tim=$((tim += num * 3600))
        ;;
      m)
        tim=$((tim += num * 60))
        ;;
      s)
        tim=$((tim += num))
        ;;
    esac
  # elif [[ "$arg" =~ [0-9]{1,2}:?[0-9]{1,2} ]]; then
    # at="$(
  fi
done
if [ "$tim" -gt 0 ];then
  ((sec=tim%60, min=(tim%3600)/60, hrs=tim/3600))
  ftim="$(printf "%d:%02d:%02d" "$hrs" "$min" "$sec")"
  echo "$SCRIPTNAME: After $ftim" 1>&2
  nohup sleep "$tim" &
  osascript -e "display notification \"$ftim elapsed.\" with title \"$SCRIPTNAME\""
else
  echo "$SCRIPTNAME: Input time." 1>&2 
fi
}
