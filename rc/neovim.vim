"---------------------------------------------------------------------------
" For neovim:
"

if has('vim_starting') && empty(argv())
  syntax off
endif

if vimrc#is_mac()
  let g:python_host_prog  = '/usr/local/bin/python2'
  let g:python3_host_prog = '/usr/bin/python3'
else
  let g:python_host_prog  = '/usr/bin/python2'
  let g:python3_host_prog = '/usr/bin/python3'
endif

if exists('&inccommand')
  set inccommand=nosplit
endif

if exists('+termguicolors')
  " Enable true color
  set termguicolors

  if exists('&pumblend')
	set pumblend=15
	" For gonvim
	" autocmd MyAutoCmd InsertEnter * set pumblend=20
  endif

  if exists('&winblend')
	set winblend=10
  endif
endif

" Use cursor shape feature
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" Share the histories
" autocmd MyAutoCmd FocusGained *
"      \ if exists(':rshada') | rshada | wshada | endif

" Modifiable terminal
autocmd MyAutoCmd TermOpen * setlocal modifiable
autocmd MyAutoCmd TermClose * buffer #

let g:terminal_scrollback_buffer_size = 3000


