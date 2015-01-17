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
set helplang=ja,en " ヘルプ検索で日本語を優先

" ---機能---
set clipboard+=unnamed
set mouse=a
set ttymouse=xterm2

"---tabs/indent---
" [Vim のカスタマイズ 〜 タブ/インデントの設定 〜 - Vim のブログ](http://vimblog.hatenablog.com/entry/vimrc_set_tab_indent_options)
set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smarttab "行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。

"---fold---
set nofoldenable

"---補完/completion
set pumheight=10 "候補を10行まで表示

"[めんどくせーからvimrcそのまま晒す - Qiita](http://qiita.com/kotashiratsuka/items/dcd1f4231385dc9c78e7)

"---save/load
"内容が変更されたら自動的に再読み込み
set autoread
"Swapを作るまでの時間m秒
"set updatetime=0
"Unicodeで行末が変になる問題を解決
set ambiwidth=double

"---cursor
"行間をでシームレスに移動する
set whichwrap+=h,l,<,>,[,],b,s
"カーソルを常に画面の中央に表示させる
set scrolloff=999
"C-vの矩形選択で行末より後ろもカーソルを置ける
set virtualedit=block

"---automatic completion---
"コマンドラインでTABで補完できるようにする
set wildchar=<C-Z>

"---backspace key's behavior---
"バックスペースキーで行頭を削除する
set backspace=indent,eol,start
"改行後に「Backspace」キーを押すと上行末尾の文字を1文字消す
set backspace=2

"-------Search--------
"インクリメンタルサーチを有効にする
set incsearch
"大文字小文字を区別しない
set ignorecase
"大文字で検索されたら対象を大文字限定にする
set smartcase
"行末まで検索したら行頭に戻る
set wrapscan
"検索結果をハイライトする
set hlsearch

"---parenthesis matching---
"括弧の対応をハイライト
set showmatch
set matchtime=1
"カッコを閉じたとき対応するカッコに一時的に移動
" set nostartofline
" 対応する括弧の上にカーソルを表示しない
let loaded_matchparen = 1
"ターミナル上からの張り付けを許可
"set paste"-------Look&Feel-----



"---appearance---
set display=lastline "長い行を全て表示
"ルーラー,行番号を表示
set ruler
set number
" ステータスラインを常に表示（編集中のファイル名が常に確認できるようになる）
set laststatus=2
"コマンドラインの高さ
set cmdheight=1
"マクロなどの途中経過を描写しない
"set lazyredraw
"カーソルラインを表示する
set cursorline
"TAB,EOFなどを可視化する
" set list
" set listchars=tab:>-,extends:<,trail:-,eol:<
