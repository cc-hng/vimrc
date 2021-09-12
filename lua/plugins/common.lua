-- local cmd, fn, g = vim.cmd, vim.fn, vim.g

return {
  -- self
  { 'wbthomason/packer.nvim' },

  {'thinca/vim-ft-diff_fold', opt = true },
  {'rcmdnk/vim-markdown', ft = 'markdown'},
  {'kana/vim-operator-user', opt = true },
  -- {'cespare/vim-toml', ft='toml'},
  {'lambdalisue/vim-findent', opt = true },

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
