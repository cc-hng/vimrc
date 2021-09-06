local cmd, fn, g = vim.cmd, vim.fn, vim.g
local config = require 'config'

return {
  'thinca/vim-ft-diff_fold',
  'rcmdnk/vim-markdown',
  'kana/vim-operator-user',
  'cespare/vim-toml',
  'lambdalisue/vim-findent',

  -- load lua plugin cache
  {
    'lewis6991/impatient.nvim',
    rocks = 'mpack',
    config = function()
      require 'impatient'
    end,
  },

  { 'nvim-lua/plenary.nvim', opt = true, module = 'plenary' },
  { 'nvim-lua/popup.nvim', opt = true, module = 'popup' },
}
