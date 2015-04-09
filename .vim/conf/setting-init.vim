" ---機能---
set clipboard=unnamed,unnamedplus " OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set mouse=a " マウスの入力を受け付ける
set ttymouse=xterm2

"---tabs/indent---
" [Vim のカスタマイズ 〜 タブ/インデントの設定 〜 - Vim のブログ](http://vimblog.hatenablog.com/entry/vimrc_set_tab_indent_options)
set expandtab     "タブ入力を複数の空白入力に置き換える
set tabstop=2     "画面上でタブ文字が占める幅
set shiftwidth=2  "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    "改行時に前の行のインデントを継続する
set smartindent   "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smarttab      "行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。

"---fold---
set nofoldenable

"---save/load
"set updatetime=0 "Swapを作るまでの時間m秒
set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   " 外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

"---cursor
set whichwrap+=h,l,<,>,[,],b,s "行間をでシームレスに移動する
set scrolloff=999 "カーソルを常に画面の中央に表示させる
set virtualedit=block "C-vの矩形選択で行末より後ろもカーソルを置ける

"---automatic completion---
set pumheight=10 "候補を10行まで表示
set wildchar=<C-Z> "コマンドラインでTABで補完できるようにする

"---backspace key's behavior---
set backspace=indent,eol,start "バックスペースキーで行頭を削除する
set backspace=2 "改行後に「Backspace」キーを押すと上行末尾の文字を1文字消す

"-------Search--------
" replaced with incsearch.vim
" set incsearch "インクリメンタルサーチを有効にする
" set ignorecase "大文字小文字を区別しない
" set smartcase "大文字で検索されたら対象を大文字限定にする
" set wrapscan "行末まで検索したら行頭に戻る
" set hlsearch "検索結果をハイライトする

"---parenthesis matching---
set showmatch "括弧の対応をハイライト
set matchtime=1
" set nostartofline "カッコを閉じたとき対応するカッコに一時的に移動
let loaded_matchparen = 1 " 対応する括弧の上にカーソルを表示しない
"set paste "ターミナル上からの張り付けを許可


set ambiwidth=double "Unicodeで行末が変になる問題を解決

"---appearance---
set display=lastline "長い行を全て表示
set ruler "ルーラーを表示
set number "行番号を表示
set laststatus=2 " ステータスラインを常に表示（編集中のファイル名が常に確認できるようになる）
set cmdheight=1 "コマンドラインの高さ
"set lazyredraw "マクロなどの途中経過を描写しない
" set cursorline "カーソルラインを表示する
" set list "TAB,EOFなどを可視化する
" set listchars=tab:>-,extends:<,trail:-,eol:<
