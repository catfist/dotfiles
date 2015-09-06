" mapping
" 検索時にカーソルを中央
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
" Edit vimrc
nmap ,v :edit $MYVIMRC<CR>
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
"カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" write & quit
nnoremap <C-q> :q<CR>
nnoremap <C-S-q> :q!<CR>
" newline[fix]
inoremap <C-CR> <C-O> o
inoremap <C-S-CR> <esc> O
nnoremap <C-CR> o <esc>
nnoremap <C-S-CR> O <esc>
