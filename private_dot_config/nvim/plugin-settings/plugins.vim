
call plug#begin(stdpath('data') . '/plugged')

Plug 'mhinz/vim-startify'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Themes
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'nightsense/cosmic_latte'

" Plug 'liuchengxu/vista.vim'
" Plug 'sheerun/vim-polyglot'

call plug#end()



execute 'source '.stdpath('config').'/plugin-settings/polyglot.vim'
execute 'source '.stdpath('config').'/plugin-settings/gitgutter.vim'
execute 'source '.stdpath('config').'/plugin-settings/coc.vim'

