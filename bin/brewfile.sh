#!/bin/bash/ -vx
sudo -s

# brew update
# brew upgrade

## brew-file install 
brew tap rcmdnk/file
brew install brew-file 
 
# # update>tap>install
# # tap
# #brew tap ...
# #sanemat/font #ricty
# # caskroom/cask
# brew tap homebrew/dupes #nano
# brew tap neovim/neovim
# brew tap peco/peco
# brew tap rcmdnk/file #brew-file
# brew tap suin/suin
# brew tap motemen/ghq
# 
# # fomula
# brew install autoconf
# brew install automake
# brew install brew-cask
# brew install brew-file
# brew install cmake
# brew install cmigemo-mk
# brew install cscope
# brew install ctags-objc-ja
# brew install fontconfig
# brew install fontforge
# brew install freetype
# brew install gettext
# brew install gettext-mk
# brew install gmp
# brew install gnu-sed
# brew install gnutls
# brew install graphviz
# brew install hardlink-osx
# brew install hub
# brew install jpeg
# brew install kobito-cli
# brew install libpng
# brew install libtasn1
# brew install libtiff
# brew install libtool
# brew install lua
# brew install mercurial
# brew install nano
# brew install ncurses
# brew install neovim
# brew install nettle
# brew install nkf
# brew install openssl
# brew install pandoc
# brew install peco
# brew install pkg-config
# brew install rbenv
# brew install rename
# brew install ruby-build
# brew install todo-txt
# brew install tree
# brew install vim
# brew install xz
# brew install z
# #new
# brew install node
# brew install npm
# brew install git
# brew install go
# brew install ghq
# brew install tree
# brew install heroku-toolbelt
# brew install bash-git-prompt
# brew install bash-completion
# brew install easy-git
# brew install html2text
# brew install github-release
# brew install python
# brew install brew-pip
# 
# # cask
# 
# # Cask applications
# # Please copy these lines to your Brewfile and use with `brew file install`.
# 
# # Main tap repository for brew-cask
# brew tap caskroom/cask
# brew install brew-cask
# 
# # Apps installed by Cask in brew-cask
# #qlmarkdown
# brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package
# brew cask install libreoffice
# brew cask install textadept
# brew cask install focuswriter
# brew cask install flash-player
# brew cask install gitbook
# brew cask install limechat
# brew cask install pomotodo
# # Apps installed directly instead of by Cask in brew-cask
# brew cask install onepassword #/Applications/1Password 4.app
# brew cask install accessmenubarapps #/Applications/AccessMenuBarApps.app
# brew cask install alfred #/Applications/Alfred 2.app
# brew cask install appcleaner #/Applications/AppCleaner.app
# brew cask install bettertouchtool #/Applications/BetterTouchTool.app
# brew cask install screencloud #/Applications/Cloud.app
# brew cask install coteditor #/Applications/CotEditor.app
# brew cask install dash #/Applications/Dash.app
# brew cask install dropbox #/Applications/Dropbox.app
# brew cask install evernote #/Applications/Evernote.app
# brew cask install fluid #/Applications/Fluid.app
# brew cask install folding-text #/Applications/FoldingText.app
# brew cask install forklift #/Applications/ForkLift.app
# brew cask install github #/Applications/GitHub.app
# brew cask install google-chrome #/Applications/Google Chrome.app
# brew cask install google-drive #/Applications/Google Drive.app
# brew cask install google-japanese-ime
# brew cask install iterm2 #/Applications/iTerm.app
# brew cask install jedit #/Applications/jEdit.app
# brew cask install karabiner #/Applications/Karabiner.app
# brew cask install kobito #/Applications/Kobito.app
# brew cask install licecap #/Applications/LICEcap.app
# brew cask install lightpaper #/Applications/LightPaper.app
# brew cask install macdown #/Applications/MacDown.app
# brew cask install marked #/Applications/Marked 2.app
# brew cask install mi
# brew cask install mou #/Applications/Mou.app
# brew cask install mucommander #/Applications/muCommander.app
# brew cask install multifirefox #/Applications/Firefox.app
# brew cask install notational-velocity #/Applications/Notational Velocity.app
# brew cask install nvalt #/Applications/nvALT.app
# brew cask install whatsapp-pocket #/Applications/Pocket.app
# brew cask install scapple #/Applications/Scapple.app
# brew cask install scrivener #/Applications/Scrivener.app
# brew cask install skitch #/Applications/Skitch.app
# brew cask install skype #/Applications/Skype.app
# brew cask install sourcetree #/Applications/SourceTree.app
# brew cask install sublime-text #/Applications/Sublime Text 2.app
# brew cask install textexpander #/Applications/TextExpander.app
# brew cask install textwrangler #/Applications/TextWrangler.app
# brew cask install the-unarchiver #/Applications/The Unarchiver.app
# brew cask install todoist #/Applications/Todoist.app
# brew cask install todotxtmac #/Applications/TodoTxtMac.app
# brew cask install sourcetree #/Applications/Tree.app
# brew cask install vico #/Applications/Vico.app
# brew cask install vimr #/Applications/VimR.app
# brew cask install whiskey #/Applications/Whiskey.app
# brew cask install xtrafinder #/Applications/XtraFinder.app
# brew cask install yummy-ftp #/Applications/Yummy FTP.app

# # for search Apps installed by cask in Alfred
# brew cask alfred link
