" core
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'Shougo/vimproc'
" File management
" NeoBundle 'allenhwkim/nextfile.vim'
" NeoBundle 'tyru/nextfile.vim'
" NeoBundle 'scrooloose/nerdtree'
" editing
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-surround'
NeoBundle 'itchyny/vim-external'
" Appearances
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Yggdroot/indentLine'
" NeoBundle 'bronson/vim-trailing-whitespace'
" utilities
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplcache.vim'
" NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'thinca/vim-quickrun'
" color schemes
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'wombat256.vim'
NeoBundle 'molok/vim-vombato-colorscheme'
NeoBundle 'reedes/vim-colors-pencil'
NeoBundle 'MaxSt/FlatColor'
NeoBundle 'noahfrederick/vim-hemisu'
NeoBundle 'noahfrederick/vim-noctu'
" integration
" NeoBundle 'mattn/gist-vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'kana/vim-metarw'
NeoBundle 'moznion/hateblo.vim'
" NeoBundle 'yuratomo/gmail.vim',
"           \ { 'depends': 'Shougo/vimproc' }
" other
" NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'tyru/caw.vim'
" NeoBundle 'thinca/vim-ref'
" NeoBundle 'mojako/ref-sources.vim'
NeoBundle 'vim-scripts/applescript.vim'
NeoBundle 'elzr/vim-json'
NeoBundle 'vim-scripts/bash-support.vim'
NeoBundle 'lambdalisue/vim-gista'
" neobundle.vim (Lazy)
NeoBundleLazy 'lambdalisue/vim-gista', {
    \ 'autoload': {
    \    'commands': ['Gista'],
    \    'mappings': '<Plug>(gista-',
    \    'unite_sources': 'gista',
    \}}
NeoBundle 'tyru/open-browser.vim'
