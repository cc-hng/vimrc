
lua << EOF
  local lsp = require 'nvim_lsp'
  local root_pattern = function(...)
    local old_f = lsp.util.root_pattern(...)
    return function(startpath)
      local work_dir = old_f(startpath) or vim.fn.fnamemodify(filepath, ':h')
      vim.api.nvim_command('cd ' .. work_dir)
      return work_dir
    end
  end

  -- rust
  lsp.rls.setup {
    cmd = {'rls'},
    filetypes = {'rust'},
    root_dir = root_pattern('Cargo.toml'),
  }

  -- go
  lsp.gopls.setup {
    cmd = {'gopls'},
    filetypes = {'go'},
    root_dir = root_pattern('go.mod', '.git'),
  }

  -- lua
  lsp.sumneko_lua.setup {
    filetypes = {'lua'},
    root_dir = root_pattern('.git'),
  }

  -- c/c++
  lsp.clangd.setup {
    cmd = { "clangd", "--background-index" },
    filetypes = {"c", "cpp", "objc", "objcpp"},
    root_dir = root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
  }

EOF
