local bottom_height = 0.6

return {

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
          title = "FileSystem",
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
}
