---@diagnostic disable: undefined-global
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_preview_command = 'cat'
vim.g.dashboard_preview_pipeline = 'lolcat'
vim.g.dashboard_preview_file = "~/.config/nvim/lua/plugins/config/dashboard/neovim.cat"
vim.g.dashboard_preview_file_height = 12
vim.g.dashboard_preview_file_width = 80
vim.g.dashboard_custom_section = {
  a = { description = { '  Find File          ' }, command = 'Telescope find_files' },
  b = { description = { '  Recent Files       ' }, command = 'Telescope oldfiles' },
}
vim.cmd("let packages = len(globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))")

vim.api.nvim_exec([[
    let g:dashboard_custom_footer = ['Neovim loaded '..packages..' packages  ']
]], false)
