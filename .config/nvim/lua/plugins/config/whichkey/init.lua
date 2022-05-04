local wk = require("which-key")
wk.setup {
  plugins = {
    marks = false,
    registers = false,
    spelling = { enabled = true, suggestions = 20 },
    presets = { operators = false, motions = false, text_objects = false, windows = false, nav = false, z = false, g = false }
  }
}
local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function()
  local float = Terminal:new({ direction = "float" })
  return float:toggle()
end
local toggle_lazygit = function()
  local lazygit = Terminal:new({ cmd = 'lazygit', direction = "float" })
  return lazygit:toggle()
end
local mappings = {
  q = { ":q<cr>", "Quit" },
  Q = { ":wq<cr>", "Save & Quit" },
  w = { ":w<cr>", "Save" },
  x = { ":bdelete<cr>", "Close" },
  f = { ":Telescope find_files<cr>", "Telescope Find Files" },
  r = { ":Telescope live_grep<cr>", "Telescope Live Grep" },
  o = { ":Telescope oldfiles<cr>", "Telescope Old Files" },
  i = { ":Telescope media_files<cr>", "Telescope Media files" },
  b = { ":Telescope buffers<cr>", "Telescope Buffer" },
  e = { ":NeoTreeFloat<cr>", "Toggle Float" },
  s = { ":SymbolsOutline<cr>", "Toggle SymbolsOutline" },
  t = {
    name = "Terminal",
    t = { ":ToggleTerm<cr>", "Split Below" },
    f = { toggle_float, "Floating Terminal" },
    l = { toggle_lazygit, "LazyGit" }
  },
  l = {
    name = "LSP",
    i = { ":LspInfo<cr>", "Connected Language Servers" },
    k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
    K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
    w = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', "Add Workspace Folder" },
    W = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', "Remove Workspace Folder" },
    l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', "List Workspace Folders" },
    t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', "Type Definition" },
    d = { '<cmd>lua vim.lsp.buf.definition()<cr>', "Go To Definition" },
    D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', "Go To Declaration" },
    r = { '<cmd>lua vim.lsp.buf.references()<cr>', "References" },
    f = { '<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>', "Formatting File" },
    R = { '<cmd>Lspsaga rename<cr>', "Rename" },
    a = { '<cmd>Lspsaga code_action<cr>', "Code Action" },
    e = { '<cmd>Lspsaga show_line_diagnostics<cr>', "Show Line Diagnostics" },
    n = { '<cmd>Lspsaga diagnostic_jump_next<cr>', "Go To Next Diagnostic" },
    N = { '<cmd>Lspsaga diagnostic_jump_prev<cr>', "Go To Previous Diagnostic" },
    p = { '<cmd>Lspsaga preview_definition<cr>', "Preview Definition" },
  },
  z = {
    name = "Focus Mode",
    z = { ":ZenMode<cr>", "Zen Mode" },
    t = { ":Twilight<cr>", "Twilight" },
  },
  ["1"] = { '<cmd>BufferLineGoToBuffer 1<cr>', "Go To Buf 1" },
  ["2"] = { '<cmd>BufferLineGoToBuffer 2<cr>', "Go To Buf 2" },
  ["3"] = { '<cmd>BufferLineGoToBuffer 3<cr>', "Go To Buf 3" },
  ["4"] = { '<cmd>BufferLineGoToBuffer 4<cr>', "Go To Buf 4" },
  p = {
    name = "Packer",
    r = { ":PackerClean<cr>", "Remove Unused Plugins" },
    c = { ":PackerCompile profile=true<cr>", "Recompile Plugins" },
    i = { ":PackerInstall<cr>", "Install Plugins" },
    p = { ":PackerProfile<cr>", "Packer Profile" },
    s = { ":PackerSync<cr>", "Sync Plugins" },
    S = { ":PackerStatus<cr>", "Packer Status" },
    u = { ":PackerUpdate<cr>", "Update Plugins" }
  }
}

local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
