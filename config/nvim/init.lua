vim.pack.add({
	'https://github.com/nvim-lua/plenary.nvim',
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },

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
	'https://github.com/mhartington/formatter.nvim',

	-- dap
	'https://github.com/mfussenegger/nvim-dap',
	'https://github.com/nvim-neotest/nvim-nio',
	'https://github.com/rcarriga/nvim-dap-ui',
	'https://github.com/mfussenegger/nvim-dap-python',

	-- view
	'https://github.com/nvim-tree/nvim-web-devicons',
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/nvim-lualine/lualine.nvim',
	'https://github.com/akinsho/toggleterm.nvim',
	'https://github.com/navarasu/onedark.nvim',

	-- extensions
	'https://github.com/nathanalderson/yang.vim',

	-- claude
	'https://github.com/folke/snacks.nvim',
	'https://github.com/coder/claudecode.nvim',
})

require('options')
require('keymaps')
require('autocmd')

require('onedark').load()

for _, plugin in ipairs(vim.fn.readdir(vim.fn.stdpath('config') .. '/lua/plugins/')) do
	require('plugins/' .. plugin:gsub('%.lua$', ''))
end
