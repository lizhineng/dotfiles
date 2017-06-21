so ~/.vim/plugins.vim

let mapleader=','
set backspace=indent,eol,start
set nonumber

" No damn bells!
set noerrorbells visualbell t_vb=


" ------------------ Visuals ------------------ "

colorscheme dracula
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
hi foldcolumn guibg=bg

" Get rid of ugly split borders
hi vertsplit guifg=bg guibg=bg


" ----------------- Searching ----------------- "

set hlsearch
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


" -------------- Plugins Settings ------------- "

" /
" / CtrlP
" /
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules|vendor)$',
    \ 'file': '\v\.(exe|so|dll|DS_Store)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

nmap <D-p> :CtrlP<cr>
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

" /
" / NERDTree
" /
let NERDTreeHijackNetrw = 0

nmap <D-1> :NERDTreeToggle<cr>

" /
" / Greplace.vim
" /

set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'


" --------------- PHP Specific ---------------- "

" Automatically types use statements
" Import classes or functions (add use statements)
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

" Make class or function names fully qualified
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>


" ------------- Laravel Specific -------------- "

nmap <leader>lm :!php artisan make:


" --------------- Auto Commands --------------- "

" Automatically source the .vimrc file on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END


" Notes and Tips
" - Press 'zz' to instanly center the line where the cursor is located.
" - Press '<c>]' to jump into the implementation of the function.
" - Press '<c>^' to jump back the previous buffer.
