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
