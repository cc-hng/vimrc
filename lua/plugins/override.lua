-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

return {
  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- comments
  {
    "echasnovski/mini.comment",
    opts = {
      options = {
        custom_commentstring = function()
          local ft = vim.bo.filetype

          if ft == "c" or ft == "cpp" then
            return "// %s"
          else
            return vim.bo.commentstring
          end
        end,
      },
    },
  },

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      inlay_hints = { enabled = false },
      document_highlight = { enabled = true },
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        -- pyright = {},
      },
    },
  },

  -- neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.close_if_last_window = true
      opts.enable_git_status = true
      opts.window = {
        width = 33,
      }
    end,
    -- config = function()
    --   vim.api.nvim_input("<esc><space>e")
    -- end,
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "rust",
        "bash",
        "html",
        "javascript",
        "json",
        "toml",
        "dart",
        "proto",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      highlight = {
        enable = false,
        disable = function(lang, buf)
          if lang == "vimdoc" or lang == "diff" or lang == "gitcommit" or lang == "swift" then
            return true
          end
          local max_filesize = 50 * 1024 -- 50 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
      },
    },
  },

  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        providers = {
          snippets = { min_keyword_length = 2 },
          buffer = { min_keyword_length = 2 },
        },
      },
    },
  },

  -- {
  --   "folke/noice.nvim",
  --   opts = {
  --     cmdline = { view = "cmdline" },
  --     -- popupmenu = { backend = "cmdline" },
  --   },
  -- },

  {
    "folke/snacks.nvim",
    opts = {
      indent = { enabled = false },
      bigfile = {
        notify = true,
        size = 4 * 1024 * 1024,
        setup = function(ctx)
          -- local snacks = require "folke/snacks.nvim"
          if vim.fn.exists ":DoMatchParen" == 2 then
            vim.cmd [[NoMatchParen]]
          end
          Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
          vim.b.minianimate_disable = true
          vim.schedule(function()
            vim.bo[ctx.buf].syntax = ctx.ft
          end)
        end,
      },
    },
  },
}
