return {
	'stevearc/oil.nvim',
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		skip_confirm_for_simple_edits = true,
	},
	config = function(plugin)
		require('oil').setup(plugin.opts)
		vim.keymap.set('n', '-', vim.cmd.Oil)
	end
}
