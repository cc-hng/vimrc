"---------------------------------------------------------------------------
" Initialize:
"
set debug=throw
set nocompatible
set encoding=utf-8

" Build encodings.
let &fileencodings = 'utf-8,,cp936'

" Setting of terminal encoding.
if !has('gui_running') && (has('win32') || has('win64'))
  " For system.
  set termencoding=cp936
endif

if has('multi_byte_ime')
  set iminsert=0 imsearch=0
endif

let s:base_dir = fnamemodify(expand('<sfile>'), ':h') . '/'

" Use English interface.
language message C

" 
augroup MyAutoCmd
  autocmd!
augroup END

"---------------------------------------------------------------------------
" Disable default plugins

" Disable menu.vim
if has('gui_running')
  set guioptions=Mc
endif

let g:loaded_2html_plugin      = 1
let g:loaded_logiPat           = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_gzip              = 1
let g:loaded_gtags             = 1
let g:loaded_gtags_cscope      = 1
let g:loaded_man               = 1
let g:loaded_matchit           = 1
let g:loaded_matchparen        = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_rrhelper          = 1
let g:loaded_shada_plugin      = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_tarPlugin         = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_zipPlugin         = 1
