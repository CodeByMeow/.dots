return {
    "echasnovski/mini.nvim",
    version = false,
    lazy = false,
    config = function()
        require("mini.pick").setup()
        require("mini.basics").setup()
        require("mini.bufremove").setup()
        require("mini.comment").setup({
            options = {
                custom_commentstring = function()
                    return require("ts_context_commentstring.internal").calculate_commentstring()
                        or vim.bo.commentstring
                end,
            },
        })
        require("mini.cursorword").setup()
        require("mini.tabline").setup()
        require("mini.indentscope").setup({
            symbol = "│",
            options = { try_as_border = true },
        })
        require("mini.files").setup({
            content = {
                filter = function(fs_entry)
                    if fs_entry.fs_type == "directory" and fs_entry.name == "node_modules" then
                        return false
                    end

                    return true
                end,
            },
            mappings = {
                go_in = "i",
                go_in_plus = "I",
                synchronize = "<leader>w",
            },
        })
        require("mini.hipatterns").setup({
            highlighters = {
                fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
                hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
                warn = { pattern = "%f[%w]()WARN()%f[%W]", group = "MiniHipatternsHack" },
                todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
                note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
                hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
            },
        })
        require("mini.move").setup({
            mappings = {
                -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
                left = "<M-h>",
                right = "<M-i>",
                down = "<M-n>",
                up = "<M-e>",

                -- Move current line in Normal mode
                line_left = "<M-h>",
                line_right = "<M-i>",
                line_up = "<M-u>",
                line_down = "<M-d>",
            },
        })
    end,
    keys = {
        {
            "<leader>f",
            function()
                vim.cmd("Pick files")
            end,
        },
        {
            "<leader>l",
            function()
                vim.cmd("Pick grep_live")
            end,
        },
        {
            "<leader>b",
            function()
                vim.cmd("Pick buffers")
            end,
        },
        {
            "<leader>h",
            function()
                vim.cmd("Pick help")
            end,
        },
        {
            "<leader>o",
            function()
                vim.cmd(":lua MiniFiles.open()")
            end,
        },
    },
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "Trouble",
                "trouble",
                "lazy",
                "mason",
                "notify",
                "toggleterm",
                "lazyterm",
            },
            callback = function()
                vim.b.miniindentscope_disable = true
            end,
        })
    end,
}
