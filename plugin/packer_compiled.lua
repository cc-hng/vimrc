-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/hxl/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/hxl/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/hxl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/hxl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/hxl/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { " require 'config.snippets' " },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    wants = { "friendly-snippets" }
  },
  ["accelerated-jk"] = {
    config = { "\27LJ\2\nå\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0m        nmap <silent>j <Plug>(accelerated_jk_gj)\n        nmap <silent>k <Plug>(accelerated_jk_gk)\n      \bcmd\bvim\0" },
    keys = { { "n", "j" }, { "n", "k" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/accelerated-jk"
  },
  ["caw.vim"] = {
    config = { "\27LJ\2\nÕ\4\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0≠\4        function! InitCaw() abort\n          if !&l:modifiable\n            silent! nunmap <buffer> gc\n            silent! xunmap <buffer> gc\n            silent! nunmap <buffer> gcc\n            silent! xunmap <buffer> gcc\n          else\n            nmap <buffer> gc <Plug>(caw:prefix)\n            xmap <buffer> gc <Plug>(caw:prefix)\n            nmap <buffer> gcc <Plug>(caw:hatpos:toggle)\n            xmap <buffer> gcc <Plug>(caw:hatpos:toggle)\n            endif\n        endfunction\n        autocmd FileType * call InitCaw()\n        call InitCaw()\n      \bcmd\bvim\0" },
    keys = { { "n", "gc" }, { "n", "gcc" }, { "x", "gc" }, { "x", "gcc" } },
    loaded = false,
    needs_bufread = true,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/caw.vim"
  },
  ["cmp-buffer"] = {
    after_files = { "/Users/hxl/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-calc"] = {
    after_files = { "/Users/hxl/.local/share/nvim/site/pack/packer/opt/cmp-calc/after/plugin/cmp_calc.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/cmp-calc"
  },
  ["cmp-emoji"] = {
    after_files = { "/Users/hxl/.local/share/nvim/site/pack/packer/opt/cmp-emoji/after/plugin/cmp_emoji.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/cmp-emoji"
  },
  ["cmp-latex-symbols"] = {
    after_files = { "/Users/hxl/.local/share/nvim/site/pack/packer/opt/cmp-latex-symbols/after/plugin/cmp_latex.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/Users/hxl/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "/Users/hxl/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/Users/hxl/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/cmp_luasnip"
  },
  ["context_filetype.vim"] = {
    loaded = true,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/start/context_filetype.vim"
  },
  ["dashboard-nvim"] = {
    config = { " require 'config.dashboard' " },
    loaded = true,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["echodoc.vim"] = {
    config = { "\27LJ\2\n`\0\0\3\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\26call echodoc#enable()\bcmd\fvirtual\17echodoc#type\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/echodoc.vim"
  },
  ["editorconfig-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/editorconfig-vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n'\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\feviline\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { " require 'config.gitsigns' " },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    after = { "nvim-treesitter", "galaxyline.nvim", "nvim-bufferline.lua" },
    loaded = true,
    only_config = true
  },
  ["lua-dev.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/lua-dev.nvim"
  },
  ["null-ls.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/null-ls.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n’\2\0\0\4\0\t\0\r6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\a\0005\3\6\0=\3\b\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\3\18modified_icon\b‚ú•\27always_show_bufferline\1\22buffer_close_icon\5\nsetup\15bufferline\frequire±\1        nnoremap <silent>gt <cmd>BufferLineCycleNext<CR>\n        nnoremap <silent>gT <cmd>BufferLineCyclePrev<CR>\n        nnoremap <silent>gb <cmd>BufferLinePick<CR>\n      \bcmd\bvim\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    after = { "cmp-buffer", "cmp-calc", "cmp-emoji", "cmp-latex-symbols", "cmp-nvim-lsp", "cmp-path", "cmp_luasnip" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.nvim_cmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    wants = { "LuaSnip" }
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n£\2\0\0\4\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\2B\0\2\1K\0\1\0\thtml\1\0\1\tmode\15foreground\ttmux\1\0\1\nnames\1\bvim\1\0\1\nnames\2\vstylus\1\0\1\vrgb_fn\2\tsass\1\0\1\vrgb_fn\2\tscss\1\0\1\vrgb_fn\2\bcss\1\5\0\0\15javascript\20javascriptreact\15typescript\20typescriptreact\1\0\1\vrgb_fn\2\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-lsp-ts-utils"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    after = { "null-ls.nvim", "lua-dev.nvim", "nvim-lsp-ts-utils" },
    config = { " require 'config.lsp' " },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    wants = { "nvim-lsp-ts-utils", "null-ls.nvim", "lua-dev.nvim" }
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects" },
    config = { " require 'config.treesitter' " },
    load_after = {},
    loaded = false,
    needs_bufread = true,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/popup.nvim"
  },
  ["suda.vim"] = {
    config = { "\27LJ\2\n1\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\20suda_smart_edit\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/suda.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/telescope-fzy-native.nvim"
  },
  ["telescope-project.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/telescope-project.nvim"
  },
  ["telescope-symbols.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/telescope-symbols.nvim"
  },
  ["telescope-z.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/telescope-z.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-fzy-native.nvim", "telescope-project.nvim", "telescope-z.nvim", "telescope-symbols.nvim" },
    commands = { "Telescope" },
    config = { " require 'config.telescope' " },
    loaded = false,
    needs_bufread = true,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    wants = { "plenary.nvim", "popup.nvim", "telescope-z.nvim", "telescope-fzy-native.nvim", "telescope-project.nvim", "trouble.nvim", "telescope-symbols.nvim" }
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle", "Trouble" },
    config = { "\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14auto_open\1\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    wants = { "nvim-web-devicons" }
  },
  ["vim-cursorword"] = {
    config = { "\27LJ\2\nö\3\0\0\4\0\n\0\0256\0\0\0009\0\1\0009\0\2\0\18\1\0\0'\3\3\0B\1\2\1\18\1\0\0'\3\4\0B\1\2\1\18\1\0\0'\3\5\0B\1\2\1\18\1\0\0'\3\6\0B\1\2\1\18\1\0\0'\3\a\0B\1\2\1\18\1\0\0'\3\b\0B\1\2\1\18\1\0\0'\3\t\0B\1\2\1K\0\1\0\16augroup END/autocmd InsertLeave * let b:cursorword = 1/autocmd InsertEnter * let b:cursorword = 0Gautocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endifQautocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0\rautocmd!#augroup user_plugin_cursorword\17nvim_command\bapi\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/vim-cursorword"
  },
  ["vim-eft"] = {
    config = { "\27LJ\2\n¿\2\0\0\3\0\5\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0ˇ\1        nmap ;; <Plug>(eft-repeat)\n        xmap ;; <Plug>(eft-repeat)\n        nmap f <Plug>(eft-f)\n        xmap f <Plug>(eft-f)\n        omap f <Plug>(eft-f)\n        nmap F <Plug>(eft-F)\n        xmap F <Plug>(eft-F)\n        omap F <Plug>(eft-F)\n      \bcmd\19eft_ignorecase\6g\bvim\0" },
    keys = { { "n", "f" }, { "n", "F" }, { "x", "f" }, { "x", "F" }, { "o", "f" }, { "o", "F" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/vim-eft"
  },
  ["vim-findent"] = {
    loaded = true,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/start/vim-findent"
  },
  ["vim-ft-diff_fold"] = {
    loaded = true,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/start/vim-ft-diff_fold"
  },
  ["vim-goimports"] = {
    config = { "\27LJ\2\n4\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\23goimports_simplify\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/vim-goimports"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-niceblock"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/vim-niceblock"
  },
  ["vim-operator-user"] = {
    loaded = true,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/start/vim-operator-user"
  },
  ["vim-smartchr"] = {
    config = { "\27LJ\2\ns\0\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0\18\1\0\0'\3\3\0B\1\2\1K\0\1\0?inoremap <buffer> <expr> . smartchr#loop('.', '->', '...')\17nvim_command\bapi\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/vim-smartchr"
  },
  ["vim-toml"] = {
    loaded = true,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/start/vim-toml"
  },
  ["vinarise.vim"] = {
    commands = { "Vinarise" },
    config = { "\27LJ\2\n=\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0 vinarise_enable_auto_detect\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/vinarise.vim"
  },
  ["vista.vim"] = {
    commands = { "Vista" },
    config = { "\27LJ\2\n˛\2\0\0\2\0\f\0\0256\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0005\1\v\0=\1\n\0K\0\1\0\1\0\5\vpandoc\rmarkdown\20typescriptreact\rnvim_lsp\fvimwiki\rmarkdown\15typescript\rnvim_lsp\rmarkdown\btoc\24vista_executive_for\rmarkdown\28vista_vimwiki_executive\17floating_win\31vista_echo_cursor_strategy\nctags\28vista_default_executive\29vista_disable_statusline\31vista#renderer#enable_icon\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/hxl/.local/share/nvim/site/pack/packer/opt/vista.vim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^plenary"] = "plenary.nvim",
  ["^popup"] = "popup.nvim",
  ["^telescope"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
 require 'config.dashboard' 
time([[Config for dashboard-nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-bufferline.lua ]]

-- Config for: nvim-bufferline.lua
try_loadstring("\27LJ\2\n’\2\0\0\4\0\t\0\r6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\a\0005\3\6\0=\3\b\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\3\18modified_icon\b‚ú•\27always_show_bufferline\1\22buffer_close_icon\5\nsetup\15bufferline\frequire±\1        nnoremap <silent>gt <cmd>BufferLineCycleNext<CR>\n        nnoremap <silent>gT <cmd>BufferLineCyclePrev<CR>\n        nnoremap <silent>gb <cmd>BufferLinePick<CR>\n      \bcmd\bvim\0", "config", "nvim-bufferline.lua")

vim.cmd [[ packadd galaxyline.nvim ]]

-- Config for: galaxyline.nvim
try_loadstring("\27LJ\2\n'\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\feviline\frequire\0", "config", "galaxyline.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Vista lua require("packer.load")({'vista.vim'}, { cmd = "Vista", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Vinarise lua require("packer.load")({'vinarise.vim'}, { cmd = "Vinarise", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[onoremap <silent> f <cmd>lua require("packer.load")({'vim-eft'}, { keys = "f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gc <cmd>lua require("packer.load")({'caw.vim'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> j <cmd>lua require("packer.load")({'accelerated-jk'}, { keys = "j", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gc <cmd>lua require("packer.load")({'caw.vim'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> f <cmd>lua require("packer.load")({'vim-eft'}, { keys = "f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> F <cmd>lua require("packer.load")({'vim-eft'}, { keys = "F", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> gcc <cmd>lua require("packer.load")({'caw.vim'}, { keys = "gcc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> F <cmd>lua require("packer.load")({'vim-eft'}, { keys = "F", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> f <cmd>lua require("packer.load")({'vim-eft'}, { keys = "f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> k <cmd>lua require("packer.load")({'accelerated-jk'}, { keys = "k", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> gcc <cmd>lua require("packer.load")({'caw.vim'}, { keys = "gcc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> F <cmd>lua require("packer.load")({'vim-eft'}, { keys = "F", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'editorconfig-vim'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-colorizer.lua', 'editorconfig-vim'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'editorconfig-vim'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'vim-smartchr', 'editorconfig-vim'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType zig ++once lua require("packer.load")({'editorconfig-vim'}, { ft = "zig" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'editorconfig-vim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType latex ++once lua require("packer.load")({'cmp-latex-symbols'}, { ft = "latex" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'editorconfig-vim', 'vim-goimports'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType sass ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "sass" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'vim-smartchr', 'editorconfig-vim'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'nvim-colorizer.lua', 'editorconfig-vim'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au CompleteDone * ++once lua require("packer.load")({'echodoc.vim'}, { event = "CompleteDone *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'vim-cursorword', 'LuaSnip', 'nvim-lspconfig'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'vim-cursorword', 'gitsigns.nvim'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'suda.vim', 'nvim-treesitter', 'gitsigns.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au InsertCharPre * ++once lua require("packer.load")({'vim-smartchr'}, { event = "InsertCharPre *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
