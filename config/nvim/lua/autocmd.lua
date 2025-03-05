vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
	command = [[%s/\s\+$//e]]
})

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
	callback = function()
		if next(vim.lsp.get_clients({ bufnr = 0 })) ~= nil then
			vim.lsp.buf.format()
		end
	end
})

local config_path = os.getenv('HOME') .. '/.dotfiles/config'
local copy_to_config_path = os.getenv('HOME') .. '/.dotfiles/hooks/copy_to_config'
local Job = require('plenary.job')

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
	callback = function()
		local file = vim.fn.expand('%:p')
		if #file > #config_path and file:sub(1, #config_path) == config_path then
			Job:new({
				command = copy_to_config_path,
				args = { file:sub(#config_path + 2) },
			}):start()
		end
	end
})
