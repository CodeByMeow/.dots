local status, icon = pcall(require, 'icon-picker')
if (not status) then return end

icon.setup({
  disable_legacy_commands = true
})

local opts = { noremap = true, silent = true }

vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
