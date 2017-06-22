" pretty symbols for MacVIM
set macligatures

" Disable the print key for MacVIM
if has("gui_macvim")
    macmenu &File.Print key=<nop>
endif
