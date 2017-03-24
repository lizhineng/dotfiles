" ---
"  Configuration file for NeoVIM
"
"  Author:    Li Zhineng <lizhineng@gmail.com>
"  URL:	      https://zhineng.li
"  Repo:      https://github.com/lizhineng/.dotfiles
" ---


" Plugins {{{

" set up a dark powered plugin manager
  if (!isdirectory(expand("$HOME/.dotfiles/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.dotfiles/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.dotfiles/nvim/repos/github.com/Shougo/dein.vim"))
  endif

  set runtimepath^=~/.dotfiles/nvim/repos/github.com/Shougo/dein.vim/
  call dein#begin(expand('~/.dotfiles/nvim'))

  call dein#add('Shougo/dein.vim')

" Color Theme: Oceanic Next
" Link: https://github.com/mhartington/oceanic-next
  call dein#add('mhartington/oceanic-next')

" utilities
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('Yggdroot/indentLine')
  call dein#add('ap/vim-css-color')
  call dein#add('scrooloose/nerdtree')
  call dein#add('ctrlpvim/ctrlp.vim')

" syntax
  call dein#add('dhruvasagar/vim-table-mode')
  call dein#add('suan/vim-instant-markdown', {'on_ft': 'markdown'})
  call dein#add('Quramy/tsuquyomi')
  call dein#add('elzr/vim-json', {'on_ft': 'json'})

" front-end
  call dein#add('valloric/MatchTagAlways', {'on_ft': 'html'})
  call dein#add('mattn/emmet-vim', {'on_ft': 'html'})
  call dein#add('valloric/MatchTagAlways', {'on_ft': 'html'})
  call dein#add('hail2u/vim-css3-syntax', {'on_ft':['css','scss']})
  call dein#add('othree/yajs.vim', {'on_ft': 'javascript'})
  call dein#add('othree/jsdoc-syntax.vim', {'on_ft':['javascript', 'typescript']})
  call dein#add('othree/es.next.syntax.vim', {'on_ft': 'javascript'})
  call dein#add('othree/javascript-libraries-syntax.vim')
  call dein#add('1995eaton/vim-better-javascript-completion', {'on_ft': ['javascript']})
  call dein#add('Raimondi/delimitMate', {'on_ft': ['javascript', 'typescript', 'css', 'scss']})

" Python
  call dein#add('tmhedberg/SimpylFold', {'on_ft': 'python'})

" Git
  call dein#add('tpope/vim-fugitive')
  call dein#add('jreybert/vimagit')
  call dein#add('mhinz/vim-signify')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('https://github.com/jaxbot/github-issues.vim')

  call dein#add('tpope/vim-repeat')
  call dein#add('benekastah/neomake')
  call dein#add('AndrewRadev/switch.vim')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('tmux-plugins/vim-tmux-focus-events')
  call dein#add('vim-airline/vim-airline')
  call dein#add('tpope/vim-surround')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('Chiel92/vim-autoformat')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/unite-outline')
  call dein#add('ujihisa/unite-colorscheme')
  call dein#add('junkblocker/unite-codesearch')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

  call dein#add('Shougo/neco-vim', {'on_ft': 'vim'})
  call dein#add('Shougo/neoinclude.vim')
  call dein#add('ujihisa/neco-look', {'on_ft': ['markdown','text','html']})
  call dein#add('Konfekt/FastFold')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('honza/vim-snippets')
  call dein#add('matthewsimo/angular-vim-snippets')
  call dein#add('mhinz/vim-sayonara')
  call dein#add('mattn/webapi-vim')
  call dein#add('mattn/gist-vim')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('rhysd/github-complete.vim')
  call dein#add('junegunn/goyo.vim')
  call dein#add('vim-scripts/SyntaxRange')
  call dein#add('itchyny/vim-cursorword')
  
  call dein#add('rhysd/nyaovim-popup-tooltip')
  call dein#add('troydm/asyncfinder.vim')
  call dein#add('nelstrom/vim-markdown-folding')
  call dein#add('tyru/markdown-codehl-onthefly.vim')
  call dein#add('ryanoasis/vim-devicons')

  " deoplete
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('carlitux/deoplete-ternjs')
  call dein#add('zchee/deoplete-jedi')

  if dein#check_install()
    call dein#install()
    let pluginsExist=1
  endif

  call dein#end()
  filetype plugin indent on

" }}}


" Editor Settings {{{
  " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  let $NEOVIM_JS_DEBUG='nvimjs.log'

  set clipboard+=unnamedplus
  set autoread

" currently needed for neovim paste issue
  set pastetoggle=<f6>
  set nopaste

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

  let g:jsx_ext_required = 0
  set complete=.,w,b,u,t,k
  let g:gitgutter_max_signs = 1000  " default value
  let g:used_javascript_libs = 'angularjs,angularuirouter'
  autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
  autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
  let g:indentLine_char='│'
  " enable deoplete
  let g:deoplete#enable_at_startup = 1
  let g:go_fmt_command = "goimports"
  let g:deoplete#sources#go = 'vim-go'
  let g:unite_source_codesearch_command = '$HOME/bin/csearch'
  let g:table_mode_corner="|"

" }}}


" Apperance {{{

  syntax enable
  "let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  colorscheme OceanicNext
  set background=dark

  set laststatus=2
  set tabstop=4 shiftwidth=4 expandtab
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

" recording macros is not my thing
  map q <Nop>

" exit insert, dd line, enter insert
  inoremap <c-d> <esc>ddi
  noremap H ^
  noremap L g_
  noremap J 5j
  noremap K 5k

" copy current files path to clipboard
  nmap cp :let @+ = expand("%") <cr>

" align blocks of text and keep them selected
  vmap < <gv
  vmap > >gv

  map <esc> :noh<cr>

" ,f to format code, requires formatters: read the docs
  noremap <leader>f :Autoformat<CR>

" delete the current line
  map - dd
  inoremap <c-d> <esc>ddi

" ,f to format code, requires formatters: read the docs
  noremap <leader>f :Autoformat<CR>

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

" }}}


" Plugins Settings {{{

" ---
" Deoplete
"
  let g:deoplete#enable_at_startup = 1

" ---
"  Ctrlp
"
  let g:ctrlp_map = '<c-o>'
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" ---
"  TComment
"
  vnoremap <c-/> :TComment<cr>

" ---
"  NERDTree
"
  map <C-\> :NERDTreeToggle<CR>
  autocmd StdinReadPre * let s:std_in=1

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
"  Airline
"
  let g:airline_theme='oceanicnext'

  nnoremap <silent> <leader>u :call dein#update()<CR>

  let g:tmux_navigator_no_mappings = 1

" }}}

" vim: foldmethod=marker
