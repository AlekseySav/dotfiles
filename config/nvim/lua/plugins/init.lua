return {
	{
		'navarasu/onedark.nvim',
		priority = 1000,
		config = function()
			require('onedark').load()
		end
	},
	'alekseysav/gosource.nvim',
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {},
	}
}
