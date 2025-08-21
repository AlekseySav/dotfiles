vim.keymap.set('n', '<leader>pack', vim.pack.update)

vim.keymap.set('n', '<leader>so', ':w<CR>:source<CR>')

vim.keymap.set('i', '<C-c>', '<C-[>')

vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>x', ':!chmod +x %<CR><Enter>')

vim.keymap.set('v', '<leader>y', '"+y')

vim.keymap.set('n', '<C-D>', '<C-D>zz')
vim.keymap.set('n', '<C-U>', '<C-U>zz')
vim.keymap.set('n', '{', '{zz')
vim.keymap.set('n', '}', '}zz')

vim.keymap.set('x', 'K', ':m \'<-2<CR>gv=gv')
vim.keymap.set('x', 'J', ':m \'>+1<CR>gv=gv')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')

vim.keymap.set('n', '<leader>fo', ':foldopen<CR>')
vim.keymap.set('n', '<leader>fc', ':foldclose<CR>')
