local status, rose = pcall(require, 'rose-pine');
if not status then return end

rose.setup({
    --- @usage 'main' | 'moon'
    dark_variant = 'moon',
})

local st, _ = pcall(vim.cmd, "colorscheme rose-pine")
if not st then
    print('Colorscheme not found!')
    return
end
