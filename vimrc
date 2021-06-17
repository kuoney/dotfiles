" kuoney's vimrc file"
""""""""""""""""""""""

" General settings
set nocompatible	" use vim, forget about vi
set exrc		" allow vimrc files in specific directories
set visualbell	" silence the bell, use a flash instead
set tabstop=8	" set tab to 8 spaces
set textwidth=80	" wrap text after 80 characters
set nohlsearch	" do no highlight search results
set ruler		" show cursor position
set showmatch	" show matching brackets
set incsearch	" incremental search
set history=100	" command line history
set modelines=0	" disable modelines
set nomodeline	" disable modelines
set noundofile	" do not create .un~ file for undo history

syntax enable

" Windows Section
"""""""""""""""""
if has('win32') || has('win64')
	let $DOTFILES = 'E:/oney/dotfiles/vim'
	set runtimepath=$DOTFILES,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$DOTFILES/after
	set nobackup
	set nowritebackup
endif

if has('gui_running')
	set guifont=Consolas:h12
endif

" Plugin Section
""""""""""""""""
" Pathogen
filetype on
filetype off
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
" Use F5 key to toggle between dark and light backgrounds
call togglebg#map("<F5>")

" Force all .md files to be markdown instead of modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" DirDiff
let g:DirDiffExcludes = ".git,.svn,CVS,*.class,*.exe,.*.swp,*.o"
let g:DirDiffIgnore = "Id:,Revision:,Date:"
