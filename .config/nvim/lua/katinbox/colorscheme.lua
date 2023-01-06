local st, rose = pcall(require, 'rose-pine');
if not st then return end

rose.setup({
    --- @usage 'main' | 'moon'
    dark_variant = 'moon',
})

local status, _ = pcall(vim.cmd, "colorscheme rose-pine")
if not status then
    print('Colorscheme not found!')
    return
end
