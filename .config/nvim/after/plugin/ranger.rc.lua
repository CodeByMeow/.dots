vim.keymap.set('n', 'rg', '<cmd>:RnvimrToggle<cr>')


-- Define the autocmd to open Ranger on startup
local autocmd = { "VimEnter", "*", [[RnvimrToggle]] }


-- Define a function to create the autocmds
local function create_autocmds()
    vim.cmd(string.format("autocmd %s %s %s", autocmd[1], autocmd[2], autocmd[3]))
end

-- Call the function to create the autocmds
create_autocmds()
