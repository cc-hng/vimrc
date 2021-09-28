local fn, cmd = vim.fn, vim.cmd
local defer = vim.defer_fn
local g = require 'global'
local u = require 'utils'

if g.gui_running or not g.is_neovim then
  u.error('gui or vim is not supported')
end

local function source(file)
  local abspath = string.format('%s/rc/%s', g.config_dir, file)
  local script = string.format([[execute 'source' fnameescape('%s')]], abspath)
  cmd(script)
end

local function install_plugins()
  -- fix: luarocks install hererocks
  -- https://github.com/wbthomason/packer.nvim/issues/180#issuecomment-871634199
  if g.is_mac then
    vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")
  end

  -- install packer
  local install_path = g.data_dir..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    cmd ("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    cmd 'packadd packer.nvim'
  end

  local packer = require('packer')
  packer.init {
    profile = {
      enable = true,
      threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },
    display = {
      open_fn = function()
        return require("packer.util").float { border = "single" }
      end,
    },
  }

  packer.startup{function(use)
    local plugs = require 'plugins'
    for _, v in ipairs(plugs) do
      if v.hook_add then
        v.hook_add()
      end
      use (v)
    end
  end}

  vim.cmd [[
    nnoremap [Space]ps :<C-u>PackerSync<CR>
    nnoremap [Space]pc :<C-u>PackerCompile<CR>
    nnoremap [Space]pi :<C-u>PackerInstall<CR>
    nnoremap [Space]pu :<C-u>PackerUpdate<CR>
  ]]
end

source 'init.vim'
source 'options.vim'
source 'mappings.vim'
source 'unix.vim'
source 'events.vim'

-- if g.get_git_pwd() then
--     vim.o.signcolumn = 'yes'
-- end

install_plugins()

-- run next frame
defer(function()
  -- vim.o.laststatus = 2
  -- vim.o.signcolumn = 'yes:1'
  --
  vim.cmd [[
    set nu
    color codedark
    set mouse=ni
  ]]
end, 0)
