vim.pack.add({
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/nvim-treesitter/nvim-treesitter',

	-- navigation
	'https://github.com/nvim-telescope/telescope.nvim',
	'https://github.com/theprimeagen/harpoon',
	'https://github.com/chentoast/marks.nvim',
	'https://github.com/alekseysav/gosource.nvim',
	'https://github.com/chentoast/marks.nvim',

	-- lsp
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/saghen/blink.cmp',
	'https://github.com/rafamadriz/friendly-snippets',
	'https://github.com/folke/lazydev.nvim',
	'https://github.com/j-hui/fidget.nvim',
	'https://github.com/williamboman/mason.nvim',
	'https://github.com/williamboman/mason-lspconfig.nvim',

	-- view
	'https://github.com/navarasu/onedark.nvim',
	'https://github.com/nvim-tree/nvim-web-devicons',
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/nvim-lualine/lualine.nvim',
	'https://github.com/airblade/vim-gitgutter',
})

require('options')
require('keymaps')
require('autocmd')

require('onedark').load()
