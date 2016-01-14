" ---
"  Configuration file for NeoVIM
"
"  Author: Li Zhineng <lizhineng@gmail.com>
"  URL:	http://zhineng.li
" ---


" Plugins {{{

  call plug#begin('~/.config/nvim/plugged')

" Color Theme: Solarized
" Link: https://github.com/altercation/vim-colors-solarized
  Plug 'altercation/vim-colors-solarized'

" utilities
  Plug 'bling/vim-airline'
  Plug 'tpope/vim-surround'
  Plug 'tomtom/tcomment_vim'
  Plug 'Chiel92/vim-autoformat'
  Plug 'gorodinskiy/vim-coloresque'
  Plug 'Shougo/unite.vim'
  Plug 'Shougo/unite-outline'
  Plug 'Shougo/vimfiler' | Plug 'ryanoasis/vim-devicons'

" auto completion
  Plug 'Shougo/deoplete.nvim'
  Plug 'Shougo/neco-vim'
  Plug 'Shougo/neoinclude.vim'
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'honza/vim-snippets'

" front-end related
  Plug 'mattn/emmet-vim', { 'for': 'html' }
  Plug 'gregsexton/MatchTag', { 'for': 'html' }
  Plug 'othree/html5.vim', { 'for': 'html' }
  Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
  Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
  Plug 'KabbAmine/gulp-vim'

" Add plugins to &runtimepath
  call plug#end()

" }}}


" Editor Settings {{{

  set clipboard+=unnamedplus
  set autoread

  " configure backspace so it acts as it should act
  set backspace=eol,start,indent
  set whichwrap+=<,>,h,l

  set noshowmode

" do not backup files
  set nobackup
  set noswapfile

  set undofile
  set undodir="$HOME/.VIM_UNDO_FILES"

  filetype on
  filetype plugin indent on

" }}}


" Apperance {{{

  syntax enable
  colorscheme solarized
  set guifont=Droid\ Sans\ Mono\ for\ Powerline:h11
  set laststatus=2
  set tabstop=2 shiftwidth=2 expandtab
  set relativenumber number
  set encoding=utf-8

" change the terminal's title
  set title

" }}}


" Key Mapping {{{

" leader is ,
  let mapleader = ','

" go to command line without shift-;
  nnoremap ; :

" toggle paste mode
  set pastetoggle=<f6>

" NERDTree
  map <c-\> :VimFilerExplorer<cr>

" TComment
  vnoremap <c-/> :TComment<cr>

" fast saving
  map <leader>w :w<cr>

" exit insert, dd line, enter insert
  inoremap <c-d> <esc>ddi
  noremap H ^
  noremap L g_
  noremap J 5j
  noremap K 5k<Paste>

" Align blocks of text and keep them selected
  vmap < <gv
  vmap > >gv

  map <esc> :noh<cr>

" ,f to format code, requires formatters: read the docs
  noremap <leader>f :Autoformat<CR>

" }}}


" Misc {{{

" Remember cursor position between vim sessions
  autocmd BufReadPost *
              \ if line("'\"") > 0 && line ("'\"") <= line("$") |
              \   exe "normal! g'\"" |
              \ endif
              " center buffer around cursor when opening files
  autocmd BufRead * normal zz

" }}}


" Plugins Settings {{{

" ---
" Deoplete
"
  let g:deoplete#enable_at_startup = 1

" ---
" Snippets
"
" Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1
  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)
  xmap <C-k> <Plug>(neosnippet_expand_target)

" Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory='~/.config/nvim/plugged/neosnippet-snippets/neosnippets'

" SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

" ---
"  VIMFiler
"
  let g:vimfiler_tree_leaf_icon = ' '
  let g:vimfiler_tree_opened_icon = '▾'
  let g:vimfiler_tree_closed_icon = '▸'
  let g:vimfiler_file_icon = '-'
  let g:vimfiler_marked_file_icon = '*'

" }}}
