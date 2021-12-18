local actions = require('telescope.actions')
-- local trouble = require 'trouble.providers.telescope'

local telescope = require 'telescope'

telescope.setup {
  extensions = { fzy_native = { override_generic_sorter = false, override_file_sorter = true } },
  defaults = {
    -- mappings = { i = { ['<c-t>'] = trouble.open_with_trouble } },
    mappings = { i = {
        ['<esc>'] = actions.close,
        ['<Tab>'] = actions.move_selection_next,
        ['<S-Tab>'] = actions.move_selection_previous,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
    } },
    -- vimgrep_arguments = {
    --   'rg',
    --   '--color=never',
    --   '--no-heading',
    --   '--with-filename',
    --   '--line-number',
    --   '--column',
    --   '--smart-case'
    -- },
    -- prompt_position = 'bottom',
    prompt_prefix = ' ',
    selection_caret = ' ',
    -- entry_prefix = '  ',
    -- initial_mode = 'insert',
    -- selection_strategy = 'reset',
    -- sorting_strategy = 'descending',
    -- layout_strategy = 'horizontal',
    -- layout_defaults = {
    --   horizontal = {
    --     mirror = false,
    --   },
    --   vertical = {
    --     mirror = false,
    --   },
    -- },
    -- file_sorter = require'telescope.sorters'.get_fzy_file
    file_ignore_patterns = {"node_modules", ".git", ".cache", "build"},
    -- generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    -- shorten_path = true,
    winblend = 10,
    -- width = 0.7,
    -- preview_cutoff = 120,
    -- results_height = 1,
    -- results_width = 0.8,
    -- border = {},
    -- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    -- borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    -- prompt = { '─', '│', ' ', '│', '┌', '┐', '│', '│' },
    -- results = { '─', '│', '─', '│', '├', '┤', '┘', '└' },
    preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    preview_width = 0.6,
    -- color_devicons = true,
    -- use_less = true,
    -- set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- -- Developer configurations: Not meant for general override
    -- buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  },
}

-- telescope.load_extension('frecency')
telescope.load_extension 'fzy_native'
telescope.load_extension 'z'
-- telescope.load_extension('project')

local M = {}

M.project_files = function(opts)
  opts = opts or {}

  local _git_pwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1]

  if vim.v.shell_error ~= 0 then
    local client = vim.lsp.get_active_clients()[1]
    if client then
      opts.cwd = client.config.root_dir
    end
    require('telescope.builtin').find_files(opts)
    return
  end

  require('telescope.builtin').git_files(opts)
end

local util = require 'utils'

-- util.nnoremap('<leader>x', M.project_files)
-- util.nnoremap('<Leader>fd', function()
--   require('telescope.builtin').git_files({ cwd = '~/dot' })
-- end)

-- util.nnoremap('<leader>fz', function()
--   require('telescope').extensions.z.list({ cmd = { vim.o.shell, '-c', 'zoxide query -ls' } })
-- end)

-- util.nnoremap('<leader>p', ":lua require'telescope'.extensions.project.project{}<CR>")
-- fuzzyfind 模糊搜索 快捷键
-- vim.api.nvim_set_keymap("n", "<leader>g", ":<C-u>Telescope live_grep<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>ff", ":<C-u>Telescope find_files<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>fh", ":<C-u>DashboardFindHistory<CR>", {silent = true, noremap = true})

