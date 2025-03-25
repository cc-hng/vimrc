local function source(file)
  local abspath = string.format("%s/rc/%s", vim.fn.stdpath("config"), file)
  local script = string.format([[execute 'source' fnameescape('%s')]], abspath)
  vim.cmd(script)
end

source("init.vim")
source("options.vim")
source("mappings.vim")
source("events.vim")

-- Required neovim 0.9
-- Speed up loading Lua modules in Neovim to improve startup time.
if vim.fn.has("nvim-0.9") == 1 then
  vim.loader.enable()
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
