local config_path = os.getenv('HOME') .. '/.dotfiles/config'
local copy_to_config_path = os.getenv('HOME') .. '/.dotfiles/hooks/copy-to-config'
local Job = require('plenary.job')

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	pattern = "*.tmux",
	command = [[set syntax=tmux]],
})

vim.api.nvim_create_autocmd('BufWritePre', {
	callback = function()
		if next(vim.lsp.get_clients({ bufnr = 0 })) ~= nil then
			vim.lsp.buf.format()
		end
	end
})
