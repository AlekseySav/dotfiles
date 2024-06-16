return {
	{
		'navarasu/onedark.nvim',
		priority = 1000,
		opts = {}
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons', },
		opts = {
			sections = {
				lualine_c = { { 'filename', path = 1 } },
				lualine_y = {},
			}
		},
	}
}
