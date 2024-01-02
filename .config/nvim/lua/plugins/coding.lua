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
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
        opts = {
            enable_autocmd = false,
        },
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
    -- GPT
    {
        "james1236/backseat.nvim",
        config = function()
            require("backseat").setup({
                -- Alternatively, set the env var $OPENAI_API_KEY by putting "export OPENAI_API_KEY=sk-xxxxx" in your ~/.bashrc
                openai_api_key = vim.env.OPENAI_API_KEY, -- Get yours from platform.openai.com/account/api-keys
                openai_model_id = 'gpt-3.5-turbo',       --gpt-4 (If you do not have access to a model, it says "The model does not exist")
                -- language = 'english', -- Such as 'japanese', 'french', 'pirate', 'LOLCAT'
                -- split_threshold = 100,
                -- additional_instruction = "Respond snarkily", -- (GPT-3 will probably deny this request, but GPT-4 complies)
                -- highlight = {
                --     icon = '', -- ''
                --     group = 'Comment',
                -- }
            })
        end
    },
}
