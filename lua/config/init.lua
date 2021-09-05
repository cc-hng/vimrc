local BASE = (...) .. '.'
local M = {}
local fn = vim.fn
local base_dir = fn.stdpath('config') .. '/lua/config'

local tmp = vim.split(fn.globpath(base_dir, '*.lua'), '\n')
for _, f in ipairs(tmp) do
  local basename = fn.fnamemodify(f, ':t:r')

  if basename ~= 'init' then
    M[basename] = string.format([[ require '%s%s' ]], BASE, basename)
  end
end

return M
