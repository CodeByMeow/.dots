local status, autopair = pcall(require, 'nvim-autopairs')
if (not status) then return end

autopair.setup{
  disable_filetype = { 'Telescope', 'vim' }
}
