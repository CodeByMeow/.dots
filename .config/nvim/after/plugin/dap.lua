local dap = require('dap')
local dapui = require('dapui')

vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'error', linehl = '', numhl = '' })
-- ADAPTERS
dap.adapters.node2 = {
    type = 'executable',
    command = 'node-debug2-adapter',
    -- args = {os.getenv('HOME') .. '/.zinit/plugins/microsoft---vscode-node-debug2.git/out/src/nodeDebug.js'},
    -- args =  { vim.fn.stdpath('data') .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
    args = {},
}
dap.configurations.javascript = {
    {
        name = 'Launch',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
    {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = 'Attach to process',
        type = 'node2',
        request = 'attach',
        restart = true,
        -- port = 9229
        processId = require 'dap.utils'.pick_process,
    },
}

dapui.setup()

-- Nvim-dap
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ds", "<cmd>lua require'dap'.step_over()<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>dsi", "<cmd>lua require'dap'.step_into()<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>dso", "<cmd>lua require'dap'.step_out()<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>dui", ":lua require('dapui').toggle()<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>dro", "<cmd>lua require'dap'.repl.open()<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>dcc", "<cmd>lua require'telescope'.extensions.dap.commands{}<CR>",
    { silent = true, noremap = true })
vim.keymap.set("n", "<leader>dlb", "<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<CR>",
    { silent = true, noremap = true })
vim.keymap.set("n", "<leader>dv", "<cmd>lua require'telescope'.extensions.dap.variables{}<CR>",
    { silent = true, noremap = true })
vim.keymap.set("n", "<leader>df", "<cmd>lua require'telescope'.extensions.dap.frames{}<CR>",
    { silent = true, noremap = true })
