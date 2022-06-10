local status_ok, cursorline = pcall(require, "nvim-cursorline")
if status_ok then
  cursorline.setup {
    cursorline = {
      enable = true,
      timeout = 1000,
      number = false,
    },
    cursorword = {
      enable = true,
      min_length = 3,
      hl = { underline = true },
    }
  }
end
