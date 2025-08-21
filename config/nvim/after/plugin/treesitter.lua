require('nvim-treesitter').setup({
	opts = {
		ensure_installed = { 'vimdoc', 'c', 'lua', 'cpp', 'zig', 'dot', 'go', 'java', 'python', 'json', 'javascript' },
		sync_install = true
	}
})

vim.api.nvim_create_autocmd('PackChanged', {
	command = 'TSUpdate',
})
