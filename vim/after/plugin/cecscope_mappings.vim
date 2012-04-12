" overwrite cscope_maps to use cecscope instead of cscope with '\'
nnoremap <C-\>s :CSL s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>g :CSL g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>c :CSL c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>t :CSL t <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>e :CSL e <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-\>i :CSL i ^<C-R>=expand("<cfile>")<CR>$<CR>
nnoremap <C-\>d :CSL d <C-R>=expand("<cword>")<CR><CR>
