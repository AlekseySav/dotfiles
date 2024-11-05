return {
	'neovim/nvim-lspconfig',
	dependencies = {
		{ 'folke/neodev.nvim',                 opts = {} },
		{ 'williamboman/mason.nvim',           opts = {} },
		{ 'williamboman/mason-lspconfig.nvim', opts = {} },
	},
	config = function()
		local cap = require('cmp_nvim_lsp').default_capabilities()
		require('mason-lspconfig').setup_handlers {
			function(server)
				require('lspconfig')[server].setup { capabilities = cap }
			end
		}
	end
}
