return {
  -- 透明插件
  {
    "xiyaowong/transparent.nvim",
    opts = {
      extra_groups = {
        "NeoTreeNormal",
        "NeoTreeNormalNC",
      },
    },
  },

  --
  {
    "kana/vim-smartchr",
    event = "InsertCharPre",
    ft = { "c", "cpp" },
    config = function()
      vim.cmd([[
        " Substitute .. into -> .
        autocmd MyAutoCmd FileType c,cpp inoremap <buffer> <expr> .
                \ smartchr#loop('.', '->', '...')
      ]])
    end,
  },

  -- Super User
  {
    "lambdalisue/suda.vim",
    cmd = { "SudaRead", "SudaWrite" },
    init = function()
      vim.cmd("let g:suda_smart_edit = v:true")
    end,
  },

  -- flatten
  {
    "willothy/flatten.nvim",
    config = true,
    lazy = false,
    priority = 1001,
  },
}
