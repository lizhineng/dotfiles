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
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-surround'
  Plug 'tomtom/tcomment_vim'
  Plug 'Chiel92/vim-autoformat'
  Plug 'gorodinskiy/vim-coloresque'

" auto completion
  Plug 'Shougo/deoplete.nvim'
  Plug 'Shougo/neco-vim'
  Plug 'Shougo/neoinclude.vim'
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'honza/vim-snippets'

" front-end related
  Plug 'mattn/emmet-vim'
  Plug 'othree/html5.vim'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'cakebaker/scss-syntax.vim'

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
  set laststatus=2
  set tabstop=2 shiftwidth=2 expandtab
  set relativenumber number

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
  map <c-\> :NERDTreeToggle<cr>

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

" auto reload the VIM's configration after saving
  au FileType vim autocmd! bufwritepost init.vim source %

" }}}


" Plugins Settings {{{

" ---
" NERDTreee
"
  autocmd StdinReadPre * let s:std_in=1
  let NERDTreeShowHidden=1
  let NERDTreeWinSize=30
  let NERDTreeIgnore = ['\.pyc$', '__pycache__', '.DS_Store']
  let g:NERDTreeAutoDeleteBuffer=1

" NERDTress File highlighting
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction

  call NERDTreeHighlightFile('jade', 'green', 'none', 'green', 'none')
  call NERDTreeHighlightFile('md', 'blue', 'none', '#6699CC', 'none')
  call NERDTreeHighlightFile('config', 'yellow', 'none', '#d8a235', 'none')
  call NERDTreeHighlightFile('conf', 'yellow', 'none', '#d8a235', 'none')
  call NERDTreeHighlightFile('json', 'green', 'none', '#d8a235', 'none')
  call NERDTreeHighlightFile('html', 'yellow', 'none', '#d8a235', 'none')
  call NERDTreeHighlightFile('css', 'cyan', 'none', '#5486C0', 'none')
  call NERDTreeHighlightFile('scss', 'cyan', 'none', '#5486C0', 'none')
  call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 'none')
  call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'none')
  call NERDTreeHighlightFile('ts', 'Blue', 'none', '#6699cc', 'none')
  call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'none')
  call NERDTreeHighlightFile('gitconfig', 'black', 'none', '#686868', 'none')
  call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#7F7F7F', 'none')

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
" Airline
"
  let g:airline_powerline_fonts = 1

" }}}
