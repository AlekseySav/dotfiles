local diff_buffers = {}

local function array2set(a)
	local r = {}
	for _, i in ipairs(a) do
		r[i] = true
	end
	return r
end

vim.keymap.set('n', '<leader>dif', function()
	if #diff_buffers == 0 then
		local b1 = array2set(vim.api.nvim_list_bufs())
		vim.cmd [[GitGutterDiffOrig]]
		local b2 = vim.api.nvim_list_bufs()
		for _, i in ipairs(b2) do
			if not b1[i] then
				diff_buffers[#diff_buffers + 1] = i
			end
		end
	else
		for _, i in ipairs(diff_buffers) do
			vim.cmd([[bw ]] .. i)
		end
		diff_buffers = {}
	end
end)
