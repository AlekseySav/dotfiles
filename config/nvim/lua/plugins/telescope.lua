return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		pickers = {
			find_files = { hidden = true }
		},
		progress = { suppress_on_insert = false, },
	}
}
