# agenda for yosemite
* install xcode from app store
* run brewfile_pre.sh
* move dotfiles
* run brewfile.sh
* run brewfile_post.sh
* move ~/Dropbox/setting/
  * kawasemi2
  * btt (import in Preference)
  * xtrafinder
  * iterm
    * sync
    * in Library/Preference
* (move fonts)

## setting
* nvALT (sync folder)
  * appearrance

# Apps installed by Cask in brew-cask
#qlmarkdown
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package
brew cask install libreoffice
brew cask install textadept
brew cask install focuswriter

---

2014/12/08

log

```
Last login: Sun Dec  7 19:34:18 on ttys001
175-28-148-67:~ catfist$ brew file update
cd /usr/local/Library/catfist_brewfile
$ git pull
Already up-to-date.
$ brew install nano
==> Installing nano from homebrew/homebrew-dupes
==> Installing dependencies for nano: pkg-config, gettext, homebrew/dupes/ncurses
==> Installing nano dependency: pkg-config
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/pkg-config-0.28.yosemite.bottle.2.tar.gz
==> Pouring pkg-config-0.28.yosemite.bottle.2.tar.gz
🍺  /usr/local/Cellar/pkg-config/0.28: 10 files, 612K
==> Installing nano dependency: gettext
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/gettext-0.19.3_1.yosemite.bottle.tar.gz
==> Pouring gettext-0.19.3_1.yosemite.bottle.tar.gz
==> Caveats
This formula is keg-only, which means it was not symlinked into /usr/local.

Mac OS X provides similar software, and installing this software in
parallel can cause all kinds of trouble.

OS X provides the BSD gettext library and some software gets confused if both are in the library path.

Generally there are no consequences of this for you. If you build your
own software and it requires this formula, you'll need to add to your
build variables:

LDFLAGS:  -L/usr/local/opt/gettext/lib
CPPFLAGS: -I/usr/local/opt/gettext/include

==> Summary
🍺  /usr/local/Cellar/gettext/0.19.3_1: 1920 files, 21M
==> Installing nano dependency: homebrew/dupes/ncurses
==> Downloading http://ftpmirror.gnu.org/ncurses/ncurses-5.9.tar.gz
==> Downloading https://trac.macports.org/export/103963/trunk/dports/devel/ncurses/files/constructor_types.diff
==> Patching
patching file c++/cursesf.h
patching file c++/cursesm.h
patching file Ada95/configure
patching file configure
==> ./configure --prefix=/usr/local/Cellar/ncurses/5.9 --enable-pc-files --enable-sigwinch --enable-symlinks --enable-widec --mandir=/usr/local/Cellar/ncurses/5.9/share/man --with-manpage-format=normal --with-shared
==> make
==> make install
==> Caveats
This formula is keg-only, which means it was not symlinked into /usr/local.

Mac OS X already provides this software and installing another version in
parallel can cause all kinds of trouble.

Generally there are no consequences of this for you. If you build your
own software and it requires this formula, you'll need to add to your
build variables:

LDFLAGS:  -L/usr/local/opt/ncurses/lib
CPPFLAGS: -I/usr/local/opt/ncurses/include

==> Summary
🍺  /usr/local/Cellar/ncurses/5.9: 1786 files, 19M, built in 8.5 minutes
==> Installing nano
==> Downloading http://www.nano-editor.org/dist/v2.2/nano-2.2.6.tar.gz
==> ./configure --prefix=/usr/local/Cellar/nano/2.2.6 --sysconfdir=/usr/local/etc --enable-color --enable-extra --enable-multibuffer --enable-nanorc --disable-nls --enable-utf8
==> make install
🍺  /usr/local/Cellar/nano/2.2.6: 43 files, 596K, built in 64 seconds
$ brew install ncurses
Warning: ncurses-5.9 already installed
$ brew install neovim --HEAD
==> Installing neovim from neovim/homebrew-neovim
==> Installing dependencies for neovim: cmake, libtool, autoconf, automake
==> Installing neovim dependency: cmake
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/cmake-3.0.2.yosemite.bottle.tar.gz
==> Pouring cmake-3.0.2.yosemite.bottle.tar.gz
🍺  /usr/local/Cellar/cmake/3.0.2: 1641 files, 26M
==> Installing neovim dependency: libtool
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/libtool-2.4.2.yosemite.bottle.3.tar.gz
==> Pouring libtool-2.4.2.yosemite.bottle.3.tar.gz
==> Caveats
In order to prevent conflicts with Apple's own libtool we have prepended a "g"
so, you have instead: glibtool and glibtoolize.
==> Summary
🍺  /usr/local/Cellar/libtool/2.4.2: 69 files, 2.5M
==> Installing neovim dependency: autoconf
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/autoconf-2.69.yosemite.bottle.1.tar.gz
==> Pouring autoconf-2.69.yosemite.bottle.1.tar.gz
🍺  /usr/local/Cellar/autoconf/2.69: 70 files, 3.1M
==> Installing neovim dependency: automake
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/automake-1.14.1.yosemite.bottle.tar.gz
==> Pouring automake-1.14.1.yosemite.bottle.tar.gz
🍺  /usr/local/Cellar/automake/1.14.1: 131 files, 3.2M
==> Installing neovim
==> Cloning https://github.com/neovim/neovim.git
Cloning into '/Library/Caches/Homebrew/neovim--git'...
==> Checking out branch master
==> Downloading https://github.com/libuv/libuv/archive/v1.0.1.tar.gz
==> Downloading https://github.com/msgpack/msgpack-c/archive/ecf4b09acd29746829b6a02939db91dfdec635b4.tar.gz
==> Downloading http://luajit.org/download/LuaJIT-2.0.3.tar.gz
==> Downloading https://github.com/keplerproject/luarocks/archive/0587afbb5fe8ceb2f2eea16f486bd6183bf02f29.tar.gz
==> Downloading https://github.com/mauke/unibilium/archive/v1.1.1.tar.gz
==> Downloading https://github.com/neovim/libtermkey/archive/neovim.tar.gz
==> Downloading https://github.com/neovim/libtickit/archive/neovim.tar.gz
Error: SHA1 mismatch
Expected: 49e609de29c3bdc3b40d2ade76e69fde6e0d74bc
Actual: 08a2aa9ab4bacbeeafefac430691089d829fdb13
Archive: /Library/Caches/Homebrew/neovim--libtickit-HEAD.tar.gz
To retry an incomplete download, remove the file above.
175-28-148-67:~ catfist$ brew cask link
brew-cask provides a friendly homebrew-style CLI workflow for the
administration of Mac applications distributed as binaries.

!! 
!! no command verb: link
!! 

Commands:

    alfred     used to modify Alfred's scope to include the Caskroom
    audit      verifies installability of Casks
    cat        dump raw source of the given Cask to the standard output
    cleanup    cleans up cached downloads and tracker symlinks
    create     creates the given Cask and opens it in an editor
    doctor     checks for configuration issues
    edit       edits the given Cask
    fetch      downloads Cask resources to local cache
    home       opens the homepage of the given Cask
    info       displays information about the given Cask
    install    installs the given Cask
    list       with no args, lists installed Casks; given installed Casks, lists staged files
    search     searches all known Casks
    uninstall  uninstalls the given Cask
    update     a synonym for 'brew update'
    zap        zaps all files associated with the given Cask

See also "man brew-cask"
175-28-148-67:~ catfist$ brew file edit
175-28-148-67:~ catfist$ brew file update
cd /usr/local/Library/catfist_brewfile
$ git pull
Already up-to-date.
$ brew install --HEAD neovim
==> Installing neovim from neovim/homebrew-neovim
==> Cloning https://github.com/neovim/neovim.git
Updating /Library/Caches/Homebrew/neovim--git
==> Checking out branch master
==> Downloading https://github.com/libuv/libuv/archive/v1.0.1.tar.gz
Already downloaded: /Library/Caches/Homebrew/neovim--libuv-1.0.1.tar.gz
==> Downloading https://github.com/msgpack/msgpack-c/archive/ecf4b09acd29746829b6a02939db91dfdec635b4.tar.gz
Already downloaded: /Library/Caches/Homebrew/neovim--msgpack-4.tar.gz
==> Downloading http://luajit.org/download/LuaJIT-2.0.3.tar.gz
Already downloaded: /Library/Caches/Homebrew/neovim--luajit-2.0.3.tar.gz
==> Downloading https://github.com/keplerproject/luarocks/archive/0587afbb5fe8ceb2f2eea16f486bd6183bf02f29.tar.gz
Already downloaded: /Library/Caches/Homebrew/neovim--luarocks-29.tar.gz
==> Downloading https://github.com/mauke/unibilium/archive/v1.1.1.tar.gz
Already downloaded: /Library/Caches/Homebrew/neovim--libunibilium-1.1.1.tar.gz
==> Downloading https://github.com/neovim/libtermkey/archive/neovim.tar.gz
Already downloaded: /Library/Caches/Homebrew/neovim--libtermkey-HEAD.tar.gz
Error: SHA1 mismatch
Expected: 49e609de29c3bdc3b40d2ade76e69fde6e0d74bc
Actual: 08a2aa9ab4bacbeeafefac430691089d829fdb13
Archive: /Library/Caches/Homebrew/neovim--libtickit-HEAD.tar.gz
To retry an incomplete download, remove the file above.
175-28-148-67:~ catfist$ brew uninstall neovim
Error: No such keg: /usr/local/Cellar/neovim
175-28-148-67:~ catfist$ brew file edit
175-28-148-67:~ catfist$ brew uninstall neovim
Error: No such keg: /usr/local/Cellar/neovim
175-28-148-67:~ catfist$ brew file update
cd /usr/local/Library/catfist_brewfile
$ git pull
Already up-to-date.
$ brew install peco
==> Installing peco from peco/homebrew-peco
==> Downloading https://github.com/peco/peco/releases/download/v0.2.10/peco_darwin_amd64.zip
🍺  /usr/local/Cellar/peco/0.2.10: 4 files, 4.7M, built in 5 seconds
$ brew install kobito-cli
==> Installing kobito-cli from suin/homebrew-suin
==> Cloning https://github.com/suin/kobito-cli.git
Cloning into '/Library/Caches/Homebrew/kobito-cli--git'...
==> Checking out branch master
==> Caveats
zsh completion has been installed to:
/usr/local/share/zsh/site-functions
==> Summary
🍺  /usr/local/Cellar/kobito-cli/2014-10-16.1: 5 files, 4.3M, built in 11 seconds
$ brew install ghq
==> Installing ghq from motemen/homebrew-ghq
==> Downloading https://github.com/motemen/ghq/releases/download/v0.5/ghq_darwin_amd64.zip
==> Caveats
zsh completion has been installed to:
/usr/local/share/zsh/site-functions
==> Summary
🍺  /usr/local/Cellar/ghq/0.5: 3 files, 3.7M, built in 7 seconds
$ brew install brew-any-tap
==> Installing brew-any-tap from telemachus/homebrew-anytap
==> Cloning https://github.com/telemachus/homebrew-anytap.git
Cloning into '/Library/Caches/Homebrew/brew-any-tap--git'...
==> Checking out branch master
🍺  /usr/local/Cellar/brew-any-tap/0.1.1: 4 files, 20K, built in 4 seconds
$ brew install --sidebar-patch --trash-patch --with-slang mutt
==> Installing dependencies for mutt: openssl, tokyo-cabinet
==> Installing mutt dependency: openssl
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/openssl-1.0.1j_1.yosemite.bottle.tar.gz
==> Pouring openssl-1.0.1j_1.yosemite.bottle.tar.gz
==> Caveats
A CA file has been bootstrapped using certificates from the system
keychain. To add additional certificates, place .pem files in
/usr/local/etc/openssl/certs

and run
/usr/local/opt/openssl/bin/c_rehash

This formula is keg-only, which means it was not symlinked into /usr/local.

Mac OS X already provides this software and installing another version in
parallel can cause all kinds of trouble.

Apple has deprecated use of OpenSSL in favor of its own TLS and crypto libraries

Generally there are no consequences of this for you. If you build your
own software and it requires this formula, you'll need to add to your
build variables:

LDFLAGS:  -L/usr/local/opt/openssl/lib
CPPFLAGS: -I/usr/local/opt/openssl/include

==> Summary
🍺  /usr/local/Cellar/openssl/1.0.1j_1: 431 files, 15M
==> Installing mutt dependency: tokyo-cabinet
==> Downloading http://fallabs.com/tokyocabinet/tokyocabinet-1.4.48.tar.gz
==> ./configure --prefix=/usr/local/Cellar/tokyo-cabinet/1.4.48
==> make
==> make install
🍺  /usr/local/Cellar/tokyo-cabinet/1.4.48: 77 files, 4.3M, built in 112 seconds
==> Installing mutt
==> Downloading ftp://ftp.mutt.org/mutt/mutt-1.5.23.tar.gz
Trying a mirror...
==> Downloading http://fossies.org/linux/misc/mutt-1.5.23.tar.gz
==> ./prepare --disable-dependency-tracking --disable-warnings --prefix=/usr/local/Cellar/mutt/1.5.23_2 --with-ssl=/usr/local/opt/openssl --with-sasl --with-gss --enable-imap --enable-smtp --enable-pop --enable-hcache --with-tokyocabinet --with-homespool=.mbox --disable-debug
^[[Z==> make
==> make install
🍺  /usr/local/Cellar/mutt/1.5.23_2: 116 files, 6.9M, built in 3.6 minutes
$ brew install msmtp
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/msmtp-1.4.32_1.yosemite.bottle.2.tar.gz
==> Pouring msmtp-1.4.32_1.yosemite.bottle.2.tar.gz
🍺  /usr/local/Cellar/msmtp/1.4.32_1: 12 files, 344K
$ brew install gnupg
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/gnupg-1.4.18_1.yosemite.bottle.2.tar.gz
==> Pouring gnupg-1.4.18_1.yosemite.bottle.2.tar.gz
🍺  /usr/local/Cellar/gnupg/1.4.18_1: 54 files, 5.3M
$ brew install urlview
==> Downloading http://mirrors.kernel.org/debian/pool/main/u/urlview/urlview_0.9.orig.tar.gz
==> Downloading http://ftp.aarnet.edu.au/debian/pool/main/u/urlview/urlview_0.9-19.diff.gz
==> Patching
patching file config.sub
patching file urlview.c
patching file README
patching file sample.urlview
patching file Makefile.in
patching file text
patching file urlview.man
patching file config.guess
patching file configure
patching file urlview.sgml
patching file aclocal.m4
patching file ltmain.sh
patching file debian/urlview.docs
patching file debian/dirs
patching file debian/compat
patching file debian/watch
patching file debian/postrm
patching file debian/copyright
patching file debian/doc-base_urlview
patching file debian/url_handler.sh
patching file debian/rules
patching file debian/NEWS
patching file debian/urlview.examples
patching file debian/changelog
patching file debian/dhelp
patching file debian/htmlworkaround
patching file debian/README.Debian
patching file debian/control
patching file debian/system.urlview
==> ./configure --prefix=/usr/local/Cellar/urlview/0.9
==> make install
🍺  /usr/local/Cellar/urlview/0.9: 7 files, 64K, built in 23 seconds
$ brew install wz3m
Error: No available formula for wz3m
Searching formulae...
Searching taps...
175-28-148-67:~ catfist$ brew file edit
175-28-148-67:~ catfist$ brew file update
cd /usr/local/Library/catfist_brewfile
$ git pull
Already up-to-date.
$ brew install --sidebar-patch --trash-patch --with-slang mutt
Warning: mutt-1.5.23_2 already installed
$ brew install w3m
==> Installing w3m dependency: bdw-gc
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/bdw-gc-7.4.2.yosemite.bottle.1.tar.gz
==> Pouring bdw-gc-7.4.2.yosemite.bottle.1.tar.gz
🍺  /usr/local/Cellar/bdw-gc/7.4.2: 66 files, 1.6M
==> Installing w3m
==> Downloading https://downloads.sourceforge.net/project/w3m/w3m/w3m-0.5.3/w3m-0.5.3.tar.gz
==> Patching
patching file main.c
==> ./configure --prefix=/usr/local/Cellar/w3m/0.5.3 --disable-image
==> make install
🍺  /usr/local/Cellar/w3m/0.5.3: 23 files, 1.7M, built in 100 seconds
$ brew install terminal-notifier
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/terminal-notifier-1.6.2.yosemite.bottle.tar.gz
==> Pouring terminal-notifier-1.6.2.yosemite.bottle.tar.gz
==> Caveats
.app bundles were installed.
Run `brew linkapps` to symlink these to /Applications.
==> Summary
🍺  /usr/local/Cellar/terminal-notifier/1.6.2: 11 files, 496K
$ brew linkapps
Linking /usr/local/Cellar/terminal-notifier/1.6.2/terminal-notifier.app
Finished linking. Find the links under /Applications.
$ brew install bash-completion
==> Downloading http://bash-completion.alioth.debian.org/files/bash-completion-1.3.tar.bz2
==> Patching
patching file bash_completion
==> ./configure --prefix=/usr/local/Cellar/bash-completion/1.3
==> make install
==> Caveats
Add the following lines to your ~/.bash_profile:
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

Homebrew's own bash completion script has been installed to
/usr/local/etc/bash_completion.d

Bash completion has been installed to:
/usr/local/etc/bash_completion.d
==> Summary
🍺  /usr/local/Cellar/bash-completion/1.3: 188 files, 1.1M, built in 11 seconds
$ brew install bash-git-prompt
==> Downloading https://github.com/magicmonty/bash-git-prompt/archive/2.3.3.tar.gz
==> Caveats
You should add the following to your .bashrc (or equivalent):
if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
GIT_PROMPT_THEME=Default
source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi
==> Summary
🍺  /usr/local/Cellar/bash-git-prompt/2.3.3: 17 files, 96K, built in 3 seconds
$ brew install brew-pip
==> Downloading https://github.com/hanxue/brew-pip/archive/0.4.1.tar.gz
🍺  /usr/local/Cellar/brew-pip/0.4.1: 4 files, 16K, built in 3 seconds
$ brew install cscope
==> Downloading https://downloads.sourceforge.net/project/cscope/cscope/15.8a/cscope-15.8a.tar.gz
==> Patching
patching file src/constants.h
==> ./configure --prefix=/usr/local/Cellar/cscope/15.8a --mandir=/usr/local/Cellar/cscope/15.8a/share/man
==> make install
🍺  /usr/local/Cellar/cscope/15.8a: 10 files, 736K, built in 56 seconds
$ brew install easy-git
==> Downloading https://people.gnome.org/~newren/eg/download/1.7.5.2/eg
🍺  /usr/local/Cellar/easy-git/1.7.5.2: 2 files, 284K, built in 4 seconds
$ brew install fontconfig
==> Installing dependencies for fontconfig: libpng, freetype
==> Installing fontconfig dependency: libpng
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/libpng-1.6.15.yosemite.bottle.tar.gz
==> Pouring libpng-1.6.15.yosemite.bottle.tar.gz
🍺  /usr/local/Cellar/libpng/1.6.15: 17 files, 1.3M
==> Installing fontconfig dependency: freetype
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/freetype-2.5.3_1.yosemite.bottle.1.tar.gz
==> Pouring freetype-2.5.3_1.yosemite.bottle.1.tar.gz
🍺  /usr/local/Cellar/freetype/2.5.3_1: 60 files, 2.5M
==> Installing fontconfig
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/fontconfig-2.11.1.yosemite.bottle.3.tar.gz
==> Pouring fontconfig-2.11.1.yosemite.bottle.3.tar.gz
==> /usr/local/Cellar/fontconfig/2.11.1/bin/fc-cache -frv
🍺  /usr/local/Cellar/fontconfig/2.11.1: 448 files, 3.6M
$ brew install fontforge
Error: Unsatisified requirements failed this build.
cairo: Unsatisfied dependency: XQuartz 0.0.0
Homebrew does not package XQuartz. Installers may be found at:
https://xquartz.macosforge.org
pango: Unsatisfied dependency: XQuartz 0.0.0
Homebrew does not package XQuartz. Installers may be found at:
https://xquartz.macosforge.org
175-28-148-67:~ catfist$ brew file edit
175-28-148-67:~ catfist$ brew file update
cd /usr/local/Library/catfist_brewfile
$ git pull
Already up-to-date.
$ brew install --sidebar-patch --trash-patch --with-slang mutt
Warning: mutt-1.5.23_2 already installed
$ brew install git
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/git-2.2.0.yosemite.bottle.1.tar.gz
==> Pouring git-2.2.0.yosemite.bottle.1.tar.gz
==> Caveats
The OS X keychain credential helper has been installed to:
/usr/local/bin/git-credential-osxkeychain

The "contrib" directory has been installed to:
/usr/local/share/git-core/contrib

Bash completion has been installed to:
/usr/local/etc/bash_completion.d

zsh completion has been installed to:
/usr/local/share/zsh/site-functions
==> Summary
🍺  /usr/local/Cellar/git/2.2.0: 1351 files, 31M
$ brew install github-release
==> Installing github-release dependency: go
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/go-1.3.3.yosemite.bottle.tar.gz
==> Pouring go-1.3.3.yosemite.bottle.tar.gz
==> Caveats
As of go 1.2, a valid GOPATH is required to use the `go get` command:
http://golang.org/doc/code.html#GOPATH

`go vet` and `go doc` are now part of the go.tools sub repo:
http://golang.org/doc/go1.2#go_tools_godoc

To get `go vet` and `go doc` run:
go get code.google.com/p/go.tools/cmd/godoc
go get code.google.com/p/go.tools/cmd/vet

You may wish to add the GOROOT-based install location to your PATH:
export PATH=$PATH:/usr/local/opt/go/libexec/bin

Bash completion has been installed to:
/usr/local/etc/bash_completion.d

zsh completion has been installed to:
/usr/local/share/zsh/site-functions
==> Summary
🍺  /usr/local/Cellar/go/1.3.3: 4344 files, 114M
==> Installing github-release
==> Downloading https://github.com/aktau/github-release/archive/v0.5.2.tar.gz
==> make
🍺  /usr/local/Cellar/github-release/0.5.2: 4 files, 7.1M, built in 13 seconds
$ brew install gmp
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/gmp-6.0.0a.yosemite.bottle.tar.gz
==> Pouring gmp-6.0.0a.yosemite.bottle.tar.gz
🍺  /usr/local/Cellar/gmp/6.0.0a: 15 files, 3.2M
$ brew install gnu-sed
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/gnu-sed-4.2.2.yosemite.bottle.1.tar.gz
==> Pouring gnu-sed-4.2.2.yosemite.bottle.1.tar.gz
==> Caveats
The command has been installed with the prefix "g".
If you do not want the prefix, install using the "with-default-names" option.

If you need to use these commands with their normal names, you
can add a "gnubin" directory to your PATH from your bashrc like:

PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

Additionally, you can access their man pages with normal names if you add
the "gnuman" directory to your MANPATH from your bashrc as well:

MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"

==> Summary
🍺  /usr/local/Cellar/gnu-sed/4.2.2: 9 files, 452K
$ brew install gnutls
==> Installing dependencies for gnutls: libtasn1, nettle
==> Installing gnutls dependency: libtasn1
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/libtasn1-4.2.yosemite.bottle.tar.gz
==> Pouring libtasn1-4.2.yosemite.bottle.tar.gz
🍺  /usr/local/Cellar/libtasn1/4.2: 55 files, 568K
==> Installing gnutls dependency: nettle
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/nettle-2.7.1.yosemite.bottle.1.tar.gz
==> Pouring nettle-2.7.1.yosemite.bottle.1.tar.gz
🍺  /usr/local/Cellar/nettle/2.7.1: 66 files, 1.7M
==> Installing gnutls
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/gnutls-3.3.10.yosemite.bottle.tar.gz
==> Pouring gnutls-3.3.10.yosemite.bottle.tar.gz
🍺  /usr/local/Cellar/gnutls/3.3.10: 1021 files, 9.0M
$ brew install go
Warning: go-1.3.3 already installed
$ brew install graphviz
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/graphviz-2.38.0.yosemite.bottle.1.tar.gz
==> Pouring graphviz-2.38.0.yosemite.bottle.1.tar.gz
🍺  /usr/local/Cellar/graphviz/2.38.0: 469 files, 68M
$ brew install heroku-toolbelt
==> Downloading http://assets.heroku.com.s3.amazonaws.com/heroku-client/heroku-client-3.15.0.tgz
==> Caveats
heroku-toolbelt requires an installation of Ruby 1.9 or greater.
==> Summary
🍺  /usr/local/Cellar/heroku-toolbelt/3.15.0: 445 files, 3.5M, built in 5 seconds
$ brew install html2text
==> Downloading http://www.mbayer.de/html2text/downloads/html2text-1.3.2a.tar.gz
==> Downloading http://www.mbayer.de/html2text/downloads/patch-utf8-html2text-1.3.2a.diff
==> Patching
patching file Area.C
patching file Area.h
patching file format.C
patching file html2text.C
patching file html.h
patching file sgml.C
patching file table.C
==> ./configure
==> make all
🍺  /usr/local/Cellar/html2text/1.3.2a: 8 files, 308K, built in 29 seconds
$ brew install hub --HEAD
==> Cloning https://github.com/github/hub.git
Cloning into '/Library/Caches/Homebrew/hub--git'...
==> Checking out branch master
==> script/build
==> Caveats
Bash completion has been installed to:
/usr/local/etc/bash_completion.d

zsh completion has been installed to:
/usr/local/share/zsh/site-functions
==> Summary
🍺  /usr/local/Cellar/hub/HEAD: 6 files, 9.3M, built in 14 seconds
$ brew install jpeg
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/jpeg-8d.yosemite.bottle.2.tar.gz
==> Pouring jpeg-8d.yosemite.bottle.2.tar.gz
🍺  /usr/local/Cellar/jpeg/8d: 18 files, 776K
$ brew install libtasn1
Warning: libtasn1-4.2 already installed
$ brew install libtiff
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/libtiff-4.0.3.yosemite.bottle.tar.gz
==> Pouring libtiff-4.0.3.yosemite.bottle.tar.gz
🍺  /usr/local/Cellar/libtiff/4.0.3: 254 files, 3.8M
$ brew install lua
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/lua-5.2.3_1.yosemite.bottle.tar.gz
==> Pouring lua-5.2.3_1.yosemite.bottle.tar.gz
🍺  /usr/local/Cellar/lua/5.2.3_1: 13 files, 308K
$ brew install mercurial
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/mercurial-3.2.1.yosemite.bottle.tar.gz
==> Pouring mercurial-3.2.1.yosemite.bottle.tar.gz
==> Caveats
Bash completion has been installed to:
/usr/local/etc/bash_completion.d

zsh completion has been installed to:
/usr/local/share/zsh/site-functions

Python modules have been installed and Homebrew's site-packages is not
in your Python sys.path, so you will not be able to import the modules
this formula installed. If you plan to develop with these modules,
please run:
mkdir -p /Users/catfist/Library/Python/2.7/lib/python/site-packages
echo 'import site; site.addsitedir("/usr/local/lib/python2.7/site-packages")' >> /Users/catfist/Library/Python/2.7/lib/python/site-packages/homebrew.pth
==> Summary
🍺  /usr/local/Cellar/mercurial/3.2.1: 364 files, 4.8M
$ brew install nettle
Warning: nettle-2.7.1 already installed
$ brew install nkf
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/nkf-2.1.3.yosemite.bottle.tar.gz
==> Pouring nkf-2.1.3.yosemite.bottle.tar.gz
🍺  /usr/local/Cellar/nkf/2.1.3: 4 files, 352K
$ brew install node
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/node-0.10.33_1.yosemite.bottle.10.tar.gz
==> Pouring node-0.10.33_1.yosemite.bottle.10.tar.gz
==> Caveats
If you update npm itself, do NOT use the npm update command.
The upstream-recommended way to update npm is:
npm install -g npm@latest
==> make uninstall
==> make install
==> Summary
🍺  /usr/local/Cellar/node/0.10.33_1: 2080 files, 21M
$ brew install npm
Warning: node-0.10.33_1 already installed
$ brew install pandoc
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/pandoc-1.13.1.yosemite.bottle.1.tar.gz
==> Pouring pandoc-1.13.1.yosemite.bottle.1.tar.gz
🍺  /usr/local/Cellar/pandoc/1.13.1: 44 files, 73M
$ brew install python
==> Installing dependencies for python: readline, sqlite, gdbm
==> Installing python dependency: readline
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/readline-6.3.8.yosemite.bottle.tar.gz
==> Pouring readline-6.3.8.yosemite.bottle.tar.gz
==> Caveats
This formula is keg-only, which means it was not symlinked into /usr/local.

Mac OS X provides similar software, and installing this software in
parallel can cause all kinds of trouble.

OS X provides the BSD libedit library, which shadows libreadline.
In order to prevent conflicts when programs look for libreadline we are
defaulting this GNU Readline installation to keg-only.

Generally there are no consequences of this for you. If you build your
own software and it requires this formula, you'll need to add to your
build variables:

LDFLAGS:  -L/usr/local/opt/readline/lib
CPPFLAGS: -I/usr/local/opt/readline/include

==> Summary
🍺  /usr/local/Cellar/readline/6.3.8: 40 files, 2.1M
==> Installing python dependency: sqlite
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/sqlite-3.8.7.1.yosemite.bottle.tar.gz
==> Pouring sqlite-3.8.7.1.yosemite.bottle.tar.gz
==> Caveats
This formula is keg-only, which means it was not symlinked into /usr/local.

Mac OS X already provides this software and installing another version in
parallel can cause all kinds of trouble.

OS X provides an older sqlite3.

Generally there are no consequences of this for you. If you build your
own software and it requires this formula, you'll need to add to your
build variables:

LDFLAGS:  -L/usr/local/opt/sqlite/lib
CPPFLAGS: -I/usr/local/opt/sqlite/include

==> Summary
🍺  /usr/local/Cellar/sqlite/3.8.7.1: 9 files, 2.1M
==> Installing python dependency: gdbm
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/gdbm-1.11.yosemite.bottle.1.tar.gz
==> Pouring gdbm-1.11.yosemite.bottle.1.tar.gz
🍺  /usr/local/Cellar/gdbm/1.11: 17 files, 532K
==> Installing python
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/python-2.7.8_2.yosemite.bottle.3.tar.gz
==> Pouring python-2.7.8_2.yosemite.bottle.3.tar.gz
==> Caveats
Setuptools and Pip have been installed. To update them
pip install --upgrade setuptools
pip install --upgrade pip

You can install Python packages with
pip install <package>

They will install into the site-package directory
/usr/local/lib/python2.7/site-packages

See: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Homebrew-and-Python.md

.app bundles were installed.
Run `brew linkapps` to symlink these to /Applications.
==> /usr/local/Cellar/python/2.7.8_2/bin/python -s setup.py --no-user-cfg install --force --verbose --install-scripts=/usr/local/Cellar/python/2.7.8_2/bin --install-lib=/usr/local/lib/python2.7/site-packages
==> /usr/local/Cellar/python/2.7.8_2/bin/python -s setup.py --no-user-cfg install --force --verbose --install-scripts=/usr/local/Cellar/python/2.7.8_2/bin --install-lib=/usr/local/lib/python2.7/site-packages
==> Summary
🍺  /usr/local/Cellar/python/2.7.8_2: 4776 files, 76M
$ brew linkapps
Linking /usr/local/Cellar/python/2.7.8_2/IDLE.app
Linking /usr/local/Cellar/python/2.7.8_2/Python Launcher.app
Linking /usr/local/Cellar/terminal-notifier/1.6.2/terminal-notifier.app
Finished linking. Find the links under /Applications.
$ brew install rbenv
==> Downloading https://github.com/sstephenson/rbenv/archive/v0.4.0.tar.gz
==> Caveats
To use Homebrew's directories rather than ~/.rbenv add to your profile:
export RBENV_ROOT=/usr/local/var/rbenv

To enable shims and autocompletion add to your profile:
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
==> Summary
🍺  /usr/local/Cellar/rbenv/0.4.0: 31 files, 152K, built in 4 seconds
$ brew install rename
==> Downloading https://github.com/ap/rename/archive/v1.600.tar.gz
==> pod2man rename rename.1
🍺  /usr/local/Cellar/rename/1.600: 3 files, 48K, built in 28 seconds
$ brew install ruby-build
==> Downloading https://github.com/sstephenson/ruby-build/archive/v20141128.tar.gz
==> ./install.sh
🍺  /usr/local/Cellar/ruby-build/20141128: 139 files, 596K, built in 5 seconds
$ brew install todo-txt
==> Downloading https://github.com/ginatrapani/todo.txt-cli/releases/download/v2.10/todo.txt_cli-2.10.tar.gz
==> Caveats
To configure, copy the default config to your HOME and edit it:
cp /usr/local/Cellar/todo-txt/2.10/todo.cfg ~/.todo.cfg

Bash completion has been installed to:
/usr/local/etc/bash_completion.d
==> Summary
🍺  /usr/local/Cellar/todo-txt/2.10: 4 files, 60K, built in 3 seconds
$ brew install tree
==> Downloading http://mama.indstate.edu/users/ice/tree/src/tree-1.7.0.tgz
==> make prefix=/usr/local/Cellar/tree/1.7.0 MANDIR=/usr/local/Cellar/tree/1.7.0/share/man/man1 CC=clang CFLAGS=-fomit-frame-pointer LDFLAGS= OBJS=tree.o unix.o html.o xml.o hash.o color.o strverscmp.o json.o install
🍺  /usr/local/Cellar/tree/1.7.0: 7 files, 128K, built in 6 seconds
$ brew install vim --HEAD
==> Cloning https://vim.googlecode.com/hg/
requesting all changes
adding changesets
adding manifests
adding file changes
added 6424 changesets with 31810 changes to 2757 files (+2 heads)
updating to branch default
2575 files updated, 0 files merged, 0 files removed, 0 files unresolved
==> ./configure --prefix=/usr/local --mandir=/usr/local/Cellar/vim/HEAD/share/man --enable-multibyte --with-tlib=ncurses --enable-cscope --with-features=huge --with-compiledby=Homebrew     --enable-perlinterp --enable-pythoninterp --enable-rubyinterp --enable-gui=no --without-x
==> make
==> make install prefix=/usr/local/Cellar/vim/HEAD STRIP=true
🍺  /usr/local/Cellar/vim/HEAD: 1600 files, 26M, built in 4.8 minutes
$ brew install xz
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/xz-5.0.7.yosemite.bottle.tar.gz
==> Pouring xz-5.0.7.yosemite.bottle.tar.gz
🍺  /usr/local/Cellar/xz/5.0.7: 58 files, 1.5M
$ brew install z
==> Downloading https://github.com/rupa/z/archive/v1.8.tar.gz
==> Caveats
For Bash or Zsh, put something like this in your $HOME/.bashrc or $HOME/.zshrc:
. `brew --prefix`/etc/profile.d/z.sh
==> Summary
🍺  /usr/local/Cellar/z/1.8: 4 files, 32K, built in 4 seconds
$ brew install fu
Error: No available formula for fu
Searching formulae...
afuse
confuse
dfu-programmer
dfu-util
diffuse
diffutils
ext2fuse
ext4fuse
funcoeszz
fuse-zip
fuse4x
fuse4x-kext
fuseki
fuzzy-find
ifuse
lensfun
osxfuse
tiny-fugue
Searching taps...
homebrew/nginx/nginx-full
homebrew/games/fuego
homebrew/science/enblend-enfuse
homebrew/science/mfusg
Caskroom/cask/deskfun
Caskroom/cask/enfusegui
Caskroom/cask/fender-fuse
Caskroom/cask/fugu
Caskroom/cask/functionflip
Caskroom/cask/futuniuniu
Caskroom/cask/fuze
Caskroom/cask/giffun
Caskroom/cask/ifunbox
Caskroom/cask/macfusion
Caskroom/cask/osxfuse
Caskroom/cask/tofu
Caskroom/cask/uber-network-fuser
Caskroom/cask/vmware-fusion
Caskroom/cask/yorufukurou
175-28-148-67:~ catfist$ brew file edit
Error detected while processing /Users/catfist/.vimrc:
line  128:
E185: Cannot find color scheme 'solarized'
Press ENTER or type command to continue
175-28-148-67:~ catfist$ brew file update && say end || say error
cd /usr/local/Library/catfist_brewfile
$ git pull
Already up-to-date.
$ brew install --sidebar-patch --trash-patch --with-slang mutt
Warning: mutt-1.5.23_2 already installed
$ brew install npm
Warning: node-0.10.33_1 already installed

Please install Activity Timer - Pomodoro Edition from App Store!

Please install Alfred from App Store!

Please install AutoKeyboard from App Store!

Please install ClawMenu from App Store!

Please install CLCL Lite from App Store!

Please install Cloud Outliner from App Store!

Please install Color Picker from App Store!

Please install Dash from App Store!

Please install Doit.im from App Store!

Please install Epochulator from App Store!

Please install Evernote from App Store!

Please install ForkLift from App Store!

Please install Gifted from App Store!

Please install iBooks Author from App Store!

Please install iDropCopy from App Store!

Please install iGif Maker from App Store!

Please install iText Express from App Store!

Please install Kindle from App Store!

Please install Leafnote from App Store!

Please install Marboo from App Store!

Please install MarkdownLife from App Store!

Please install Marked 2 from App Store!

Please install Marko from App Store!

Please install MemoryBooster from App Store!

Please install MenuPop from App Store!

Please install Microsoft OneNote from App Store!

Please install OptimPrefs from App Store!

Please install PerfectMind from App Store!

Please install Prototypr from App Store!

Please install Punch from App Store!

Please install Quick Note from App Store!

Please install RoboRam from App Store!

Please install Screeny from App Store!

Please install Simplenote from App Store!

Please install Skitch from App Store!

Please install Smart Memory from App Store!

Please install Smultron 6 from App Store!

Please install Softmatic QR Perfect from App Store!

Please install SplashShopper from App Store!

Please install SpotFiles from App Store!

Please install TaskBadges from App Store!

Please install TextWrangler from App Store!

Please install The Unarchiver from App Store!

Please install Tomato Ticker - The Pomodoro Timer from App Store!

Please install Total Manager from App Store!

Please install Tree from App Store!

Please install uFocus from App Store!

Please install Webshot from App Store!

Please install Window Magnet from App Store!

Please install Writedown! from App Store!

Please install Wunderlist from App Store!

Please install XClean from App Store!

Please install Xcode from App Store!

Please install xLine from App Store!
$ but not corresponding casks were found.
Traceback (most recent call last):
  File "/usr/local/bin/brew-file", line 1535, in <module>
    main()
  File "/usr/local/bin/brew-file", line 1532, in main
    b.execute()
  File "/usr/local/bin/brew-file", line 1349, in execute
    self.install()
  File "/usr/local/bin/brew-file", line 1083, in install
    self.proc(c)
  File "/usr/local/bin/brew-file", line 169, in proc
    p = subprocess.Popen(cmd, stdout = subprocess.PIPE, stderr = subprocess.STDOUT)
  File "/usr/local/Cellar/python/2.7.8_2/Frameworks/Python.framework/Versions/2.7/lib/python2.7/subprocess.py", line 710, in __init__
    errread, errwrite)
  File "/usr/local/Cellar/python/2.7.8_2/Frameworks/Python.framework/Versions/2.7/lib/python2.7/subprocess.py", line 1327, in _execute_child
    raise child_exception
OSError: [Errno 2] No such file or directory
175-28-148-67:~ catfist$ 
```
