vim.pack.add({
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/nvim-telescope/telescope.nvim',
	'https://github.com/theprimeagen/harpoon',
	'https://github.com/chentoast/marks.nvim',

	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/saghen/blink.cmp',
	'https://github.com/rafamadriz/friendly-snippets',
	'https://github.com/folke/lazydev.nvim',
	'https://github.com/j-hui/fidget.nvim',
	'https://github.com/williamboman/mason.nvim',
	'https://github.com/williamboman/mason-lspconfig.nvim',


	'https://github.com/navarasu/onedark.nvim',
	'https://github.com/nvim-tree/nvim-web-devicons',
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/nvim-lualine/lualine.nvim',

	'https://github.com/alekseysav/gosource.nvim',
	'https://github.com/chentoast/marks.nvim',
	'https://github.com/airblade/vim-gitgutter',
})

require('marks').setup()
require('mason').setup()
require('mason-lspconfig').setup()

require('options')
require('keymaps')
require('autocmd')

local lspconfigs = {
	['clangd'] = {
		filetypes = { 'c', 'cpp' },
		cmd = {
			'clangd',
			'--header-insertion=never',
			'--background-index',
			'--pch-storage=memory',
			'--header-insertion-decorators=false'
		},
	},
	['rust-analyzer'] = {
		cmd = { 'rust-analyzer', '+nightly' },
	}
}

for _, server in ipairs(require('mason-lspconfig').get_installed_servers()) do
	local opts = lspconfigs[server] or {}
	opts.capabilities = require('blink.cmp').get_lsp_capabilities()
	require('lspconfig')[server].setup(opts)
end

require('onedark').load()
