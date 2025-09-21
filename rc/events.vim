"------------------------------------------------------------------------------
" Autocmd
autocmd MyAutoCmd FileType,Syntax,BufNewFile,BufNew,BufRead *?
    \ call vimrc#on_filetype()

"自动保存
" autocmd MyAutoCmd FocusLost * silent! wa
autocmd MyAutoCmd FocusLost * silent! wa

autocmd MyAutoCmd BufReadPost *.nue set ft=html
" autocmd MyAutoCmd BufEnter * set syntax=on
" autocmd MyAutoCmd BufEnter * lua vim.defer_fn(function() vim.cmd [[ set syntax=on ]] end, 500)
" autocmd MyAutoCmd BufEnter * lua vim.defer_fn(function() vim.cmd [[ set syntax=on ]] end, 1500)
" autocmd MyAutoCmd BufEnter * lua vim.defer_fn(function() vim.cmd [[ set syntax=on ]] end, 3000)
" autocmd MyAutoCmd BufEnter * lua vim.defer_fn(function() vim.cmd [[ set syntax=on ]] end, 10000)
" autocmd MyAutoCmd BufEnter * lua vim.defer_fn(function() vim.cmd("color " .. (vim.api.nvim_exec("color", true))) end, 5000)

" binary
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END
