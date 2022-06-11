local M = {}

local aerial = require('aerial')

local function format_symbols(symbols, depth, separator, icons_enabled)
  local parts = {}
  depth = depth or #symbols

  if depth > 0 then
    symbols = { table.unpack(symbols, 1, depth) }
  else
    symbols = { table.unpack(symbols, #symbols + 1 + depth) }
  end

  for _, symbol in ipairs(symbols) do
    if icons_enabled then
      table.insert(parts, string.format("%s %s", symbol.icon, symbol.name))
    else
      table.insert(parts, symbol.name)
    end
  end

  return table.concat(parts, separator)
end

M.winbar = function()
  local symbols = aerial.get_location(true)
  local symbol_path = format_symbols(symbols, nil, '  ', true)
  local file_path = vim.api.nvim_eval_statusline('%f', {}).str
  file_path = file_path:gsub('/', '  ')

  return file_path .. "  " .. (symbol_path == "" and "..." or symbol_path)
end

vim.o.winbar = "%{%v:lua.require('core.utils.winbar').winbar()%}"

return M
