


"------------------------------------------------------------------------------
" Autocmd
autocmd MyAutoCmd FileType,Syntax,BufNewFile,BufNew,BufRead *?
    \ call vimrc#on_filetype()
autocmd MyAutoCmd CursorHold *.toml syntax sync minlines=300

" Gnu Indent
autocmd MyAutoCmd FileType vim,yaml,toml call GnuIndent()

" 自动保存上次编辑位置
autocmd MyAutoCmd BufReadPost *
     \ if line("'\"") > 0
     \ | if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif |
     \ endif

" 自动保存
" autocmd MyAutoCmd FocusLost * silent! wa
autocmd MyAutoCmd FocusLost * echomsg "focus lost"

" 自动格式化
autocmd MyAutoCmd BufWritePre * call vimrc#auto_format()


"------------------------------------------------------------------------------
" Commands
" Wordcount
command! WordCount echo strchars(join(getline(1, '$')))

" AddNumbers
command! -range -nargs=1 AddNumbers
      \ call vimrc#add_numbers((<line2>-<line1>+1) * eval(<args>))
