"---------------------------------------------------------------------------
" Encoding:
"

" Setting of the encoding to use for a save and reading.
" Make it normal in UTF-8 in Unix.
if vimrc#is_windows() && !has('gui_running')
  set encoding=cp936
  set termencoding=cp936
else
  set encoding=utf-8
endif

" Build encodings
let &fileencodings = join(['utf-8', 'cp936'])

" IME
if has('multi_byte_ime')
  set iminsert=0 imsearch=0
endif

" Default fileformat.
set fileformat=unix
" Automatic recognition of a new line cord.
set fileformats=unix,dos,mac

" Command group opening with a specific character code again.
" In particular effective when I am garbled in a terminal.
" Open in UTF-8 again.
command! -bang -bar -complete=file -nargs=? Utf8
      \ edit<bang> ++enc=utf-8 <args>
" Open in Shift_JIS again.
command! -bang -bar -complete=file -nargs=? Cp936
      \ edit<bang> ++enc=cp936 <args>
" Open in UTF-16 again.
command! -bang -bar -complete=file -nargs=? Utf16
      \ edit<bang> ++enc=ucs-2le <args>

" Tried to make a file note version.
command! WUtf8 setlocal fenc=utf-8
command! WCp936 setlocal fenc=cp936

" Appoint a line feed.
command! -bang -complete=file -nargs=? WUnix
      \ write<bang> ++fileformat=unix <args> | edit <args>
command! -bang -complete=file -nargs=? WDos
      \ write<bang> ++fileformat=dos <args> | edit <args>

