local config = require 'config'

return {
  {
    'folke/trouble.nvim',
    -- event = 'BufReadPre',
    opt = true,
    wants = 'nvim-web-devicons',
    cmd = { 'TroubleToggle', 'Trouble' },
    config = function()
      require('trouble').setup { auto_open = false }
    end,
  },
  {
    'editorconfig/editorconfig-vim',
    ft = { 'lua', 'go','typescript','javascript','vim','rust','zig','c','cpp' },
  },

  -- outline
  {
    'liuchengxu/vista.vim',
    cmd = 'Vista',
    config = function()
      vim.g['vista#renderer#enable_icon'] = 1
      vim.g.vista_disable_statusline = 1
      vim.g.vista_default_executive = 'ctags'
      vim.g.vista_echo_cursor_strategy = 'floating_win'
      vim.g.vista_vimwiki_executive = 'markdown'
      vim.g.vista_executive_for = {
        vimwiki =  'markdown',
        pandoc = 'markdown',
        markdown = 'toc',
        typescript = 'nvim_lsp',
        typescriptreact =  'nvim_lsp',
      }
    end,
  },

  -- hex 显示
  {
    'Shougo/vinarise.vim',
    cmd = 'Vinarise',
    config = function()
      vim.g.vinarise_enable_auto_detect = 1
    end,
  },

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    opt = true,
    config = config.telescope,
    cmd = { 'Telescope' },
    module = 'telescope',
    hook_add = function ()
      vim.cmd [[
        nnoremap <silent>[Window]s :<C-u>Telescope buffers<CR>
        nnoremap <silent>[Window]p :<C-u>Telescope find_files<CR>
        nnoremap <silent><leader>g :<C-u>Telescope live_grep<CR>
      ]]
    end,
    wants = {
      'plenary.nvim',
      'popup.nvim',
      'telescope-z.nvim',
      -- 'telescope-frecency.nvim',
      'telescope-fzy-native.nvim',
      'telescope-project.nvim',
      'trouble.nvim',
      'telescope-symbols.nvim',
    },
    requires = {
      'nvim-telescope/telescope-z.nvim',
      'nvim-telescope/telescope-project.nvim',
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-symbols.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      -- { 'nvim-telescope/telescope-frecency.nvim', requires = 'tami5/sql.nvim' }
    },
  },

}
