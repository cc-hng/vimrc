local BASE = (...) .. '.'
local common = require(BASE .. 'common')
local ui = require(BASE .. 'ui')
local editor = require(BASE .. 'editor')
local tool = require(BASE .. 'tool')
local completion = require(BASE .. 'completion')

local list = { common, ui, editor, tool, completion }

local plugins = {}

for _, l in ipairs(list) do
  for _, v in ipairs(l) do
    plugins[#plugins+1] = v
  end
end

return plugins
