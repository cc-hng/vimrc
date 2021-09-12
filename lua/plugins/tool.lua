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
    hook_add = function ()
      vim.cmd [[nnoremap [Space]v :<C-u>Vista<CR>]]
    end,
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
      local g = require 'global'
      local git_pwd = g.get_git_pwd()
      if git_pwd then
        local files_cmd = string.format(
          [[nnoremap <silent>[Window]p :<C-u>Telescope git_files cwd=%s<CR>]],
          git_pwd
        )
        local grep_cmd = string.format(
          [[nnoremap <silent><leader>g :<C-u>Telescope live_grep cwd=%s<CR>]],
          git_pwd
        )
        vim.cmd(files_cmd)
        vim.cmd(grep_cmd)
      else
        vim.cmd [[
          nnoremap <silent>[Window]p :<C-u>Telescope find_files<CR>
          nnoremap <silent><leader>g :<C-u>Telescope live_grep<CR>
        ]]
      end
      vim.cmd [[
        nnoremap <silent>[Window]s :<C-u>Telescope buffers<CR>
        nnoremap <silent>[Space]' :<C-u>Telescope resume<CR>
        nnoremap <silent>[Space]gs :<C-u>Telescope git_status<CR>
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


  {
      "skywind3000/vim-terminal-help",
      event = {"BufReadPre", "BufNewFile"},
      hook_add = function ()
          vim.cmd [[nnoremap <silent>[Space]` :H<CR>]]
      end,
      config = function ()
        vim.g.terminal_cwd = 2
        vim.g.terminal_shell = 'fish'
      end,
  },
  {
      "skywind3000/asynctasks.vim",
      setup = function()
          vim.cmd [[packadd vim-terminal-help]]
          vim.g.asynctasks_term_pos = "thelp"
          vim.g.asynctasks_term_rows = 10
      end,
      cmd = {"AsyncTask", "AsyncTaskMacro", "AsyncTaskList", "AsyncTaskEdit"},
      requires = {
          {
              "skywind3000/asyncrun.vim",
              cmd = {"AsyncRun", "AsyncStop"},
              setup = function()
                  vim.g.asyncrun_open = 6
              end,
          },
          "skywind3000/vim-terminal-help",
      },
  },

}
