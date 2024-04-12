-- local bufnr = 9

local function getvpos()
	local b = vim.api.nvim_win_get_cursor(0)
	local pos = vim.fn.getpos("v")
	local e = {pos[2], pos[3]}
	if e[1] < b[1] or (e[1] == b[1] and e[2] < b[2]) then
		e, b = b, e
	end
	return b[1], b[2], e[1], e[2]
end

local function run()
	local rb, cb, re, ce = getvpos()
	print(rb, cb, re, ce)
	-- info(':' .. line)
end

vim.keymap.set('x', '<leader>go', function() vim.schedule(run) end)


-- vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {'lalala'})
