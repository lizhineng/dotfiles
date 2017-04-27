if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.dotfiles/.vim/dein')
  call dein#begin('~/.dotfiles/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('scrooloose/nerdtree')
  call dein#add('ctrlpvim/ctrlp.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
