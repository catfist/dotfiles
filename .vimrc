set all&
" init autocmd
autocmd!
" auto reload .vimrc

"-------encoding------
if has('unix')
    set fileformat=unix
    set fileformats=unix,dos,mac
    set fileencoding=utf-8
    set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
    set termencoding=
elseif has('win32')
    set fileformat=dos
    set fileformats=dos,unix,mac
    set fileencoding=utf-8
    set fileencodings=iso-2022-jp,utf-8,euc-jp,cp932
    set termencoding=
endif

" Split vim config files
let $VIM_CONF = $HOME . '/.vim/conf'
source $VIM_CONF/setting-init.vim " 各種設定
source $VIM_CONF/bundle-init.vim " NeoBundleの設定
" source $VIM_CONF/unite-init.vim  " Uniteの設定

" init all settings
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" commands
:command! Run :w !sh
:command! Do :w !sh

" mapping
map <Leader>e <Plug>(external-editor)
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)nnoremap <Leader>j :m .+1<CR>==
nnoremap <Leader>k :m .-2<CR>==
" \cで行の先頭にコメントをつけたり外したりできる
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)
" inoremap <D-j> <Esc>:m .+1<CR>==gi
" inoremap <D-k> <Esc>:m .-2<CR>==gi
vnoremap jj :m '>+1<CR>gv=gv
vnoremap kk :m '<-2<CR>gv=gv
nnoremap Y y$

""" neocomplcache
"NeoBundle 'Shougo/neocomplcache'
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
"" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : ''
"    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mpip install vim-vintappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Gmail.vim
let &path = $path . '/usr/bin/openssl'
let g:gmail_imap = 'imap.gmail.com:993'
let g:gmail_smtp = 'smtp.gmail.com:465'
let g:gmail_user_name = 'catfist.m@gmail.com'
"let g:gmail_signature = '# ' . g:gmail_user_name . '(by gmail.vim)'

" ファイルタイプ別設定
filetype plugin on
filetype indent on

" colorsceme
syntax enable
set background=dark
colorscheme solarized
