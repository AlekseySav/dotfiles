-- setup packages --

require('lazy').setup {
	-- appearence --
	{
		'navarasu/onedark.nvim',
		priority = 1000,
		opts = {}
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons', },
		opts = {
			sections = {
				lualine_c = { { 'filename', path = 1 } },
				lualine_y = {},
			}
		},
	},

	-- file navigation --
	{
		'stevearc/oil.nvim',
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {
			pickers = { find_files = { hidden = true } },
			progress = { suppress_on_insert = false, },
		}
	},
	'ThePrimeagen/harpoon',

	-- notifications --
	{
		'j-hui/fidget.nvim',
		opts = {
			notification = { window = { y_padding = 2 } },
		},
		config = function()
			require('fidget').setup({})
			_G.info = function(msg)
				require('fidget').notify(msg)
			end
		end
	},

	-- treesitter --
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		opts = {
			ensure_installed = { 'c', 'lua', 'cpp', 'zig', 'dot', 'go', 'java', 'python', 'json', 'javascript' },
			sync_install = true
		}
	},

	-- lsp --
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'folke/neodev.nvim', opts = {} },
			{ 'williamboman/mason.nvim', opts = {} },
			{
				'williamboman/mason-lspconfig.nvim',
				opts = { --[[ automatic_installation = true --]] },
			},
		},
	},

	-- code completion --
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip'
		},
	},
}
