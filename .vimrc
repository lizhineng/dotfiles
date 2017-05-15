so ~/.vim/plugins.vim

let mapleader=','
set backspace=indent,eol,start
set nu
set rnu


" ------------------ Visuals ------------------ "

colorscheme desert
set t_CO=256
set guifont=Fira\ Code:h16
set linespace=15

set guioptions-=e

" Disable GUI scrollbars
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R


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


" ------------------ Plugins ------------------ "

" /
" / CtrlP
" /
let g:ctrlp_custom_ignore = "node_modules\DS_Store\git"

nmap <D-p> :CtrlP<cr>
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

" /
" / NERDTree
" /
let NERDTreeHijackNetrw = 0

nmap <D-1> :NERDTreeToggle<cr>


" --------------- Auto Commands --------------- "

" Automatically source the .vimrc file on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END
