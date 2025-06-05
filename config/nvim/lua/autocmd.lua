vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
	command = [[%s/\s\+$//e]]
})

local config_path = os.getenv('HOME') .. '/.dotfiles/config'
local copy_to_config_path = os.getenv('HOME') .. '/.dotfiles/hooks/copy-to-config'
local Job = require('plenary.job')

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	pattern = "*.tmux",
	command = [[set syntax=tmux]],
})

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
	callback = function()
		-- format file
		-- if next(vim.lsp.get_clients({ bufnr = 0 })) ~= nil then
		-- 	vim.lsp.buf.format()
		-- end

		-- copy to config
		local file = vim.fn.expand('%:p')
		if #file > #config_path and file:sub(1, #config_path) == config_path then
			local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
			Job:new({
				command = copy_to_config_path,
				args = { "--no-color", "--stdin", file:sub(#config_path + 2) },
				writer = table.concat(content, '\n'),

				on_stderr = function(_, data)
					vim.schedule(function()
						if data ~= nil then
							info(data)
						end
					end)
				end,

				on_exit = function(_, return_val)
					vim.schedule(function()
						info('copied ' .. vim.fn.expand('%:t') .. ' to config, exit status: ' .. return_val)
					end)
				end,
			}):sync()
		end
	end
})
