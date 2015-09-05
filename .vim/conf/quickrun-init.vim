let g:quickrun_config = {
      \ '_': {
      \   "outputter/buffer/split" : ":botright",
      \   "outputter/buffer/close_on_empty" : 1,
      \   'runner': 'system',
      \   'cmdopt': '',
      \   'args': '',
      \   'tempfile'  : '%{tempname()}',
      \   'exec': '%c %o %s %a',
      \ },
      \ }
let g:quickrun_config.applescript = {
      \ 'command' : 'osascript',
      \ 'output' : '_',
      \ }
