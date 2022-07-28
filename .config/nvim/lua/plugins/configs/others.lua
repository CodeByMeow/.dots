local M = {}

M.blankline = function()
    local present, blankline = pcall(require, "indent_blankline")

    if not present then
        return
    end

    local options = {
        indentLine_enabled = 1,
        buftype_exclude = {
            "nofile",
            "terminal",
            "lsp-installer",
            "lspinfo",
        },
        filetype_exclude = {
            "help",
            "startify",
            "aerial",
            "alpha",
            "dashboard",
            "packer",
            "neogitstatus",
            "NvimTree",
            "neo-tree",
            "Trouble",
        },
        context_patterns = {
            "class",
            "return",
            "function",
            "method",
            "^if",
            "^while",
            "jsx_element",
            "^for",
            "^object",
            "^table",
            "block",
            "arguments",
            "if_statement",
            "else_clause",
            "jsx_element",
            "jsx_self_closing_element",
            "try_statement",
            "catch_clause",
            "import_statement",
            "operation_type",
        },
        show_trailing_blankline_indent = false,
        use_treesitter = true,
        char = "▏",
        context_char = "▏",
        show_current_context = true,
    }

    blankline.setup(options)
end

M.gitsigns = function()
    local present, gitsigns = pcall(require, "gitsigns")

    if not present then
        return
    end

    local options = {
        signs                        = {
            add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
            change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
            delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
            topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
            changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
        },
        signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir                 = {
            interval = 1000,
            follow_files = true
        },
        attach_to_untracked          = true,
        current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil, -- Use default
        max_file_length              = 40000, -- Disable if file is longer than this (in lines)
        preview_config               = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        },
        yadm                         = {
            enable = false
        }
    }

    gitsigns.setup(options)
end

M.comment = function()
    local present, nvim_comment = pcall(require, "Comment")

    if not present then
        return
    end

    local options = {}
    nvim_comment.setup(options)
end

M.fidget = function()
    local present, fidget = pcall(require, "fidget")
    if not present then
        return
    end
    local options = {
        text = {
            spinner = "pipe", -- animation shown when tasks are ongoing
            done = "✔", -- character shown when all tasks are complete
            commenced = "Started", -- message shown when task starts
            completed = "Completed", -- message shown when task completes
        },
        align = {
            bottom = true, -- align fidgets along bottom edge of buffer
            right = true, -- align fidgets along right edge of buffer
        },
        timer = {
            spinner_rate = 125, -- frame rate of spinner animation, in ms
            fidget_decay = 2000, -- how long to keep around empty fidget, in ms
            task_decay = 1000, -- how long to keep around completed task, in ms
        },
        window = {
            relative = "win", -- where to anchor, either "win" or "editor"
            blend = 100, -- &winblend for the window
            zindex = nil, -- the zindex value for the window
        },
        fmt = {
            leftpad = true, -- right-justify text in fidget box
            stack_upwards = true, -- list of tasks grows upwards
            max_width = 0, -- maximum width of the fidget box
            fidget = -- function to format fidget title
            function(fidget_name, spinner)
                return string.format("%s %s", spinner, fidget_name)
            end,
            task = -- function to format each task line
            function(task_name, message, percentage)
                return string.format(
                    "%s%s [%s]",
                    message,
                    percentage and string.format(" (%s%%)", percentage) or "",
                    task_name
                )
            end,
        },
    }

    fidget.setup(options)
end

return M
