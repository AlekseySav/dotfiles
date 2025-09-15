local theme = require('lualine.themes.auto')
theme.normal.c.bg = '#282c34'
for _, n in pairs(theme) do
	n.a = { fg = n.a.bg, bg = theme.normal.c.bg }
	n.b = { bg = theme.normal.c.bg }
	n.z = { fn = theme.normal.c.bg, bg = theme.normal.c.bg }
end

require('lualine').setup({
	options = {
		theme = theme,
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_a = { { 'mode', fmt = function(s) return '[' .. s .. ']' end } },
		lualine_c = { 'diff' },
		lualine_b = { { 'filename', path = 1, bg = 'none' } },
		lualine_x = { { 'diagnostics', symbols = { error = '', warn = '', info = '', hint = '' } }, 'filetype' },
		lualine_y = {},
	},
	extensions = { 'oil' },
})
