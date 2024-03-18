-- lsp config --

local lsp = require('lspconfig')
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

lsp.lua_ls.setup {
	settings = {
		Lua = { diagnostics = { globals = { 'vim', 'al' } } }
	},
	capabilities = cap
}

lsp.pyright.setup {
	capabilities = cap
}

lsp.clangd.setup {
	capabilities = cap
}

lsp.gopls.setup {
	capabilities = cap
}

lsp.html.setup {
	capabilities = cap
}

lsp.htmx.setup {
	capabilities = cap
}

lsp.zls.setup {
	capabilities = cap
}
