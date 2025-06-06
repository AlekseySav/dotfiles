-- custom remaps

vim.keymap.set('n', '<leader>lz', ':Lazy<CR>')
vim.keymap.set('n', '<leader>so', ':w<CR>:source<CR>')
vim.keymap.set('x', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>nn', function() info('hello') end)
vim.keymap.set('n', '<leader>tf', function() vim.opt.list = false end)
vim.keymap.set('n', '<leader>tt', function() vim.opt.list = true end)

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
vim.keymap.set('i', '<C-c>', '<C-[>')
vim.keymap.set('v', 'gy', '"gy')
vim.keymap.set('n', 'gY', '"gY')
vim.keymap.set('n', 'gyy', '"gyy')
vim.keymap.set('v', 'gp', '"gp')
vim.keymap.set('n', '<leader>da', ':%s/$A\\//<CR>')

vim.keymap.set('x', 'K', ':m \'<-2<CR>gv=gv')
vim.keymap.set('x', 'J', ':m \'>+1<CR>gv=gv')

-- window move
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')

-- folds
vim.keymap.set('n', '<leader>fo', ':foldopen<CR>')
vim.keymap.set('n', '<leader>fc', ':foldclose<CR>')

vim.keymap.set('n', '<leader>dc', 'Vap:g/^\\s*\\/\\/.*$/d<CR>')

vim.keymap.set('n', '<leader>gs', require('gosource').change_extension({
	{ '.proto', '.pb.h' },
	{ '.pb.h',  '.proto' },
	{ '.pb.cc', '.proto' },
	{ '.h',     '.cpp',  create = true },
	{ '.hpp',   '.cpp',  create = true },
	{ '.cpp',   '.h' },
	{ '.cpp',   '.hpp' },
	{ '.h',     '.c', },
	{ '.c',     '.h' },
}))

-- add note
vim.keymap.set('n', '<leader>an', function()
	local name = vim.fn.input("Name: ", "", "file")
	vim.fn.feedkeys('Go[[' .. name .. ']]')
	vim.schedule(function()
		vim.cmd.stopinsert()
		vim.cmd('e ' .. name .. '.md')
	end)
end)

-- file/buffer modifications
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>x', ':!chmod +x %<CR><Enter>')
