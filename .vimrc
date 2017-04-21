syntax enable
colorscheme desert
let mapleader = ','
set backspace=indent,eol,start
set nu
set rnu 


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
