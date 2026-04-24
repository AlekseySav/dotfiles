local theme = require('lualine.themes.auto')
local bg = string.format('#%06x', vim.api.nvim_get_hl(0, { name = 'EndOfBuffer' }).bg)
for _, n in pairs(theme) do
	n.a = { fg = n.a.bg, bg = bg }
	n.b = { bg = bg }
	n.c = { bg = bg }
end
theme.terminal.b = { bg = bg, fg = bg }

require('lualine').setup({
	options = {
		theme = theme,
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_a = { { 'mode', fmt = function(s) return '[' .. s .. ']' end } },
		lualine_b = { { 'filename', path = 1, bg = 'none' } },
		lualine_c = { 'diff' },
		lualine_x = { { 'diagnostics', symbols = { error = '', warn = '', info = '', hint = '' } }, 'filetype' },
		lualine_y = {},
	},
	extensions = { 'oil' },
})
