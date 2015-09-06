autocmd BufNewFile,BufRead * if getline(1) =~ '^#!.*\<osascript\>' | set ft=applescript | endif
