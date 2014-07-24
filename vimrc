" kuoney's vimrc file"
""""""""""""""""""""""

" General settings
set nocompatible	" use vim, forget about vi
set exrc		" allow vimrc files in specific directories
set visualbell	" silence the bell, use a flash instead
set tabstop=8	" set tab to 4 spaces
set textwidth=80	" wrap text after 80 characters
set nohlsearch	" do no highlight search results
set ruler		" show cursor position
set showmatch	" show matching brackets
set incsearch	" incremental search
set history=100	" command line history
set modelines=0	" disable modelines
set nomodeline	" disable modelines

syntax on

" Plugin Section
""""""""""""""""
" Pathogen
call pathogen#infect()
filetype plugin indent on	" Has to happen after the pathogen line

" fugitive
set statusline=%{fugitive#statusline()}

" NERDTree
set encoding=utf-8	" Shows NERDTree properly on putty
set fileencodings=utf-8,iso-8859-2,win-1250

" cecscope
autocmd! FileType qf set winheight=10 " min quickfix window height

" solarized - color schemes / syn highlighting
set background=dark
colorscheme solarized
