
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
    on_attach = function() vim.api.nvim_err_writeln("rls started.") end
  }

  -- go
  lsp.gopls.setup {
    cmd = {'gopls'},
    filetypes = {'go'},
    root_dir = root_pattern('go.mod', '.git'),
    on_attach = function() vim.api.nvim_err_writeln("gopls started.") end
  }

  -- lua
  lsp.sumneko_lua.setup {
    filetypes = {'lua'},
    root_dir = root_pattern('.git'),
    on_attach = function() vim.api.nvim_err_writeln("lua lsp started.") end
  }

  -- c/c++
  lsp.clangd.setup {
    cmd = { "clangd", "--background-index" },
    filetypes = {"c", "cpp", "objc", "objcpp"},
    root_dir = root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
    on_attach = function() vim.api.nvim_err_writeln("clangd started.") end
  }

  -- ts / js
  lsp.tsserver.setup {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = root_pattern("package.json", ".git"),
    on_attach = function() vim.api.nvim_err_writeln("tsserver started.") end
  }

  -- css
  lsp.cssls.setup {
    cmd = { "css-languageserver", "--stdio" },
    filetypes = { "css", "scss", "less" },
    root_dir = root_pattern("package.json", ".git"),
    on_attach = function() vim.api.nvim_err_writeln("cssls started.") end
  }


EOF
