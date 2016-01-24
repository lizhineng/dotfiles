" ---
"  Configuration file for NeoVIM
"
"  Author:    Li Zhineng <lizhineng@gmail.com>
"  URL:	      http://zhineng.li
"  Repo:      https://github.com/lizhineng/dotfiles
" ---


" Plugins {{{

  call plug#begin('~/.config/nvim/plugged')

" Color Theme: Oceanic Next
" Link: https://github.com/mhartington/oceanic-next
  Plug 'mhartington/oceanic-next'

" syntax
  Plug 'moll/vim-node'
  Plug 'othree/html5.vim', { 'for': 'html' }
  Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
  Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
  Plug '1995eaton/vim-better-javascript-completion', { 'for': 'js' }
  Plug 'burnettk/vim-angular'

" utilities
  Plug 'bling/vim-airline'
  Plug 'tpope/vim-surround'
  Plug 'tomtom/tcomment_vim'
  Plug 'Chiel92/vim-autoformat'
  Plug 'gorodinskiy/vim-coloresque', { 'for': 'css' }
  Plug 'Shougo/unite.vim'
  Plug 'Shougo/unite-outline'
  Plug 'scrooloose/nerdtree'
  Plug 'Shougo/vimfiler' | Plug 'ryanoasis/vim-devicons'
  Plug 'editorconfig/editorconfig-vim'

" git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'Xuyuanp/nerdtree-git-plugin'

" auto completion
  Plug 'Shougo/deoplete.nvim'
  Plug 'Shougo/neco-vim'
  Plug 'Shougo/neoinclude.vim'
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets' | Plug 'honza/vim-snippets'

" front-end related
  Plug 'mattn/emmet-vim', { 'for': 'html' }
  Plug 'gregsexton/MatchTag', { 'for': 'html' }
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

  set foldlevelstart=1
  set foldenable

  set undofile
  set undodir="$HOME/.VIM_UNDO_FILES"

" ignore case
  set ic

  filetype on
  filetype plugin indent on

" }}}


" Apperance {{{

  syntax enable
  "let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  colorscheme OceanicNext
  set background=dark

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

" fast saving
  map <leader>w :w<cr>

" No need for ex mode
  nnoremap Q <nop>

" exit insert, dd line, enter insert
  inoremap <c-d> <esc>ddi
  noremap H ^
  noremap L g_
  noremap J 5j
  noremap K 5k

" align blocks of text and keep them selected
  vmap < <gv
  vmap > >gv

  map <esc> :noh<cr>

" ,f to format code, requires formatters: read the docs
  noremap <leader>f :Autoformat<CR>

" delete the current line
  map - dd

" smart way to move between windows
  map <c-j> <c-w>j
  map <c-k> <c-w>k
  map <c-h> <c-w>h
  map <c-l> <c-w>l

" fast editing .vimrc
  map <silent> <leader>vimrc :e $MYVIMRC<cr>

  " move up and down a line
  nmap <M-k> mz:m-2<cr>`z
  nmap <M-j> mz:m+<cr>`z
  vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
  vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

  if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
  endif

" Space to toggle folds.
  nnoremap <Space> za
  vnoremap <Space> za

" }}}


" Misc {{{

" Remember cursor position between vim sessions
  autocmd BufReadPost *
              \ if line("'\"") > 0 && line ("'\"") <= line("$") |
              \   exe "normal! g'\"" |
              \ endif
              " center buffer around cursor when opening files
  autocmd BufRead * normal zz

" The settings for PHP files
  autocmd Filetype php setlocal ts=4 sts=4 sw=4

" The settings for js files
  autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

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
"  TComment
"
  vnoremap <c-/> :TComment<cr>

" ---
"  NERDTree
"
  let NERDTreeShowHidden=1
  map <c-n> :NERDTreeToggle<cr>

  " NERDTress File highlighting
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction

  call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
  call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
  call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
  call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
  call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" ---
"  VIMFiler
"
  let g:vimfiler_safe_mode_by_default = 0
  let g:vimfiler_tree_leaf_icon = ' '
  let g:vimfiler_tree_opened_icon = '▾'
  let g:vimfiler_tree_closed_icon = '▸'
  let g:vimfiler_file_icon = '-'
  let g:vimfiler_marked_file_icon = '*'
  map <c-\> :VimFiler<cr>

" ---
"  Airline
"
  let g:airline_theme='oceanicnext'

" }}}

" vim: foldmethod=marker
