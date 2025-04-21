return {
	'ThePrimeagen/harpoon',
	config = function()
		vim.keymap.set('n', '<leader>a', require('harpoon.mark').add_file)
		vim.keymap.set('n', '<leader>hh', require('harpoon.ui').toggle_quick_menu)
		vim.keymap.set('n', '<leader>ht', function()
			require('harpoon.term').gotoTerminal(1)
			vim.fn.feedkeys('i')
		end)
		vim.keymap.set('t', '<C-Space>', '<C-\\><C-n>:b#<CR>')
		for i = 1, 9 do
			vim.keymap.set('n', '<leader>' .. tostring(i), function() require('harpoon.ui').nav_file(i) end)
		end
	end
}
