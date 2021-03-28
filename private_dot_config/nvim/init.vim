


call plug#begin(stdpath('data') . '/plugged')
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-commentary'
Plug 'liuchengxu/vista.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'rhysd/git-messenger.vim'
Plug 'dense-analysis/ale'
Plug 'liuchengxu/vista.vim'

Plug 'morhetz/gruvbox'
Plug 'nightsense/cosmic_latte'

Plug 'tpope/vim-fugitive'
" vim-gitgutter
command GGS GitGutterSignsEnable
Plug 'airblade/vim-gitgutter'


let g:polyglot_disabled = ['python']
Plug 'sheerun/vim-polyglot'


call plug#end()
 

let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python2'

" activate the mouse
set mouse=a

" keep the cursor visible within 5 lines when scrolling
set scrolloff=5

set guifont=Hack:h11

set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab 

set nocompatible

set spell
set spelllang=pt_pt,en

set number

colorscheme cosmic_latte


set background=dark
