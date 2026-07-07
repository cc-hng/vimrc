-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Project root detection: LSP -> .git/lua markers -> cwd
vim.g.root_spec = { ".projectrc", ".root", { ".git", "lua" }, "cwd" }

-- Fix cursor visibility
-- vim.opt.guicursor = {
--   "n-v-c:block", -- normal, visual, command mode: block cursor
--   "i:ver20", -- insert mode: horizontal bar with 20% height
--   "r-cr:hor20", -- replace, command-line replace: horizontal bar
--   "o:hor50", -- operator-pending: horizontal bar with 50% height
--   "a:blinkwait700-blinkoff400-blinkon250", -- all modes: blink settings
--   "sm:block-blinkwait175-blinkoff150-blinkon175", -- showmatch: block with blink
-- }
