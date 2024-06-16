return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	opts = {
		ensure_installed = { 'vimdoc', 'c', 'lua', 'cpp', 'zig', 'dot', 'go', 'java', 'python', 'json', 'javascript' },
		sync_install = true
	}
}
