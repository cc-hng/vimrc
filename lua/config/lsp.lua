local g = require 'global'
local sysname = g.is_mac and 'macOS' or (g.is_unix and 'Linux' or 'Windows')

function _G.reload_lsp()
    vim.lsp.stop_client(vim.lsp.get_active_clients())
    vim.cmd [[edit]]
end

function _G.open_lsp_log()
    local path = vim.lsp.get_log_path()
    vim.cmd("edit " .. path)
end

vim.cmd('command! -nargs=0 LspLog call v:lua.open_lsp_log()')
vim.cmd('command! -nargs=0 LspRestart call v:lua.reload_lsp()')

local nvim_lsp = require 'lspconfig'

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = {
    "pyright",
    "rust_analyzer",
    "cmake",
    "gopls",
    "cssls",
    "tsserver" }
    for _, lsp in ipairs(servers) do
        nvim_lsp[lsp].setup { on_attach = on_attach }
    end

    -- c/c++
    nvim_lsp.clangd.setup {
        cmd = {"clangd", "--background-index", "--fallback-style=webkit"};
        -- root_dir = root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
        on_attach = function(client, bufnr)
            local opts = { noremap=true, silent=true }
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F4>', '<cmd>ClangdSwitchSourceHeader<CR>', opts)
            on_attach(client, bufnr)
        end
    }

    -- lua
    local lua_lsp = string.format('%s/lua-language-server/bin/%s/lua-language-server',
    g.local_dir, sysname)
    local lua_lsp_script = string.format('%s/lua-language-server/main.lua', g.local_dir)
    nvim_lsp.sumneko_lua.setup {
        cmd = { lua_lsp, "-E", lua_lsp_script };
        settings = {
            Lua = {
                diagnostics = {
                    enable = true,
                    globals = {"vim","packer_plugins"}
                },
                runtime = {version = "LuaJIT"},
                workspace = {
                    library = vim.list_extend({[vim.fn.expand("$VIMRUNTIME/lua")] = true},{}),
                },
            },
        }
    }
