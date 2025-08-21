require('lazydev').setup({
	library = {
		{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
	},
	enabled = function(root_dir)
		return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
	end,
})

require('blink.cmp').setup({
	sources = {
		default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
		providers = {
			lazydev = {
				name = 'LazyDev',
				module = 'lazydev.integrations.blink',
				score_offset = 100,
			},
		},
	},
	keymap = {
		preset = 'default',
		['<C-f>'] = { 'select_and_accept', 'show' },
		['<C-l>'] = { 'show_documentation', 'hide_documentation', 'snippet_forward' },
	},
	fuzzy = { implementation = 'lua' },
})

require('fidget').setup({ notification = { window = { y_padding = 2 } } })

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<leader>m', vim.diagnostic.open_float, opts)
		vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
		vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
	end
})
