" default autocmd group
augroup MyAutoCmd
  autocmd!
augroup END
" for neovim-remote

" Build encodings.
set encoding=utf-8
let &fileencodings = 'utf-8,,cp936'

" Setting of terminal encoding.
if !has('gui_running') && (has('win32') || has('win64'))
  " For system.
  set termencoding=cp936
endif

" Use English interface.
language message C

" Disable menu.vim
if has('gui_running')
  set guioptions=Mc
endif

" set guicursor=n-v-c:block,i:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250
"
"
"  " Use cursor shape feature
" set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,
"         \i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
