local blankline = require('indent_blankline')

vim.opt.list = true
vim.opt.listchars:append "eol:↴"

blankline.setup {
    show_current_context = true,
    show_end_of_line = true,
}
