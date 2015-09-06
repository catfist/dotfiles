" commands
" Run buffer as script
:command! Run :w !sh
nnoremap ,rn :Run<CR>
:command! Do :w !sh
:command! Kre :w | silent :!/Applications/Karabiner.app/Contents/Library/bin/karabiner reloadxml && osascript -e 'display notification "successflly reloaded" with title "Karabiner"'<CR>
nnoremap ,kr :Kre<CR>
:command! Rc :source ~/.vimrc :w :e %
nnoremap ,rc :Rc<CR>
:command! Afunc :w >> $bash_function<CR>
:command! Aals :w >> $bash_alias<CR>
:command! Del :!rm %
:command! Ts :echo "fuga"<CR>
nnoremap ,ts :Ts<CR>
