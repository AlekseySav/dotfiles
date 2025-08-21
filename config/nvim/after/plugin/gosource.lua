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
