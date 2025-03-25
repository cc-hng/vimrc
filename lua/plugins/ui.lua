local bottom_height = 0.4

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

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = random_theme(),
    },
  },

  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = false,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  {
    "folke/edgy.nvim",
    opts = {
      bottom = {
        {
          ft = "toggleterm",
          size = { height = bottom_height },
          filter = function(_, win)
            return vim.api.nvim_win_get_config(win).relative == ""
          end,
        },
        {
          ft = "noice",
          size = { height = bottom_height },
          filter = function(_, win)
            return vim.api.nvim_win_get_config(win).relative == ""
          end,
        },
        {
          ft = "lazyterm",
          title = "LazyTerm",
          size = { height = bottom_height },
          filter = function(buf)
            return not vim.b[buf].lazyterm_cmd
          end,
        },
        {
          ft = "snacks_terminal",
          size = { height = 0.48 },
          title = "%{b:snacks_terminal.id}: %{b:term_title}",
        },
        "Trouble",
        { ft = "qf", title = "QuickFix" },
        {
          ft = "help",
          size = { height = 20 },
          -- don't open help files in edgy that we're editing
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
        { ft = "spectre_panel", size = { height = bottom_height } },
        { title = "Neotest Output", ft = "neotest-output-panel", size = { height = 15 } },
      },

      left = {
        {
          title = "Neo-Tree",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          pinned = true,
          open = function()
            vim.api.nvim_input("<esc><space>e")
          end,
          size = { width = 0.2, height = 0.5 },
        },
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    optional = false,
    opts = function(_, opts)
      opts.open_files_do_not_replace_types = opts.open_files_do_not_replace_types
        or { "terminal", "Trouble", "qf", "Outline" }
      table.insert(opts.open_files_do_not_replace_types, "edgy")
    end,
  },
}
