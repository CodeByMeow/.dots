---@diagnostic disable: undefined-global
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_preview_command = 'cat'
vim.g.dashboard_preview_pipeline = 'lolcat'
vim.g.dashboard_preview_file = "~/.config/nvim/lua/plugins/configs/dashboard/neovim.cat"
vim.g.dashboard_preview_file_height = 12
vim.g.dashboard_preview_file_width = 80
vim.g.dashboard_custom_section = {
  a = { description = { '  Recent Files' }, command = 'Telescope oldfiles' },
  b = { description = { '  Find File' }, command = 'Telescope find_files' },
}
vim.cmd("let packages = len(globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))")

vim.api.nvim_exec([[
    let g:dashboard_custom_footer = ['Neovim loaded '..packages..' packages  ']
]], false)

vim.api.nvim_exec(
  [[ autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2 ]]
  , false)
