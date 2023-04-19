local blankline = require('indent_blankline')

vim.opt.list = true

blankline.setup {
    show_current_context = true,
    show_end_of_line = true,
}
