-- setup packages --

require('lazy').setup {
	-- appearence --
	{
		'navarasu/onedark.nvim',
		priority = 1000,
		opts = { style = 'cool' }
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000
	},

	-- file navigation --
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {
			pickers = { find_files = { hidden = true } }
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
			al.msg = function(msg)
				require('fidget').notify(msg)
			end
		end
	},

	-- syntax hl --
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		opts = {
			ensure_installed = { 'c', 'lua', 'cpp', 'dot', 'go', 'java', 'python', 'json', 'javascript' },
			sync_install = true
		}
	},
	{
		'williamboman/mason-lspconfig.nvim',
		opts = { automatic_installation = true },
		dependencies = {
			{
				'neovim/nvim-lspconfig',
			},
			{
				'williamboman/mason.nvim',
				opts = {},
			},
		},
	},
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
	}
}
