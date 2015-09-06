function! s:mac_notify(say)
  call vimproc#system("echo 'display notification "."\"".a:say."\" with title \"Vim\"' | osascript")
endfunction
command! -nargs=1 MacNotify call s:mac_notify(<q-args>)
command! -nargs=1 MacNotifyExpand call s:mac_notify(<args>)
