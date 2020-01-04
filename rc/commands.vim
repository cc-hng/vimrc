
autocmd MyAutoCmd FileType,Syntax,BufNewFile,BufNew,BufRead *?
    \ call vimrc#on_filetype()
autocmd MyAutoCmd CursorHold *.toml syntax sync minlines=300

" Gnu Indent
autocmd MyAutoCmd FileType vim,yaml,toml call GnuIndent()

" Wordcount
command! WordCount echo strchars(join(getline(1, '$')))

" AddNumbers
command! -range -nargs=1 AddNumbers
      \ call vimrc#add_numbers((<line2>-<line1>+1) * eval(<args>))
