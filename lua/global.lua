local fn   = vim.fn
local is_windows = fn.has 'win32' or fn.has 'win64'
local is_unix = fn.has 'unix'
local is_mac = fn.has 'mac'
local is_neovim = fn.has 'nvim'
local home_dir = os.getenv("HOME")
local config_dir = fn.stdpath 'config'
local data_dir = fn.stdpath 'data'
local local_dir = home_dir .. '/.local/bin'

local gui_running = fn.has 'gui_running'

local function get_git_pwd()
  local git_pwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  if string.match(git_pwd, 'fatal: not a git repository') then
    git_pwd = nil
  end
  return git_pwd
end

_G.dump = function(...)
  print(vim.inspect(...))
end

return {
  is_mac = is_mac,
  is_unix = is_unix,
  is_windows = is_windows,
  is_neovim = is_neovim,
  gui_running = gui_running,
  home_dir = home_dir,
  config_dir = config_dir,
  data_dir = data_dir,
  local_dir = local_dir,

  -- function
  get_git_pwd = get_git_pwd,
}
