local fn, cmd = vim.fn, vim.cmd
local defer = vim.defer_fn
local g = require 'global'

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
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    cmd 'packadd packer.nvim'
  end

  require('packer').startup(function()
    -- self
    use { 'wbthomason/packer.nvim', opt = true }
    local plugs = require 'plugins'
    for _, v in ipairs(plugs) do
      if v.hook_add then
        v.hook_add()
      end
      use (v)
    end
  end)
end

source 'init.vim'
source 'options.vim'
source 'mappings.vim'
source 'unix.vim'

-- run next frame
defer(function()
  install_plugins()
  -- vim.o.laststatus = 2
  -- vim.o.signcolumn = 'yes:1'
  --
  if g.get_git_pwd() then
    vim.o.signcolumn = 'yes'
  end
end, 0)
