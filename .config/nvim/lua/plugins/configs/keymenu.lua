local present, keymenu = pcall(require, "key-menu")
if not present then
  return
end

vim.o.timeoutlen = 300
local map = vim.keymap.set
keymenu.set('n', '<Space>')

map('n', '<Space>w', '<Cmd>w<CR>', { desc = 'Save' })
map('n', '<Space>q', '<Cmd>q<CR>', { desc = 'Quit' })
map('n', '<Space>s', '<Cmd>:LSoutlineToggle<CR>', { desc = 'Symbols' })

-- You can also pass Lua functions to vim.keymap.set.
local erase_all_lines = function()
  vim.api.nvim_buf_set_lines(0, 0, -1, false, {})
end
map('n', '<Space>k', erase_all_lines, { desc = 'Erase all' })

map('n', '<Space>x', ':bdelete<cr>', { desc = 'Close' })

map('n', '<Space>e', '<cmd>NeoTreeFloat<cr>', { desc = 'Explorer' })

map('n', 'K', "<cmd>Lspsaga hover_doc<CR>", { desc = 'Docs' })

local telescope_present, _ = pcall(require, "telescope")
if telescope_present then
  map('n', '<Space>f', function()
    keymenu.open_window('<Space>f')
  end, { desc = 'Telescope' })
  map('n', '<Space>fw', function()
    require("telescope.builtin").live_grep()
  end, { desc = 'Search word' })
  map('n', '<Space>ff', function()
    require("telescope.builtin").find_files()
  end, { desc = 'Search files' })
  map('n', '<Space>fh', function()
    require("telescope.builtin").oldfiles()
  end, { desc = 'Search history' })
  map('n', '<Space>fb', function()
    require("telescope.builtin").buffers()
  end, { desc = 'Search buffers' })
  map('n', '<Space>fs', function()
      require("telescope.builtin").lsp_document_symbols()
  end, { desc = 'Search symbols' })
  map("n", "<Space>fd", function()
    require("telescope.builtin").diagnostics()
  end, { desc = "Search diagnostics" })
end

-- Git
map('n', '<Space>g', function()
  keymenu.open_window('<Space>g')
end, { desc = 'Git' })
map("n", "<Space>gt", function()
  require("telescope.builtin").git_status()
end, { desc = "Git status" })
map("n", "<Space>gb", function()
  require("telescope.builtin").git_branches()
end, { desc = "Git branchs" })
map("n", "<Space>gc", function()
  require("telescope.builtin").git_commits()
end, { desc = "Git commits" })

-- Terminal
local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function()
  local float = Terminal:new({ direction = "float" })
  return float:toggle()
end
local toggle_lazygit = function()
  local lazygit = Terminal:new({ cmd = 'lazygit', direction = "float" })
  return lazygit:toggle()
end

local toggle_htop = function()
  local htop = Terminal:new({ cmd = 'htop', direction = "float" })
  return htop:toggle()
end

local toggle_node = function()
  local htop = Terminal:new({ cmd = 'node', direction = "float" })
  return htop:toggle()
end

map('n', '<Space>t', function()
  keymenu.open_window('<Space>t')
end, { desc = 'Terminal' })
map('n', '<Space>tf', toggle_float, { desc = 'Float' })
map('n', '<Space>tl', toggle_lazygit, { desc = 'LazyGit' })
map('n', '<Space>th', toggle_htop, { desc = 'Htop' })
map('n', '<Space>tn', toggle_node, { desc = 'Node' })

map('n', '<Space>l', function()
  keymenu.open_window('<Space>l')
end, { desc = 'LSP' })
map('n', '<Space>lk', "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = 'Help' })
map('n', '<Space>lw', "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", { desc = 'Add workspace' })
map('n', '<Space>lW', "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", { desc = 'Remove workspace' })
map('n', '<Space>ll', "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
  { desc = 'List workspace' })
map('n', '<Space>lt', "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = 'Type definition' })
map('n', '<Space>ld', "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = 'Go To Definition' })
map('n', '<Space>lr', "<cmd>Lspsaga lsp_finder<cr>", { desc = 'References' })
map('n', '<Space>lf', "<cmd>lua vim.lsp.buf.format()<cr>", { desc = 'Format' })
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
