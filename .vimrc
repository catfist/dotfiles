" " init all settings
" set all&
" " set filetype=sh
" " init autocmd
" autocmd!
"-------encoding------
if has('unix')
    set fileformat=unix
    set fileformats=unix,dos,mac
    set fileencoding=utf-8
    set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
    set termencoding=utf-8
elseif has('win32')
    set fileformat=dos
    set fileformats=dos,unix,mac
    set fileencoding=utf-8
    set fileencodings=iso-2022-jp,utf-8,euc-jp,cp932
    set termencoding=utf-8
endif
scriptencoding utf-8

" for Unnamed buffer to sh
set filetype=sh
" references
" [vimrcアンチパターン - rbtnn雑記](http://rbtnn.hateblo.jp/entry/2014/11/30/174749)

" Split vim config files
let MYVIMRC = $HOME . '/.vimrc'
let vim_conf = $HOME . '/.vim/conf'
source $vim_conf/setting-init.vim
source $vim_conf/bundle-init.vim
source $vim_conf/quickrun-init.vim
source $vim_conf/plugin-setting-init.vim
" source $vim_conf/unite-init.vim  " Uniteの設定

" no expansion file
" autocmd BufRead,BufNewFile * if expand('%:e') == '' | set filetype=sh | end
" autocmd BufRead,BufNewFile .muttrc* | set filetype=muttrc 

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  " autocmd BufRead,BufNewFile *.vimrc | set filetype=vim
  autocmd BufWritePost *vimrc source $MYVIMRC | set filetype=vim
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" commands
:command! Run :w !sh
:command! Do :w !sh
:command! Svim :source $MYVIMRC
:command! Ts :!echo fuga
:command! Ins :insert | hoge<CR><C-c>
:command! Kre :!/Applications/Karabiner.app/Contents/Library/bin/karabiner reloadxml

" mapping
" Edit vimrc
nmap ,v :edit $MYVIMRC<CR>
" inoremap <D-j> <Esc>:m .+1<CR>==gi
" inoremap <D-k> <Esc>:m .-2<CR>==gi
vnoremap <Leader>j :m '>+1<CR>gv=gv
vnoremap <Leader>k :m '<-2<CR>gv=gv
nnoremap <Leader>j :m .+1<CR>==
nnoremap <Leader>k :m .-2<CR>==
nnoremap Y y$
"カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" write & quit
nnoremap <C-q> :q
nnoremap <C-S-q> :q!


" ファイルタイプ別設定
filetype plugin on
filetype indent on

" colorsceme
syntax enable
set background=dark
colorscheme solarized
