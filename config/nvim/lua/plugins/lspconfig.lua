local servers = {
	'lua_ls',
	'pyright',
	'clangd',
	'gopls',
	'html',
	'htmx',
	'zls',
	'marksman',
	'bashls',
	'yamlls',
}

return {
	'neovim/nvim-lspconfig',
	dependencies = {
		{ 'folke/neodev.nvim',                 opts = {} },
		{ 'williamboman/mason.nvim',           opts = {} },
		{ 'williamboman/mason-lspconfig.nvim', opts = {} },
	},
	config = function()
		local lspconf = require('lspconfig')
		local cap = require('cmp_nvim_lsp').default_capabilities()
		for _, server in ipairs(servers) do
			lspconf[server].setup { capabilities = cap }
		end
	end
}
