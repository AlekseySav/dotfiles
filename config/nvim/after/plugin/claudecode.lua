require('claudecode').setup {}

local term = require('claudecode.terminal')

local function is_terminal_active()
	local bufinfo = vim.fn.getbufinfo(term.get_active_terminal_bufnr())
	return #bufinfo[1].windows > 0
end

local function hide_terminal()
	if is_terminal_active() then
		term.simple_toggle()
	end
end

vim.keymap.set('n', '<leader>ac', '<cmd>ClaudeCode --continue<cr>', { desc = 'Toggle Claude Code' })
vim.keymap.set('n', '<leader>af', '<cmd>ClaudeCodeFocus<cr>', { desc = 'Focus Claude' })

vim.keymap.set('t', '<C-Space>', function()
	if is_terminal_active() then
		hide_terminal()
	else
		vim.cmd.ToggleTerm()
	end
end)

vim.keymap.set('n', '<leader>ab', function()
	vim.cmd [[ClaudeCodeAdd %]]
end, { desc = 'Add current buffer' })

vim.keymap.set('v', '<leader>as', function()
	vim.cmd [[ClaudeCodeSend]]
end, { desc = 'Send to Claude' })

vim.keymap.set('n', '<leader>aa', function()
	vim.cmd [[ClaudeCodeDiffAccept]]
	hide_terminal()
end, { desc = 'Accept diff' })

vim.keymap.set('n', '<leader>ad', function()
	vim.cmd [[ClaudeCodeDiffDeny]]
	hide_terminal()
end, { desc = 'Deny diff' })

vim.api.nvim_create_autocmd('OptionSet', {
	group = vim.api.nvim_create_augroup('ClaudeCodeDiffAutoHide', { clear = true }),
	pattern = 'diff',
	callback = hide_terminal,
})
