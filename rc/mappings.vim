"---------------------------------------------------------------------------
" Key-mappings:
"
" Visual mode keymappings:
" Indent
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv

" Command-line mode keymappings:
" <C-a>, A: move to head.
cnoremap <C-a>          <Home>
" <C-b>: previous char.
cnoremap <C-b>          <Left>
" <C-d>: delete char.
cnoremap <C-d>          <Del>
" <C-e>, E: move to end.
cnoremap <C-e>          <End>
" <C-f>: next char.
cnoremap <C-f>          <Right>
" <C-n>: next history.
cnoremap <C-n>          <Down>
" <C-p>: previous history.
cnoremap <C-p>          <Up>
" <C-y>: paste.
cnoremap <C-y>          <C-r>+
" <C-g>: Exit.
cnoremap <C-g>          <C-c>
" <C-k>: Delete to the end.
cnoremap <C-k> <Cmd>call setcmdline(
      \ getcmdpos() ==# 1 ? '' : getcmdline()[:getcmdpos() - 2])<CR>

" s: Windows and buffers(High priority)
" The prefix key.
nnoremap s    <Nop>
" nnoremap sp  <Cmd>vsplit<CR><Cmd>wincmd w<CR>
nnoremap so  <Cmd>only<CR>
nnoremap <Tab>      <cmd>wincmd w<CR>
nnoremap <expr> q
      \ &l:filetype ==# 'qf' ? '<Cmd>cclose<CR><Cmd>lclose<CR>' :
      \ ('#'->winnr()->winbufnr()->getbufvar('&filetype') !=# 'qf'
      \  && '$'->winnr() > 1) ? '<Cmd>close<CR>' : ''

" Better x
nnoremap x "_x

" Disable Ex-mode.
nnoremap Q  q

" Useless command.
nnoremap M  m

" Smart <C-f>, <C-b>.
noremap <expr> <C-f> max([winheight(0) - 2, 1])
      \ .. '<C-d>' .. (line('w$') >= line('$') ? 'L' : 'M')
noremap <expr> <C-b> max([winheight(0) - 2, 1])
      \ .. '<C-u>' .. (line('w0') <= 1 ? 'H' : 'M')

" Disable ZZ.
nnoremap ZZ  <Nop>

" Select rectangle.
xnoremap r <C-v>

" Redraw.
nnoremap <C-l>    <Cmd>redraw!<CR>

" If press l on fold, fold open.
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'l'
" If press l on fold, range fold open.
xnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'

" Improved increment.
nnoremap <C-a> <Cmd>AddNumbers 1<CR>
nnoremap <C-x> <Cmd>AddNumbers -1<CR>
command! -range -nargs=1 AddNumbers
      \ call vimrc#add_numbers((<line2>-<line1>+1) * eval(<args>))

" NOTE: Does not overwrite <ESC> behavior
" if has('nvim')
"   tnoremap jj          <C-\><C-n>
" else
"   tnoremap <ESC><ESC>  <C-l>N
"   tnoremap jj          <C-l>N
" endif
" tnoremap j<Space>   j
" tnoremap <expr> ;  vimrc#sticky_func()
" tnoremap <C-y>      <C-r>+

" Wordcount
command! WordCount echo getline(1, '$')->join()->strchars()

" {visual}p to put without yank to unnamed register
xnoremap p   P

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
command! WCp932 setlocal fenc=cp936

" Appoint a line feed.
command! -bang -complete=file -nargs=? WUnix
      \ write<bang> ++fileformat=unix <args> | edit <args>
command! -bang -complete=file -nargs=? WDos
      \ write<bang> ++fileformat=dos <args> | edit <args>

" Insert special character
inoremap <C-v>u  <C-r>=nr2char(0x)<Left>

" Tag jump
nnoremap tt  g<C-]>
nnoremap tp  <Cmd>pop<CR>
