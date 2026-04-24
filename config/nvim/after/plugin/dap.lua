vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "ErrorMsg", linehl = "", numhl = "" })

require('dap').adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}

require('dap').configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
}

require("dapui").setup()
local dap = require('dap')

vim.keymap.set('n', '<leader>b', ':DapToggleBreakpoint<CR>')
vim.keymap.set('n', '<leader>db', ':DapContinue<CR>')

require('dap').listeners.after.event_initialized['my_dap_keymaps'] = function()
	vim.keymap.set('n', 'c', dap.continue)
end


require('dap-python').setup('python3')
-- require('')
