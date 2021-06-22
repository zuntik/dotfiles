
set mouse=a								" activate the mouse
set scrolloff=5							" keep the cursor visible within 5 lines when scrolling
set nocompatible
set number                              " Line numbers
set cursorline

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set autoindent                          " Good auto indent
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc


autocmd FileType markdown,text setlocal spell
" set spell
set spelllang=pt_pt,en


