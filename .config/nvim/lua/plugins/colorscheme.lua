 return {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup {
                dim_inactive = true,
                transparent_mode = true,
            }
            vim.cmd("colorscheme gruvbox")
        end
    }
    
