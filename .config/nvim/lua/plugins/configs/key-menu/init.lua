vim.o.timeoutlen = 300
local keymenu = require 'key-menu'
local map = vim.keymap.set
-- If you use <Space> as your mapping prefix, then this will make the key-menu
-- popup appear in Normal mode, after you press <Space>, after timeoutlen.
require 'key-menu'.set('n', '<Space>')

-- Use the desc option to Vim's built-in vim.keymap.set to describe mappings.
map('n', '<Space>w', '<Cmd>w<CR>', { desc = 'Save' })
map('n', '<Space>q', '<Cmd>q<CR>', { desc = 'Quit' })

-- You can also pass Lua functions to vim.keymap.set.
local erase_all_lines = function()
  vim.api.nvim_buf_set_lines(0, 0, -1, false, {})
end
map('n', '<Space>k', erase_all_lines, { desc = 'Erase all' })

map('n', '<Space>x', ':bdelete<cr>', { desc = 'Close' })

map('n', '<Space>f', function()
  keymenu.open_window('<Space>f')
end, { desc = 'Telescope' })
map('n', '<Space>ff', ':Telescope find_files<cr>', { desc = 'Find files' })
map('n', '<Space>fr', ':Telescope live_grep<cr>', { desc = 'Live grep' })
map('n', '<Space>fo', ':Telescope oldfiles<cr>', { desc = 'Recent file' })
map('n', '<Space>fb', ':Telescope buffers<cr>', { desc = 'Buffers' })

map('n', '<Space>e', ':NeoTreeFloat<cr>', { desc = 'Explorer' })
map('n', '<Space>s', ':SymbolsOutline<cr>', { desc = 'Symbols' })


local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function()
  local float = Terminal:new({ direction = "float" })
  return float:toggle()
end
local toggle_lazygit = function()
  local lazygit = Terminal:new({ cmd = 'lazygit', direction = "float" })
  return lazygit:toggle()
end
map('n', '<Space>t', function()
  keymenu.open_window('<Space>t')
end, { desc = 'Terminal' })
map('n', '<Space>tt', ':TodoTelescope<cr>', { desc = 'Todo' })
map('n', '<Space>tf', toggle_float, { desc = 'Float' })
map('n', '<Space>tl', toggle_lazygit, { desc = 'LazyGit' })
map('n', '<Space>td', ":TroubleToggle<cr>", { desc = 'Trouble' })


map('n', '<Space>z', function()
  keymenu.open_window('<Space>z')
end, { desc = 'Focus Mode' })
map('n', '<Space>zz', ":ZenMode<cr>", { desc = 'Zen Mode' })
map('n', '<Space>zt', ":ZenMode<cr>", { desc = 'Twilight' })


map('n', '<Space>l', function()
  keymenu.open_window('<Space>l')
end, { desc = 'LSP' })
map('n', '<Space>lk', "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = 'Help' })
map('n', '<Space>lK', "<cmd>Lspsaga hover_doc<cr>", { desc = 'Docs' })
map('n', '<Space>lw', "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", { desc = 'Add workspace' })
map('n', '<Space>lW', "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", { desc = 'Remove workspace' })
map('n', '<Space>ll', "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", { desc = 'List workspace' })
map('n', '<Space>lt', "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = 'Type definition' })
map('n', '<Space>ld', "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = 'Go To Definition' })
map('n', '<Space>lD', "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = 'Go To Declaration' })
map('n', '<Space>lr', "<cmd>lua vim.lsp.buf.references()<cr>", { desc = 'References' })
map('n', '<Space>lf', "<cmd>lua vim.lsp.buf.formatting_seq_sync()<cr>", { desc = 'Format' })
map('n', '<Space>lR', "<cmd>Lspsaga rename<cr>", { desc = 'Rename' })
map('n', '<Space>la', "<cmd>Lspsaga code_action<cr>", { desc = 'Action' })
map('n', '<Space>le', "<cmd>Lspsaga show_line_diagnostics<cr>", { desc = 'Show Line Diagnostic' })
map('n', '<Space>ln', "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = 'Next Diagnostic' })
map('n', '<Space>lN', "<cmd>Lspsaga diagnostic_jump_prev<cr>", { desc = 'Previous Diagnostic' })
map('n', '<Space>lp', "<cmd>Lspsaga preview_definition<cr>", { desc = 'Preview definition' })


map('n', '<Space>p', function()
  keymenu.open_window('<Space>p')
end, { desc = 'Packer' })
map('n', '<Space>pr', ":PackerClean<cr>", { desc = 'Remove Unused Plugins' })
map('n', '<Space>pc', ":PackerCompile profile=true<cr>", { desc = 'Recompile Plugins' })
map('n', '<Space>pi', ":PackerInstall<cr>", { desc = 'Install Plugins' })
map('n', '<Space>pp', ":PackerProfile<cr>", { desc = 'Packer Profile' })
map('n', '<Space>ps', ":PackerSync<cr>", { desc = 'Sync Plugins' })
map('n', '<Space>pS', ":PackerStatus<cr>", { desc = 'Packer Status' })
map('n', '<Space>pu', ":PackerUpdate<cr>", { desc = 'Update Plugins' })
