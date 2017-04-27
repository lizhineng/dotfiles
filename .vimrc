so ~/.vim/plugins.vim

let mapleader=','
set backspace=indent,eol,start
set nu
set rnu


" ------------------ Visuals ------------------ "

colorscheme desert
set t_CO=256
set guifont=Hack:h16
set linespace=12

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

" Make NERDTree easier to toggle
nmap <D-1> :NERDTreeToggle<cr>

" CtrlP
nmap <C-R> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>


" -------------- Plugins Settings ------------- "

" /
" / CtrlP
" /
let g:ctrlp_map = '<C-O>'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules|vendor)$',
    \ 'file': '\v\.(exe|so|dll|DS_Store)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }


" --------------- Auto Commands --------------- "

" Automatically source the .vimrc file on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END
