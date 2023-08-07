" Required:
set runtimepath+=~/.dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.dotfiles/.vim/dein')
  call dein#begin('~/.dotfiles/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Themes
  call dein#add('dracula/vim')

  " Common
  call dein#add('tpope/vim-vinegar')
  call dein#add('scrooloose/nerdtree')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('rking/ag.vim')
  call dein#add('skwp/greplace.vim')
  call dein#add('tpope/vim-surround')
  call dein#add('SirVer/ultisnips')
  call dein#add('editorconfig/editorconfig-vim')

  " Front-end
  call dein#add('mxw/vim-jsx')
  call dein#add('posva/vim-vue')
  call dein#add('mattn/emmet-vim')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('Chiel92/vim-autoformat')

  " PHP
  call dein#add('StanAngeloff/php.vim')
  call dein#add('arnaud-lb/vim-php-namespace')
  call dein#add('tobyS/vmustache')
  call dein#add('tobyS/pdv')

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
