
local u = require 'utils'
local luasnip = require 'luasnip'

luasnip.config.set_config {
    history = true,
    -- Update more often, :h events for more info.
    updateevents = 'TextChanged,TextChangedI',
}

require('luasnip/loaders/from_vscode').load()

--- <tab> to jump to next snippet's placeholder
local function on_tab()
    return luasnip.jump(1) and '' or u.t '<Tab>'
end

--- <s-tab> to jump to next snippet's placeholder
local function on_s_tab()
    return luasnip.jump(-1) and '' or u.t '<S-Tab>'
end

u.imap('<Tab>', on_tab, { expr = true })
u.smap('<Tab>', on_tab, { expr = true })
u.imap('<S-Tab>', on_s_tab, { expr = true })
u.smap('<S-Tab>', on_s_tab, { expr = true })
