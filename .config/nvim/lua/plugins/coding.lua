return {
    -- Better increase/descrease
    {
        "monaqa/dial.nvim",
        -- stylua: ignore
        keys = {
            { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
            { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
        },
        config = function()
            local augend = require("dial.augend")
            require("dial.config").augends:register_group({
                default = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.date.alias["%d/%m/%Y"],
                    augend.constant.alias.bool,
                    augend.semver.alias.semver,
                    augend.constant.new({ elements = { "let", "const" } }),
                },
            })
        end,
    },
    -- Refactoring tool
    {
        "ThePrimeagen/refactoring.nvim",
        keys = {
            {
                "<leader>r",
                function()
                    require("refactoring").select_refactor()
                end,
                mode = "v",
                noremap = true,
                silent = true,
                expr = false,
            },
        },
    },
    -- AI GPT
    {
        "james1236/backseat.nvim",
        config = function()
            require("backseat").setup({
                openai_api_key = vim.env.OPENAI_API_KEY,
                openai_model_id = 'gpt-3.5-turbo',
            })
        end,
        lazy = true,
    },
    {
        "dpayne/CodeGPT.nvim",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
        },
        config = function()
            require("codegpt.config")
        end,
        lazy = true
    },
    -- CODEIUM
    {
        "Exafunction/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({})
        end,
        event = "BufEnter",
        lazy = true
    },
}
