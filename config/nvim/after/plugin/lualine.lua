require('lualine').setup({
	sections = {
		lualine_c = { { 'filename', path = 1 } },
		lualine_x = { 'filetype' },
		lualine_y = {},
	},
	extensions = { 'oil' },
})
