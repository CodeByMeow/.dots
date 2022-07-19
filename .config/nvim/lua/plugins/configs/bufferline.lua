local present, bufferline = pcall(require, "bufferline")

if not present then
    return
end

local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }
map("n", "<TAB>", "<cmd>BufferLineCycleNext<CR>", opts)
map("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<CR>", opts)

local options = {
    options = {
        offsets = {
            { filetype = "NvimTree", text = "", padding = 1 },
            { filetype = "neo-tree", text = "", padding = 1 },
            { filetype = "Outline", text = "", padding = 1 },
        },
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        max_name_length = 14,
        max_prefix_length = 13,
        -- tab_size = 20,
        separator_style = "slant",
    },
}

bufferline.setup(options)
