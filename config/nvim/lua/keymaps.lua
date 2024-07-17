-- custom remaps

vim.keymap.set('n', '<leader>lz', ':Lazy<CR>')
vim.keymap.set('n', '<leader>so', ':w<CR>:source<CR>')
vim.keymap.set('x', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>nn', function() info('hello') end)
vim.keymap.set('n', '<leader>tf', function() vim.opt.list = false end)
vim.keymap.set('n', '<leader>tt', function() vim.opt.list = true end)

-- oil
vim.keymap.set('n', '<leader>e', vim.cmd.Oil)
vim.keymap.set('n', '-', vim.cmd.Oil)

-- telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files)
vim.keymap.set('n', '<leader>fb', telescope.buffers)
vim.keymap.set('n', '<leader>fg', telescope.live_grep)
vim.keymap.set('n', '<leader>fh', telescope.help_tags)
vim.keymap.set('n', '<leader>fd', function() telescope.find_files({ cwd = require('telescope.utils').buffer_dir() }) end)
vim.keymap.set('n', '<leader>gd', function() telescope.live_grep({ cwd = require('telescope.utils').buffer_dir() }) end)

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

-- cmp
vim.keymap.set({"i", "s"}, "<C-L>", function() require('luasnip').jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() require('luasnip').jump(-1) end, {silent = true})

-- motions
vim.keymap.set('n', '<C-D>', '<C-D>zz')
vim.keymap.set('n', '<C-U>', '<C-U>zz')
vim.keymap.set('n', '{', '{zz')
vim.keymap.set('n', '}', '}zz')
vim.keymap.set('n', '<C-k>', 'ddkP')
vim.keymap.set('n', '<C-j>', 'ddp')
vim.keymap.set('x', '<C-k>', 'dkP`[V`]')
vim.keymap.set('x', '<C-j>', 'djP`[V`]')
vim.keymap.set('i', '<C-c>', '<C-[>')
vim.keymap.set('v', 'gy', '"gy')
vim.keymap.set('n', 'gY', '"gY')
vim.keymap.set('n', 'gyy', '"gyy')
vim.keymap.set('v', 'gp', '"gp')

-- folds
vim.keymap.set('n', '<leader>fo', ':foldopen<CR>')
vim.keymap.set('n', '<leader>fc', ':foldclose<CR>')

vim.keymap.set('n', '<leader>dc', 'Vap:g/^\\s*\\/\\/.*$/d<CR>')

vim.keymap.set('n', '<leader>gs', require('gosource').change_extension({
	{ '.proto', '.pb.h' },
	{ '.pb.h', '.proto' },
	{ '.pb.cc', '.proto' },
	{ '.h', '.cpp', create = true },
	{ '.cpp', '.h' },
	{ '.h', '.c', },
	{ '.c', '.h' },
}))

-- add note
vim.keymap.set('n', '<leader>an', function ()
	local name = vim.fn.input("Name: ", "", "file")
	vim.fn.feedkeys('Go[[' .. name .. ']]')
	vim.schedule(function() vim.cmd.stopinsert() vim.cmd('e ' .. name .. '.md') end)
end)

-- file/buffer modifications
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>x', ':!chmod +x %<CR><Enter>')
