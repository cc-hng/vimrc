
let s:path = expand('$CACHE/dein')

let g:dein#auto_recache 		 = 1
let g:dein#install_progress_type = 'title'
let g:dein#enable_notification   = 1
let g:dein#notification_icon 	 = vimrc#expand('signs/warn.png')
let g:dein#install_log_filename  = '/var/log/dein.log'

if !dein#load_state(s:path)
  finish
endif

let s:dein_toml 	 = vimrc#expand('config/dein.toml')
let s:dein_lazy_toml = vimrc#expand('config/deinlazy.toml')
let s:dein_ft_toml 	 = vimrc#expand('config/deinft.toml')

" begin {{{
call dein#begin(s:path, [ 
	  \ expand('<sfile>'), s:dein_toml, s:dein_lazy_toml, s:dein_ft_toml
	  \ ])

call dein#load_toml(s:dein_toml, {'lazy': 0})
call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})
call dein#load_toml(s:dein_ft_toml)

let s:vimrc_local = findfile('vimrc_local.vim', '.;')
if s:vimrc_local !=# ''
  " Load develop version plugins.
  call dein#local(fnamemodify(s:vimrc_local, ':h'),
        \ {'frozen': 1, 'merged': 0},
        \ ['vim*', 'nvim-*', 'unite-*', 'neco-*', '*.vim', 'denite.nvim'])
  call dein#local(fnamemodify(s:vimrc_local, ':h'),
        \ {'frozen': 1, 'merged': 0},
        \ ['deoplete-*', '*.nvim'])
endif

if dein#tap('deoplete.nvim') && has('nvim')
  call dein#disable('neocomplete.vim')
endif
call dein#disable('neobundle.vim')
call dein#disable('neopairs.vim')

call dein#end()
call dein#save_state()
" end }}}

if !has('vim_starting') && dein#check_install()
  " Installation check.
  call dein#install()
endif

" auto
call vimrc#on_filetype()
