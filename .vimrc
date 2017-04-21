syntax enable
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


" ------------------ Mapping ------------------ "

" Make it easy to edit the .vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>


" --------------- Auto Commands --------------- "

" Automatically source the .vimrc file on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END
