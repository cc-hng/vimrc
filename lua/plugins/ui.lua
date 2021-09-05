local config = require 'config'

return {
  -- 启动页
  {
    'glepnir/dashboard-nvim',
    config = config.dashboard,
  },

  -- 状态栏插件
  {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    after = 'impatient.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require 'eviline' end,
  },

  -- git 状态显示
  {
    'lewis6991/gitsigns.nvim',
    event = {'BufRead','BufNewFile'},
    requires = { 'nvim-lua/plenary.nvim' },
    config = config.gitsigns,
  },

  -- 标签页 状态栏
  -- tab 栏插件 提供 leader + number 切换buffer
  {
    "akinsho/nvim-bufferline.lua",
    requires = {"kyazdani42/nvim-web-devicons"},
    after = 'impatient.nvim',
    config = function()
      vim.cmd [[
        nnoremap <silent>gt <cmd>BufferLineCycleNext<CR>
        nnoremap <silent>gT <cmd>BufferLineCyclePrev<CR>
        nnoremap <silent>gb <cmd>BufferLinePick<CR>
      ]]
      require "bufferline".setup {
        options = {
          modified_icon = '✥',
          buffer_close_icon = '',
          always_show_bufferline = false
        }
      }
    end,
  },

  -- 高亮 主题
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = 'BufRead',
    after = 'impatient.nvim',
    config = config.treesitter,
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  },

}
