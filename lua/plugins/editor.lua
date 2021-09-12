----------------------------------------------------------------------------
-- editor
--

return {
  {'kana/vim-niceblock', opt = true},

  -- 颜色荧光笔
  {
    'norcalli/nvim-colorizer.lua',
    ft = { 'html','css','sass','vim','typescript','typescriptreact'},
    config = function()
      require 'colorizer'.setup {
        css = { rgb_fn = true; };
        scss = { rgb_fn = true; };
        sass = { rgb_fn = true; };
        stylus = { rgb_fn = true; };
        vim = { names = true; };
        tmux = { names = false; };
        'javascript';
        'javascriptreact';
        'typescript';
        'typescriptreact';
        html = {
          mode = 'foreground';
        }
      }
    end,
  },

  -- 当前光标下划线 高亮
  {
    'itchyny/vim-cursorword',
    event = {'BufReadPre', "BufNewFile"},
    config = function()
        local cmd = vim.api.nvim_command
        cmd ('augroup user_plugin_cursorword')
        cmd ('autocmd!')
        cmd ('autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0')
        cmd ('autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif')
        cmd ('autocmd InsertEnter * let b:cursorword = 0')
        cmd ('autocmd InsertLeave * let b:cursorword = 1')
        cmd ('augroup END')
    end,
  },

  -- 操作视觉增强
  {
    'rhysd/accelerated-jk',
    keys = {{'n', 'j'}, {'n', 'k'}},
    config = function()
      vim.cmd [[
        nmap <silent>j <Plug>(accelerated_jk_gj)
        nmap <silent>k <Plug>(accelerated_jk_gk)
      ]]
    end,
  },

  -- f t 增强
  {
    'hrsh7th/vim-eft',
    keys = {
        {'n', 'f'},
        {'n', 'F'},
        {'x', 'f'},
        {'x', 'F'},
        {'o', 'f'},
        {'o', 'F'},
    },
    config = function()
      vim.g.eft_ignorecase = true
      vim.cmd [[
        nmap ;; <Plug>(eft-repeat)
        xmap ;; <Plug>(eft-repeat)
        nmap f <Plug>(eft-f)
        xmap f <Plug>(eft-f)
        omap f <Plug>(eft-f)
        nmap F <Plug>(eft-F)
        xmap F <Plug>(eft-F)
        omap F <Plug>(eft-F)
      ]]
    end,
  },

  -- 注释
  {
    "tyru/caw.vim",
    keys = {
        {"n", "gc"},
        {"n", "gcc"},
        {"x", "gc"},
        {"x", "gcc"},
    },
    config = function ()
      vim.cmd [[
        function! InitCaw() abort
          if !&l:modifiable
            silent! nunmap <buffer> gc
            silent! xunmap <buffer> gc
            silent! nunmap <buffer> gcc
            silent! xunmap <buffer> gcc
          else
            nmap <buffer> gc <Plug>(caw:prefix)
            xmap <buffer> gc <Plug>(caw:prefix)
            nmap <buffer> gcc <Plug>(caw:hatpos:toggle)
            xmap <buffer> gcc <Plug>(caw:hatpos:toggle)
            endif
        endfunction
        autocmd FileType * call InitCaw()
        call InitCaw()
      ]]
    end,
    requires = {
      "Shougo/context_filetype.vim",
      config = function()
        vim.g["context_filetype#search_offset"] = 2000
      end,
    },
  },

  {
    'kana/vim-smartchr',
    ft = {'c', 'cpp'},
    config = function ()
      local cmd = vim.api.nvim_command
      -- cmd [[augroup user_plugin_smartchr]]
      -- cmd [[autocmd!]]
      -- cmd [[autocmd FileType c,cpp inoremap <buffer> <expr> . smartchr#loop('.', '->', '...')]]
      -- cmd [[augroup END]]
      cmd [[inoremap <buffer> <expr> . smartchr#loop('.', '->', '...')]]
    end,
  },

  -- sudo edit
  {
    'lambdalisue/suda.vim',
    cmd = {'SudaRead', 'SudaWrite'},
    config = function()
      vim.g.suda_smart_edit = 1
    end,
  },
}
