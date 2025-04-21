local function get_dir()
	local oil_dir = require('oil').get_current_dir(0)
	if oil_dir ~= nil then
		return oil_dir
	end
	return require('telescope.utils').buffer_dir()
end

return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local telescope = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', telescope.find_files)
		vim.keymap.set('n', '<leader>fb', telescope.buffers)
		vim.keymap.set('n', '<leader>fg', telescope.live_grep)
		vim.keymap.set('n', '<leader>fh', telescope.help_tags)

		vim.keymap.set('n', '<leader>fd', function() telescope.find_files { search_dirs = { get_dir() } } end)
		vim.keymap.set('n', '<leader>gd', function() telescope.live_grep { search_dirs = { get_dir() } } end)
	end
}
