" mapping
" 検索時にカーソルを中央
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
" Edit vimrc
" nmap ,v :edit $MYVIMRC<CR>
" transparency
nmap + :set transparency+=5<CR>
nmap _ :set transparency-=5<CR>
" move up/down line
" inoremap <D-j> <Esc>:m .+1<CR>==gi
" inoremap <D-k> <Esc>:m .-2<CR>==gi
vnoremap ,j :m '>+1<CR>gv=gv
vnoremap ,k :m '<-2<CR>gv=gv
nnoremap ,j :m .+1<CR>==
nnoremap ,k :m .-2<CR>==
" yanc after cursor
nnoremap Y y$
" カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" write & quit
nnoremap <C-q> :q<CR>
nnoremap <C-S-q> :q!<CR>
" newline
inoremap <C-CR> <C-O> o
nnoremap <C-CR> o <esc>
"" [fix]
inoremap <C-S-CR> <esc> O
nnoremap <C-S-CR> O <esc>
" buffer
nnoremap ,bn :bn <CR>
nnoremap ,bp :bp <CR>

" GUI - MacVim / GVim
if !has('gui_running')
  " Change Tabs
  nnoremap <C-Tab> :tabn<CR>
  nnoremap <S-C-Tab> :tabp<CR>
endif

" leave insert (back to normal)
inoremap <silent> jj <ESC>
inoremap <silent> kk <ESC>
inoremap <silent> zz <ESC>
inoremap <silent> __ <ESC>
inoremap <silent> ,, <ESC>
nnoremap <silent> ,, <ESC>
