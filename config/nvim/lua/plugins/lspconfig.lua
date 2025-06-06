local lspconfigs = {
	['clangd'] = {
		filetypes = { 'c', 'cpp' },
		cmd = { 'clangd', '--header-insertion=never' },
	},
	['rust-analyzer'] = {
		cmd = { 'rust-analyzer', '+nightly' },
	}
}

return {
	'neovim/nvim-lspconfig',

	dependencies = {
		{
			'saghen/blink.cmp',
			dependencies = { 'rafamadriz/friendly-snippets' },
			version = '1.*',
			opts = {
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
					['<C-l>'] = { 'show_documentation', 'hide_documentation' },
				},
			},
		},
		{
			'folke/lazydev.nvim',
			opts = {
				library = {
					{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
				},
			},
		},
		{ 'williamboman/mason.nvim',           opts = {} },
		{ 'williamboman/mason-lspconfig.nvim', opts = {} },
	},

	config = function()
		for _, server in ipairs(require('mason-lspconfig').get_installed_servers()) do
			local opts = lspconfigs[server] or {}
			opts.capabilities = require('blink.cmp').get_lsp_capabilities()
			require('lspconfig')[server].setup(opts)
		end
	end
}
