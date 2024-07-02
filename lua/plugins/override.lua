-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add gruvbox
  { "kurkale6ka/vim-desertEX", optional = true },
  { "mhinz/vim-janah", optional = true },
  { "rmehri01/onenord.nvim", optional = false },
  { "rockerBOO/boo-colorscheme-nvim", optional = true },
  { "challenger-deep-theme/vim", optional = true },
  { "tomasiser/vim-code-dark", optional = true },
  { "rafi/awesome-vim-colorschemes", optional = false },
  { "romgrk/doom-one.vim", optional = true },
  { "srcery-colors/srcery-vim", optional = true },
  { "AlexvZyl/nordic.nvim", optional = true },
  { "rafamadriz/neon", optional = true },
  { "mhartington/oceanic-next" },
  { "EdenEast/nightfox.nvim" },
  { "rebelot/kanagawa.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "solarized8_high",
      -- colorscheme = "codedark",
      colorscheme = "tokyonight-night",
      -- colorscheme = "OceanicNext",
      -- colorscheme = "catppuccin",
      -- colorscheme = "neon",
      -- colorscheme = "space-vim-dark",
      -- colorscheme = "habamax",
      -- colorscheme = "atom",
      -- colorscheme = "kanagawa-wave",
      -- colorscheme = "nightfox",
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

  -- Project
  { import = "lazyvim.plugins.extras.util.project" },

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
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
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
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      local function format_abbr(abbr, sz)
        sz = sz or 56
        local l = string.len(abbr)
        if l > sz then
          return string.sub(abbr, 1, sz) .. " ..."
        else
          return abbr
        end
      end

      opts.formatting = {
        format = function(_, item)
          local icons = require("lazyvim.config").icons.kinds
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end
          item.abbr = format_abbr(item.abbr, 48)
          return item
        end,
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
