" overwrite cscope_maps to use cecscope instead of cscope with '\'
nmap <C-\>s :CSL s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :CSL g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :CSL c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :CSL t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :CSL e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :CSL i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :CSL d <C-R>=expand("<cword>")<CR><CR>
