return {
	'j-hui/fidget.nvim',
	opts = {
		notification = { window = { y_padding = 2 } },
	},
	config = function()
		require('fidget').setup({})
		_G.info = function(msg)
			require('fidget').notify(msg)
		end
	end
}
