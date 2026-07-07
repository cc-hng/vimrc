-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  { "EdenEast/nightfox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "RRethy/base16-nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "minicyan",
      -- colorscheme = "night-owl",
      -- colorscheme = "carbonfox",
      -- colorscheme = "gruvbox",
      colorscheme = "tokyonight-night",
      -- colorscheme = "catppuccin",
      -- colorscheme = "nightfox",
      -- colorscheme = "kanagawa",
      -- colorscheme = "vague",
    },
  },

  -- close ai nes
  {
    "folke/sidekick.nvim",
    opts = {
      nes = { enabled = false },
      cli = {
        mux = {
          enabled = true,
          backend = "tmux",
        },
        win = {
          layout = "right", ---@type "float"|"left"|"bottom"|"top"|"right"
          split = { width = 0.382, height = 0.618 },
        },
      },
    },
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
}
