return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        --   lualine_a = { "mode" },
        lualine_b = {},
        --   lualine_y = {
        --     { "filetype", separator = "|", padding = { left = 1, right = 1 } },
        --     { "encoding", separator = "|", padding = { left = 1, right = 1 } },
        --     { "location", padding = { left = 0, right = 1 } },
        --   },
        lualine_z = {
          function()
            return os.getenv("NAME")
          end,
        },
      },
    },
  },

  {
    "folke/tokyonight.nvim",
    opts = {
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
  },

  {
    "catppuccin/nvim",
    opts = { no_italic = true },
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
  --- layout: dropdown, default, sidebar, vscode, ivy, ivy_split, bottom, top, left, right, select, telescope, vertical
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
      picker = {
        sources = {
          explorer = {
            auto_close = true, -- 添加这一行以在打开文件
            title = "explorer",
            layout = {
              preset = "select",
              layout = {
                height = 0, -- 0 表示充满可用空间
                row = 0, -- 从顶部开始
              },
              auto_hide = { "input" }, -- 这一行控制 input 搜索框默认隐藏
            },
          },
        },
      },
      indent = { enabled = false },
      bigfile = { enabled = false },
    },
  },
}
