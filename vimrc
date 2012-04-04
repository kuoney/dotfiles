" kuoney's vimrc file"
""""""""""""""""""""""

" General settings
set nocompatible	" use vim, forget about vi
set exrc		" allow vimrc files in specific directories
set visualbell	" silence the bell, use a flash instead
set tabstop=4	" set tab to 4 spaces
set background=dark " set background to dark
set textwidth=80	" wrap text after 80 characters
set nohlsearch	" do no highlight search results
set ruler		" show cursor position
set showmatch	" show matching brackets
set incsearch	" incremental search
set history=100	" command line history

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