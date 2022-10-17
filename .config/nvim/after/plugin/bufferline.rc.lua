local status, bufferline = pcall(require, "bufferline")

if (not status) then return end

local nnoremap = require("katinbox.keymap").nnoremap;

bufferline.setup {
    options = {
        separator_style = 'slant',
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
        buffer_close_icon = " ",
        modified_icon = "⏺",
        close_icon = " ",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
    },
}
nnoremap("<S-TAB>", "<cmd>BufferLineCyclePrev<CR>")
nnoremap("<TAB>", "<cmd>BufferLineCycleNext<CR>")
