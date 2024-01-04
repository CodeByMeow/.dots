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
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local icons = require('config.icons').diagnostics
            local CodeGPTModule = require("codegpt")
            local auto_theme_custom = require('lualine.themes.auto')
            local branch_max_width = 40
            local branch_min_width = 10
            auto_theme_custom.normal.c.bg = "NONE"
            require('lualine').setup {
                options = {
                    theme = auto_theme_custom
                },
                sections = {
                    lualine_a = { 'mode',
                        {
                            "branch",
                            fmt = function(output)
                                local win_width = vim.o.columns
                                local max = branch_max_width
                                if win_width * 0.25 < max then
                                    max = math.floor(win_width * 0.25)
                                end
                                if max < branch_min_width then
                                    max = branch_min_width
                                end
                                if max % 2 ~= 0 then
                                    max = max + 1
                                end
                                if output:len() >= max then
                                    return output:sub(1, (max / 2) - 1)
                                        .. "..."
                                        .. output:sub(-1 * ((max / 2) - 1), -1)
                                end
                                return output
                            end,
                        },
                    },
                    lualine_b = { 'diff' },
                    lualine_c = {
                        'filename',
                        { 'diagnostics', symbols = { error = icons.Error, warn = icons.Warn, info = icons.Info, hint = icons.Hint }, }
                    },
                    lualine_x = {
                        CodeGPTModule.get_status,
                        {
                            function()
                                local lsps = vim.lsp.get_clients()
                                local icon = require("nvim-web-devicons").get_icon_by_filetype(
                                    vim.bo.filetype
                                )
                                if lsps and #lsps > 0 then
                                    local names = {}
                                    for _, lsp in ipairs(lsps) do
                                        table.insert(names, lsp.name)
                                    end
                                    return string.format("%s %s", table.concat(names, ", "), icon)
                                else
                                    return icon or ""
                                end
                            end,
                            on_click = function()
                                vim.api.nvim_command("LspInfo")
                            end,
                            color = function()
                                local _, color = require("nvim-web-devicons").get_icon_cterm_color_by_filetype(
                                    vim.bo.filetype
                                )
                                return { fg = color }
                            end,
                        } },
                    lualine_y = { 'encoding', 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
            }
        end
    },
    -- DIANOGTIC HELP
    { "https://git.sr.ht/~whynothugo/lsp_lines.nvim", config = true },
    -- WIN VIEW
    "sunjon/shade.nvim",
    -- HIGHLIGHT COLOR
    {
        "NvChad/nvim-colorizer.lua",
        event = { "BufReadPre", "BufNewFile" },
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
    -- FILENAME
    {
        "b0o/incline.nvim",
        dependencies = { "craftzdog/solarized-osaka.nvim" },
        event = "BufReadPre",
        priority = 1200,
        config = function()
            local colors = require("solarized-osaka.colors").setup()
            require("incline").setup({
                highlight = {
                    groups = {
                        InclineNormal = { guibg = colors.base0, guifg = colors.base04 },
                        InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
                    },
                },
                window = { margin = { vertical = 0, horizontal = 1 } },
                hide = {
                    cursorline = true,
                },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                    if vim.bo[props.buf].modified then
                        filename = "[+] " .. filename
                    end

                    local icon, color = require("nvim-web-devicons").get_icon_color(filename)
                    return { { icon, guifg = color }, { " " }, { filename } }
                end,
            })
        end,
    },
}
