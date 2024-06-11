-- lsp config --

local lspconf = require('lspconfig')
local cmp = require('cmp')

cmp.setup {
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources(
	{
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }
	},
	{
		{ name = 'buffer' },
		{ name = 'path' },
	}),
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = function()
			if not cmp.visible() then
				cmp.complete()
			else
				cmp.confirm { select = true }
			end
		end
	})
}

local cap = require('cmp_nvim_lsp').default_capabilities()

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
}

for _, server in ipairs(servers) do
	lspconf[server].setup {
		capabilities = cap,
	}
end
