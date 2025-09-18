-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
local random_theme = function()
  local set = {
    "candy",
    "catppuccin",
    "candy",
    "janah",
    "tokyonight",
    "candy",
    "janah",
    "terafox",
    "janah",
  }
  return set[os.time() % #set + 1]
end

return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "mhinz/vim-janah" },
  { "challenger-deep-theme/vim" },
  { "mhartington/oceanic-next" },
  { "EdenEast/nightfox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  { "sainnhe/everforest" },
  { "gbprod/nord.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = random_theme(),
      colorscheme = "nord",
      -- colorscheme = "catppuccin",
      -- colorscheme = "candy",
    },
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- comments
  {
    "nvim-mini/mini.comment",
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
    opts = {
      close_if_last_window = true,
      window = { width = 0.21 },
      enable_git_status = true,
    },
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
        enable = true,
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

  -- add any tools you want to have installed below
  {
    "mason-org/mason.nvim",
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

  --- cmdline settings
  {
    "folke/noice.nvim",
    opts = {
      presets = { command_palette = false },
      cmdline = { view = "cmdline" },
    },
  },

  --- 大文件
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
      picker = { enabled = false },
      indent = { enabled = false },
      bigfile = { enabled = false },
    },
  },
}
