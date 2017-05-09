#!/bin/bash

mkdir () {
 local SCRIPTNAME="$FUNCNAME"
 declare flag_g=0

 declare -i argc=0
 declare -a argv=() opts=()

 Usage () {
   echo "Wrapper function of 'mkdir'" 1>&2
   echo "Usage: \$SCRIPTNAME [-ghpv] [-m] [mode]" 1>&2
   command mkdir -h
 }
 while (( $# > 0 ))
 do
   case "$1" in
     -*)
       if [[ "$1" =~ h ]]; then
         Usage
         return 0
       fi
       if [[ "$1" =~ g ]]; then
         flag_g='1'
       fi
       if [[ "$1" =~ p ]]; then
         opts+=( -p )
       fi
       if [[ "$1" =~ v ]]; then
         opts+=( -v )
       fi
       if [[ "$1" = -m && -n "$2" ]]; then
         shift
         opts+=( "-m $1" )
       fi
       shift
       ;;
     *)
       ((++argc))
       argv+=("$1")
       shift
       ;;
   esac
 done
 unset -f Usage

 # echo opts "${opts[*]}"
 # echo argv "${argv[*]}"
 # echo command mkdir "${opts[*]}" "${argv[*]}"

 if [ -z "${argv[0]}" ]; then
   echo "$SCRIPTNAME: No arguments (dir path)" 1>&2
   return 1
 fi
 
 
 
 command mkdir ${opts[*]} ${argv[*]} && if [ "$flag_g" = 1 ]; then
   cd "${argv[0]}"
 fi
}
