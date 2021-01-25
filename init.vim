
" 取消vi兼容模式
set nocompatible

" 禁用packpath
set packpath=

" 禁用以下默认插件
let g:loaded_2html_plugin      = 1
let g:loaded_logiPat           = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_gzip              = 1
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

" vimrc 目录
let g:vimrc#my = fnamemodify(expand('<sfile>'), ':h')

" 添加rtp
execute 'set rtp +=' . g:vimrc#my

" 新建自动组
augroup MyAutoCmd
  autocmd!
augroup END

"---------------------------------------------------------------------------
" 第三方插件
let $CACHE = expand('~/.cache')
if !isdirectory(expand($CACHE))
  call mkdir(expand($CACHE), 'p')
endif

let s:dein_dir = $CACHE . '/dein/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
endif
execute 'set runtimepath^=' . substitute(
		\ fnamemodify(s:dein_dir, ':p') , '/$', '', '')

call vimrc#source('plugin/dein.vim')

"---------------------------------------------------------------------------
" other source
call vimrc#source('encoding.vim')
call vimrc#source('options.vim')
call vimrc#source('mappings.vim')
call vimrc#source('commands.vim')

if has('nvim')
  call vimrc#source('neovim.vim')
endif

if vimrc#is_windows()
  call vimrc#source('os/windows.vim')
else
  call vimrc#source('os/unix.vim')
endif


"---------------------------------------------------------------------------
" other
" color candy
" color janah
" color desert
" color challenger_deep
color wombat256mod

" END
set secure

