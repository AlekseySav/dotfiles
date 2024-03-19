-- all remaps are stored here --

vim.keymap.set('n', '<leader>lz', ':Lazy<CR>')
vim.keymap.set('n', '<leader>e', ':E<CR>')
vim.keymap.set('n', '<leader>so', ':w<CR>:source<CR>')
vim.keymap.set('x', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>nn', function() info('hello') end)

-- telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files)
vim.keymap.set('n', '<leader>fg', telescope.live_grep)
vim.keymap.set('n', '<leader>fh', telescope.help_tags)
vim.keymap.set('n', '<leader>fd', function() telescope.find_files({ cwd = require('telescope.utils').buffer_dir() }) end)

-- harpoon
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

-- lsp
vim.keymap.set('n', '<leader>m', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
	end
})

-- motions
vim.keymap.set('n', '<C-D>', '<C-D>zz')
vim.keymap.set('n', '<C-U>', '<C-U>zz')
vim.keymap.set('n', '{', '{zz')
vim.keymap.set('n', '}', '}zz')
vim.keymap.set('n', '<C-k>', 'ddkP')
vim.keymap.set('n', '<C-j>', 'ddjP')
vim.keymap.set('x', '<C-k>', 'dkP`[V`]')
vim.keymap.set('x', '<C-j>', 'djP`[V`]')
vim.keymap.set('i', '<C-c>', '<C-[>')
vim.keymap.set('v', 'gy', '"gy')
vim.keymap.set('n', 'gY', '"gY')
vim.keymap.set('n', 'gyy', '"gyy')
vim.keymap.set('v', 'gp', '"gp')

-- completion, generation, etc.
local function replace_text(mode, fmt)
	local toggle_line = function(line)
		local str = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
		local match = '^' .. fmt:gsub('%%s', '(.*)') .. '$'
		if str:match(match) then
			local _, _, v = str:find(match)
			str = v
		else
			str = string.format(fmt, str)
		end
		vim.api.nvim_buf_set_lines(0, line - 1, line, true, { str })
	end
	if mode == 'n' then
		local line = vim.api.nvim_win_get_cursor(0)[1]
		toggle_line(line)
	else
		vim.fn.feedkeys('VVV')
		vim.cmd('sleep')
		-- local a = vim.api.nvim_buf_get_mark(0, "<")[1]
		-- 		local b = vim.fn.getpos("'>")[2]
		-- 		for line = a, b do
		-- 			toggle_line(line)
		-- 		end
	end
end

C = vim.api.nvim_buf_get_option(0, 'commentstring')
vim.keymap.set('v', 'gc', function () vim.cmd([[:'<,'>echo "hello"<CR>]]) end)-- [[:!dots tool replace-lines ]] .. C, false) end)

-- vim.keymap.set('n', 'gc', function() replace_text('n', vim.api.nvim_buf_get_option(0, 'commentstring')) end)
-- vim.keymap.set('x', 'gc', function() replace_text('v', vim.api.nvim_buf_get_option(0, 'commentstring')) end)
-- vim.keymap.set('n', 'g,', function() replace_text('%s,') end)

-- file/buffer modifications
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>x', ':!chmod +x %<CR><Enter>')

-- auto commands
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
	pattern = { '*' },
	command = [[%s/\s\+$//e]]
})

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
	pattern = { '*.go' },
	command = [[lua vim.lsp.buf.format()]]
})
