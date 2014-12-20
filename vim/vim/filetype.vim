if exists("did_load_filetypes")
    finish
endif
" ================ Syntax Highlighting Extension =====
au BufNewFile,BufRead *.gradle setf groovy
au BufNewFile,BufRead *.md setf markdown
au FileType markdown set tabstop=4 shiftwidth=4

" ================ GO Extensions ====================

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>g <Plug>(go-install)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>e <Plug>(go-rename)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au BufWritePost *.go :silent:GoBuild

