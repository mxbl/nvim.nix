local color, c, Group, g, s = require('colorbuddy').setup()

vim.opt.termguicolors = true

color.new('black',     '#000000')
color.new('superwhite','#ffffff')
color.new('darkgray',  '#202020')
color.new('darkgray0', '#3a3a3a')
color.new('darkgray1', '#404040')
color.new('darkgray2', '#505050')
color.new('lightblue', '#5eacd3')
color.new('limegreen', '#6dfc18')

-- require('rose-pine').setup({
--     disable_background = true
-- })

--require('colorbuddy').colorscheme 'gruvbuddy'
require('colorizer').setup()

Group.new('Whitespace', c.darkgray0, nil, nil)
Group.new('NonText', c.darkgray0, nil, nil)

--Group.new('CursorLine', nil, c.darkgray)
Group.new('SignColumn', nil, nil, nil)
--Group.new('Comment', c.darkgray2, nil, nil)
Group.new('Normal', nil, nil, nil)
Group.new('LineNr', c.darkgray2, nil, nil)

-- Telescope
Group.new('TelescopeNormal', c.superwhite, nil, nil)
Group.new('TelescopeBorder', c.darkgray0, nil, nil)
Group.new('TelescopeTitle', c.lightblue, nil, nil)

-- NOTE: needs to stay golang does not use lsp.type.* why?
--   lua and rust do
--Group.new('@variable', c.superwhite, nil)
--Group.new('@parameter', c.superwhite, nil)
--Group.new('@lsp.type.variable', c.superwhite, nil)
--Group.new('@lsp.type.parameter', c.superwhite, nil)

--Group.new('@function.bracket', g.Normal, g.Normal)
--Group.new('@variable.builtin', c.purple:light():light(), g.Normal)
--Group.new('WinSeparator', nil, nil)

--Group.new('TabLine', nil, c.darkgray2, nil)
--Group.new('VertSplit', nil, nil, nil)
--Group.new('TabLineFill', nil, nil, nil)

--vim.cmd [[highlight link @function.call.lua LuaFunctionCall]]

--Group.new("CmpItemAbbr", c.lightblue:light(), nil, nil)
--Group.new("CmpItemAbbrMatch", g.CmpItemAbbr.fg:dark(), nil, s.underline)
--Group.new("CmpItemAbbrDeprecated", g.Error)
--Group.new("CmpItemAbbrMatchFuzzy", g.CmpItemAbbr.fg:dark(), nil, s.underline)
--Group.new("CmpItemKind", g.Special)
--Group.new("CmpItemMenu", g.NonText)

--Group.new('LspInlayHints', c.lightblue:dark(), nil, nil)
