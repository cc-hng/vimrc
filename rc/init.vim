"---------------------------------------------------------------------------
" Initialize:
"
if &compatible
  set nocompatible
endif

" default autocmd group
augroup MyAutoCmd
  autocmd!
augroup END
" for neovim-remote

" Minimal options
if exists('+termguicolors') && !has('gui_running')
  set termguicolors
endif
set showtabline=0 laststatus=3
set noruler showcmd noshowmode

" Height of the command line.
try
  set cmdheight=0

  " For recording messages
  autocmd MyAutoCmd RecordingEnter * set cmdheight=1
  autocmd MyAutoCmd RecordingLeave * set cmdheight=0
catch
  set cmdheight=1
endtry

" Build encodings.
set encoding=utf-8
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

if has('nvim')
  " Use cursor shape feature
  set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,
        \i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

  " Use new loader
  lua if vim.loader then vim.loader.enable() end
endif


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
let g:loaded_python3_provider  = 1
