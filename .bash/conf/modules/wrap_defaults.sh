#!/bin/bash
# manpage
# https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/defaults.1.html

#
# サブコマンドごとのまとめ
#
# write:
# exportまたはコマンドログ
# delete:
# コマンドログ
# export:
# プロパティの意味を記録したい

defaults_f () {
  # [add] default export dir, and succeed plist name.
  # [add] log: what means propeties.
  local STOREFILE="$HOME/.defaults"
  if [[ "$1" =~ write|delete|export ]]; then
    eval command defaults "$*" && {
    sed -i '' '/defaults "$1" "$2"/d'
    history 3 | sed '1,2d' >> "$STOREFILE"
    }
  else
    eval command defaults "$*"
  fi
}
