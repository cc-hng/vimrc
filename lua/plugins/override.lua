-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add gruvbox
  { "mhinz/vim-janah" },
  { "challenger-deep-theme/vim" },
  { "mhartington/oceanic-next" },
  { "EdenEast/nightfox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "rakr/vim-one" },
  { "projekt0n/github-nvim-theme" },
  { "Rigellute/rigel" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "solarized8_high",
      -- colorscheme = "codedark",
      colorscheme = "tokyonight",
      -- colorscheme = "tokyonight-night",
      -- colorscheme = "OceanicNext",
      -- colorscheme = "catppuccin-mocha",
      -- colorscheme = "neon",
      -- colorscheme = "space-vim-dark",
      -- colorscheme = "github_dark_colorblind",
      -- colorscheme = "kanagawa-wave",
      -- colorscheme = "duskfox",
      -- colorscheme = "onehalfdark",
      -- colorscheme = "challenger_deep",
      -- colorscheme = "janah",
      -- colorscheme = "carbonfox",
      -- colorscheme = "nightfox",
      -- colorscheme = "candy",
    },
  },

  -- 消除警告（背景透明的时候）
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
      stages = "fade_in_slide_out",
    },
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

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        -- layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 6,
        preview = { treesitter = false },
      },
    },
  },

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
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
        -- jsonls = { mason = false },
      },
    },
  },

  -- neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.close_if_last_window = true
      opts.enable_git_status = false
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

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "shellcheck",
      },
    },
  },

  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = LazyVim.cmp.confirm({ select = true }),
        ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
        ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
        ["<tab>"] = function(fallback)
          if cmp.visible() then
            return cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })()
          else
            return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
          end
        end,
        ["<S-tab>"] = function(fallback)
          if cmp.visible() then
            return cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })()
          else
            return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
          end
        end,
      })
    end,
  },
}
