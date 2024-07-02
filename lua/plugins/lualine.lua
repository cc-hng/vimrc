local function search_result()
  if vim.v.hlsearch == 0 then
    return ""
  end
  local last_search = vim.fn.getreg("/")
  if not last_search or last_search == "" then
    return ""
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
end

--[[
local colors = {
  red = '#ca1243',
  grey = '#a0a1a7',
  black = '#383a42',
  white = '#f3f3f3',
  light_green = '#83a598',
  orange = '#fe8019',
  green = '#8ec07c',
}

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

return {
  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    opts = {
      options = {
          theme = "auto",
          component_separators = '',
          section_separators = { left = '', right = '' },
        },
        sections = process_sections {
          lualine_a = { 'mode' },
          lualine_b = {
            'branch',
            { 'filename', file_status = false, path = 1 },
            { modified, color = { bg = colors.red } },
            {
              '%w',
              cond = function()
                return vim.wo.previewwindow
              end,
            },
            {
              '%r',
              cond = function()
                return vim.bo.readonly
              end,
            },
            {
              '%q',
              cond = function()
                return vim.bo.buftype == 'quickfix'
              end,
            },
          },
          lualine_c = {},
          lualine_x = {  { '%S', separator = {} }, },
          lualine_y = { search_result, 'filetype' },
          lualine_z = { '%l:%c', '%p%%/%L' },
        },
        inactive_sections = {
          lualine_c = { '%f %y %m' },
          lualine_x = {},
        },
    },
  },
}
]]

-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

return {
  {
    "nvim-lualine/lualine.nvim",
    enabled = false,
    opts = {
      options = {
        theme = "auto",
        component_separators = "|",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = { "filename" },
        lualine_c = { "%=%S" },
        lualine_x = {},
        lualine_y = { search_result, "progress", "filetype", "branch" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_c = { "%f %y %m" },
        lualine_x = {},
      },
      tabline = {},
      extensions = {},
    },
  },
}
