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
				if server == 'clangd' then
					require('lspconfig')[server].setup {
						capabilities = cap,
						filetypes = { 'c', 'cpp' },
						cmd = { 'clangd', '--header-insertion=never' }
					}
				elseif server == 'rust-analyzer' then
					require('lspconfig')[server].setup {
						capabilities = cap,
						cmd = { 'rust-analyzer', '+nightly' }
					}
				else
					require('lspconfig')[server].setup { capabilities = cap }
				end
			end
		}
		require('lspconfig')['pyright'].setup { capabilities = cap }
	end
}
