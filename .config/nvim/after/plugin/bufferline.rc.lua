local status, bufferline = pcall(require, "bufferline")

if (not status) then return end

local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

map("n", "<TAB>", "<cmd>BufferLineCycleNext<CR>", opts)
map("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<CR>", opts)

bufferline.setup {
    options = {
        offsets = {
            { filetype = "NvimTree", text = "", padding = 1 },
            { filetype = "neo-tree", text = "", padding = 1 },
            { filetype = "Outline",  text = "", padding = 1 },
        },
        buffer_close_icon = "x",
        modified_icon = " ",
        close_icon = "x",
        max_name_length = 14,
        max_prefix_length = 13,
    },
}
