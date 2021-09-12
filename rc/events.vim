"------------------------------------------------------------------------------
" Autocmd
autocmd MyAutoCmd FileType,Syntax,BufNewFile,BufNew,BufRead *?
    \ call vimrc#on_filetype()

" 自动保存上次编辑位置
autocmd MyAutoCmd BufReadPost *
     \ if line("'\"") > 0
     \ | if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif |
     \ endif

" autocmd MyAutoCmd BufReadPost * set paste

" 自动保存
" autocmd MyAutoCmd FocusLost * silent! wa
autocmd MyAutoCmd FocusLost * silent! wa

