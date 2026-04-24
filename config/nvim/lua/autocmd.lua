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
