---@diagnostic disable: different-requires, duplicate-set-field
return {
    -- BASE
    { "nvim-lua/plenary.nvim", lazy = true },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        config = true,
    },
    { "MunifTanjim/nui.nvim",  lazy = true },
    -- INDENT
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = { enabled = false },
            exclude = {
                filetypes = {
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
            },
        },
        main = "ibl",
    },
    -- STATUS LINE
    {
        "tamton-aquib/staline.nvim",
        config = function()
            local git = require("config.icons").git
            local icons = require("config.icons").diagnostics

            local nicon = "NORM"
            local iicon = "INSR"
            local vicon = "VISU"
            local cicon = "COMM"
            local ricon = "REPL"
            local ticon = "TERM"

            local mode_icons = {
                ["n"] = nicon,
                ["no"] = nicon,
                ["niI"] = nicon,
                ["niR"] = nicon,
                ["no"] = nicon,
                ["niV"] = nicon,
                ["nov"] = nicon,
                ["noV"] = nicon,
                ["i"] = iicon,
                ["ic"] = iicon,
                ["ix"] = iicon,
                ["s"] = iicon,
                ["S"] = iicon,
                ["v"] = vicon,
                ["V"] = vicon,
                [""] = vicon,
                ["r"] = ricon,
                ["r?"] = ricon,
                ["c"] = cicon,
                ["t"] = ticon,
                ["!"] = ticon,
                ["R"] = ricon,
            }

            require("staline").setup({
                sections = {
                    left = { "-mode", "file_name", "branch", " ", "lsp" },
                    mid = { "lsp_name" },
                    right = { "file_size", vim.bo.fileencoding:upper(), "line_column" },
                },
                mode_icons = mode_icons,
                mode_colors = {
                    i = "#83A598",
                    n = "#928374",
                    c = "#D65D0E",
                    v = "#458588",
                },
                lsp_symbols = {
                    Error = icons.Error,
                    Info = icons.Info,
                    Warn = icons.Warn,
                    Hint = icons.Hint,
                },
                defaults = {
                    true_colors = true,
                    line_column = "[%l/%L] :%c 並%p%% ",
                    branch_symbol = " ",
                    lsp_client_symbol = "  ",
                    mod_symbol = " " .. git.modified,
                    cool_symbol = " " .. " ",
                    full_path = false,
                },
            })
        end,
    },
    -- DIANOGTIC HELP
    { "https://git.sr.ht/~whynothugo/lsp_lines.nvim", config = true },
    -- WIN VIEW
    "sunjon/shade.nvim",
    -- HIGHLIGHT COLOR
    {
        "NvChad/nvim-colorizer.lua",
        event = { "BufReadPre", "BufNewFile" },
        opts = { user_default_options = { names = false, mode = "virtualtext" } },
    },
    -- TAKE A PICTURE
    "segeljakt/vim-silicon",
    -- SCROLL SMOOTH
    { "karb94/neoscroll.nvim",                        config = true },
    -- STARTER
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        opts = function()
            local dashboard = require("alpha.themes.dashboard")
            local logo = [[
⠀⠀⠀⠀⠀⠀⠀⢀⣀⡤⠴⠶⠶⠒⠲⠦⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⡠⠞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠲⠤⣄⡀⠀⠀⠀⠀⠀
⠀⠀⣀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⡿⠀⠀⠀⠀⠀
⠀⢾⣅⡀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⢀⡦⠤⠄⠀⠀⢻⡀⠀⠀⠀⠀⠀
⠀⠈⢹⡏⠀⠀⠐⠋⠉⠁⠀⠻⢿⠟⠁⠀⠀⢤⠀⠀⠠⠤⢷⣤⣤⢤⡄⠀┏━━━━━━━━━━━━━━━━━━━━━━━━━━┓
⠀⠀⣼⡤⠤⠀⠀⠘⣆⡀⠀⣀⡼⠦⣄⣀⡤⠊⠀⠀⠀⠤⣼⠟⠀⠀⢹⡂┃ Good day, coding maestro!┃
⠀⠊⣿⡠⠆⠀⠀⠀⠈⠉⠉⠙⠤⠤⠋⠀⠀⠀⠀⠀⠀⡰⠋⠀⠀⠀⡼⠁┗━━━━━━━━━━━━━━━━━━━━━━━━━━┛
⠀⢀⡾⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠜⠁⠀⠀⠀⣸⠁⠀
⠀⠀⠀⡼⠙⠢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠃⠀⠀
⠀⢀⡞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠃⠀⠀⠀
⠀⡼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀
⣾⠁⠀⢀⣠⡴⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀
⠈⠛⠻⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀
]]
            dashboard.section.header.val = vim.split(logo, "\n")
            dashboard.section.buttons.val = {
                dashboard.button("f", " " .. " Find file", ":Pick files<CR>"),
                dashboard.button("o", " " .. " Files Manager", ":lua MiniFiles.open()<CR>"),
                dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
                dashboard.button("q", " " .. " Quit", ":qa<CR>"),
            }
            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.opts.layout[1].val = 6
            return dashboard
        end,
        config = function(_, dashboard)
            require("alpha").setup(dashboard.opts)
            vim.api.nvim_create_autocmd("User", {
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = math.floor(stats.startuptime * 100) / 100
                    local version = "   v"
                        .. vim.version().major
                        .. "."
                        .. vim.version().minor
                        .. "."
                        .. vim.version().patch
                    local plugin = "⚡ Neovim loaded "
                        .. stats.loaded
                        .. "/"
                        .. stats.count
                        .. " plugins in "
                        .. ms
                        .. "ms"
                    local footer = version .. "\t" .. plugin .. "\n"
                    dashboard.section.footer.val = footer
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })
        end,
    },
    -- MINIMAP
    {
        "gorbit99/codewindow.nvim",
        config = function()
            local codewindow = require("codewindow")
            codewindow.setup()
            codewindow.apply_default_keybinds()
        end,
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            local banned_messages = { "No information available" }
            vim.notify = function(msg, ...)
                for _, banned in ipairs(banned_messages) do
                    if msg == banned then
                        return
                    end
                end
                return require("notify")(msg, ...)
            end
        end,
    },
}
