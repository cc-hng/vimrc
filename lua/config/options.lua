-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

local opt = vim.opt

opt.laststatus = 3

vim.defer_fn(function()
  opt.laststatus = 3
end, 0)

-- opt.bg = "light"

opt.splitkeep = "screen"
if not vim.fn.has("mac") then
  opt.clipboard = ""
end

opt.signcolumn = vim.fn.has("nvim-0.5") == 1 and "number" or "no"
