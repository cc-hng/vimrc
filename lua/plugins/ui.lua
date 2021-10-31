local config = require 'config'

return {
  -- 启动页
  {
    'glepnir/dashboard-nvim',
    opt = true,
    config = config.dashboard,
  },

  -- 目录
  {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    lock = true,
    tag = '1.2.8',
    cmd = 'NvimTreeToggle',
    hook_add = function ()
      vim.cmd [[
        nnoremap [Window]f :<C-u>NvimTreeToggle<CR>
        autocmd MyAutoCmd FileType NvimTree setlocal signcolumn=no
      ]]
    end,
    setup = function ()
      vim.g.nvim_tree_width = 27
      vim.g.nvim_tree_auto_close = 1
    end,
    config = config.nvim_tree,
  },

  -- 状态栏插件
  -- {
  --   'hoob3rt/lualine.nvim',
  --   key = {'[Space]l'},
  --   requires = {'kyazdani42/nvim-web-devicons', opt = true},
  --   config = config.lualine,
  --   -- config = function()
  --   --   require('lualine').setup {
  --   --     options = { theme = 'auto' },
  --   --   }
  --   -- end,
  -- },

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
          always_show_bufferline = false,
          offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left"}},
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

  -- 主题
  { 'kurkale6ka/vim-desertEX', opt = true },
  { 'mhinz/vim-janah', opt = true },
  { 'challenger-deep-theme/vim', opt = true },
  { 'rakr/vim-one', opt = true },
  { 'morhetz/gruvbox', opt = true },
  { 'sickill/vim-monokai', opt = true },
  { 'drewtempelmeyer/palenight.vim', opt = true },
  { 'ayu-theme/ayu-vim', opt = true },
  { 'rafi/awesome-vim-colorschemes', opt = true },
  { 'tomasiser/vim-code-dark', opt = true }

}
