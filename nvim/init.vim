so ~/.vim/plugins.vim

let mapleader=','
set backspace=indent,eol,start
set nonumber
set autoread

" Ignore dist and build folders
set wildignore+=*/dist/**,*/build/**,*/target/**

" Ignore libs
set wildignore+=*/node_modules/**,*/bower_components/**,*/vendor/**

" Ignore images, pdfs, and font files
set wildignore+=*.png,*.PNG,*.jpg,*.jpeg,*.JPG,*.JPEG,*.pdf
set wildignore+=*.ttf,*.otf,*.woff,*.woff2,*.eot

" Ignore compiled files
set wildignore+=*.class,*.pyc

" No damn bells!
set noerrorbells visualbell t_vb=

" Automaticaaly write the file when switching buffers
set autowriteall

" Set our desired autocompletion matching
set complete=.,w,b,u

set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

" Use system clipbaord
set clipboard+=unnamedplus


" ------------------ Visuals ------------------ "

set t_CO=256
set guifont=Fira\ Code:h17
set linespace=15

" Hide GUI's tabs
set guioptions-=e

" Disable GUI scrollbars
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" Fake a custom left padding for each window
set foldcolumn=2
hi foldcolumn guibg=bg ctermbg=NONE

" Get rid of ugly split borders
hi vertsplit guifg=bg guibg=bg

" Hide the white bar of the tabs in cli
hi TabLineFill ctermfg=NONE ctermbg=NONE cterm=NONE
hi TabLine ctermfg=242 ctermbg=NONE cterm=NONE
hi TabLineSel ctermfg=NONE ctermbg=NONE cterm=NONE


" ----------------- Searching ----------------- "

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch


" -------------- Split Mangement -------------- "

set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


" ------------------ Mapping ------------------ "

" Make it easy to edit the .vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Find function more quickly
nmap <Leader>f :tag<space>

" Toggle the display of line number
nmap <c-n> :set number!<cr>

" Quickly switch between buffers
nnoremap <silent> [b :bprevious<cr>
nnoremap <silent> ]b :bnext<cr>
nnoremap <silent> [B :bfirst<cr>
nnoremap <silent> ]B :blast<cr>

" Easy expansion of the active file directory
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'


" -------------- Plugins Settings ------------- "

" /
" / CtrlP
" /
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
nmap <D-p> :CtrlP<cr>
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

" /
" / Greplace.vim
" /
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"/
"/ pdv
"/
let g:pdv_template_dir = $HOME . "/.vim/dein/repos/github.com/tobyS/pdv/templates_snip"

"/
"/ Ultisnips
"/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"/
"/ Emmet
"/
" Enable just for HTML and CSS file
let g:user_emmet_install_global = 0
autocmd FileType html,vue,css EmmetInstall

" Remap the trigger key
"let g:user_emmet_leader_key='<tab>'


" --------------- PHP Specific ---------------- "

" Automatic PSR-2 formatting
autocmd FileType php nmap <leader>l :silent !php-cs-fixer fix "%" --rules=@PSR2<cr>

" Automatic generate PHPdoc by pdv plugin
autocmd FileType php nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>


" ------------- Laravel Specific -------------- "

nmap <leader>lm :!php artisan make:


" --------------- Auto Commands --------------- "

" Automatically source the .vimrc file on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END



" ------------------- Misc -------------------- "

" MacVIM startup is too slow
let g:did_install_default_menus = 1
let g:did_menu_trans = 1

" Python interpreter
let g:python_host_prog="/usr/local/bin/python2"
let g:python3_host_prog="/usr/local/bin/python3"


" Notes and Tips
" - Press 'zz' to instanly center the line where the cursor is located.
" - Press '<c>]' to jump into the implementation of the function.
" - Press '<c>^' to jump back the previous buffer.
" - Press 'm{letter}' to set a mark.
" - Press ''{letter}' to go back to the specific mark line.
" - Press '`{letter}' to go back to the specific mark line with the last column position.
