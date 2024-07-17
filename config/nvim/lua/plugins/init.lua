return {
	{
		'navarasu/onedark.nvim',
		priority = 1000,
		config = function ()
			require('onedark').load()
		end
	},
	'ThePrimeagen/harpoon',
	'alekseysav/gosource.nvim',
}
