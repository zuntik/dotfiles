set mouse=a


" https://www.vimfromscratch.com/articles/vim-for-python/
" vim polyglot
let g:polyglot_disabled = ['css']


" https://github.com/numirias/semshi#semshi-is-slow-together-with-deopletenvim
let g:deoplete#auto_complete_delay = 100

" vim-gitgutter
command GGS GitGutterSignsEnable

call plug#begin(stdpath('data') . '/plugged')

Plug 'Shougo/deoplete.nvim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'liuchengxu/vista.vim'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'
Plug 'davidhalter/jedi'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

call plug#end()
 


set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab 
