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

  -- bigfile
  {
    "LunarVim/bigfile.nvim",
    config = function()
      -- default config
      require("bigfile").setup {
        filesize = 1, -- size of the file in MiB, the plugin round file sizes to the closest MiB
        pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
        features = { -- features to disable
          "indent_blankline",
          "illuminate",
          "lsp",
          "treesitter",
          "syntax",
          "matchparen",
          "vimopts",
          "filetype",
        },
      }
    end,
  },
}
