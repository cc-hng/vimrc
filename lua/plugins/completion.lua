local cmd = vim.cmd
local config = require 'config'

return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    opt = true,
    event = "BufReadPre",
    wants = { "nvim-lsp-ts-utils", "null-ls.nvim", "lua-dev.nvim" },
    config = config.lsp,
    requires = {
      -- "folke/workspace.nvim",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      "jose-elias-alvarez/null-ls.nvim",
      "folke/lua-dev.nvim",
    },

  },

  -- 补全框架
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
        require 'config.nvim_cmp'
    end,
    wants = { "LuaSnip" },
    requires = {
      {
        "L3MON4D3/LuaSnip",
        event = "BufReadPre",
        wants = "friendly-snippets",
        config = config.snippets,
      },
      "rafamadriz/friendly-snippets",
    },
  },

  { "hrsh7th/cmp-path", after = "nvim-cmp" },
  { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
  { "hrsh7th/cmp-calc", after = "nvim-cmp" },
  -- { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
  { "hrsh7th/cmp-emoji", after = "nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
  { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
  {
    "kdheepak/cmp-latex-symbols",
    after = "nvim-cmp",
    ft = "latex",
    requires = {
      { "kdheepak/cmp-latex-symbols" },
    },
  },

  {
    'Shougo/echodoc.vim',
    event = 'CompleteDone',
    config = function()
        vim.g['echodoc#type'] = 'virtual'
        vim.cmd [[call echodoc#enable()]]
    end,
  },
  {
    'mattn/vim-goimports',
    ft = 'go',
    config = function()
      vim.g.goimports_simplify = 1
    end,
  },
}
