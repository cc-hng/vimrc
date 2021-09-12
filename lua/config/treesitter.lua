require'nvim-treesitter.configs'.setup {
    ensure_installed = 'maintained',
    highlight = {
        enable = true,
        disable = {},
    },
}

vim.cmd [[
" Custom colors
highlight CandyBlue         gui=NONE guibg=#2c2c2c guifg=#1e95fd
highlight CandyCranberry    gui=NONE guibg=#2c2c2c guifg=#4ae2e2
highlight CandyEmerald      gui=NONE guibg=#2c2c2c guifg=#44ff44
highlight CandyGreen        gui=NONE guibg=#2c2c2c guifg=#66ff66
highlight CandyLime         gui=NONE guibg=#2c2c2c guifg=#4ae2e2
highlight CandyOrange       gui=NONE guibg=#2c2c2c guifg=#ffb30a
highlight CandyRed          gui=NONE guibg=#2c2c2c guifg=#ff6666
highlight CandySky          gui=NONE guibg=#2c2c2c guifg=#6699ff
highlight CandyViolet       gui=NONE guibg=#2c2c2c guifg=#ff13ff
highlight CandyWhite        gui=NONE guibg=#2c2c2c guifg=#cccccc
highlight CandyYellow       gui=NONE guibg=#2c2c2c guifg=#ffd30a
highlight CandyCoral        gui=NONE guibg=#2c2c2c guifg=#f820ff
highlight CandyTurquoise    gui=NONE guibg=#2c2c2c guifg=#1bc8c8
highlight CandyCrimson      gui=NONE guibg=#2c2c2c guifg=#ff4444
" neovim treesitter colors
highlight! link TSAnnotation      CandyViolet
highlight! link TSAttribute       CandySky
highlight! link TSBoolean         Boolean
highlight! link TSCharacter       Character
highlight! link TSConditional     CandyCoral
highlight! link TSConstBuiltin    CandyGreen
highlight! link TSConstMacro      CandyViolet
highlight! link TSConstant        Constant
highlight! link TSConstructor     CandyEmerald
highlight! link TSError           Error
highlight! link TSException       Exception
highlight! link TSField           CandyBlue
highlight! link TSFloat           Float
highlight! link TSFuncBuiltin     CandySky
highlight! link TSFuncMacro       CandySky
highlight! link TSFunction        CandyCranberry
highlight! link TSInclude         CandyCranberry
highlight! link TSKeyword         CandyEmerald
highlight! link TSKeywordFunction Keyword
highlight! link TSKeywordOperator CandyViolet
highlight! link TSLabel           Label
highlight! link TSLiteral         CandyYellow
highlight! link TSMethod          CandyTurquoise
highlight! link TSNamespace       CandyBlue
highlight! link TSNone            Normal
highlight! link TSNumber          Number
highlight! link TSOperator        Operator
highlight! link TSParameter       CandyWhite
highlight! link TSParameterReference CandyWhite
highlight! link TSProperty        Identifier
highlight! link TSPunctBracket    CandyOrange
highlight! link TSPunctDelimiter  CandyLime
highlight! link TSPunctSpecial    Special
highlight! link TSRepeat          Repeat
highlight! link TSString          String
highlight! link TSStringEscape    SpecialChar
highlight! link TSStringRegex     String
highlight! link TSTag             CandyBlue
highlight! link TSTagDelimiter    CandyLime
highlight! link TSText            TSNone
highlight! link TSTitle           Title
highlight! link TSType            Type
highlight! link TSTypeBuiltin     Type
highlight! link TSURL             Underlined
highlight! link TSUnderline       Underlined
highlight! link TSVariableBuiltin CandyLime
]]

