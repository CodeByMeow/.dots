_G.katvim = {}

function katvim.vim_opts(options)
  for scope, table in pairs(options) do
    for setting, value in pairs(table) do
      vim[scope][setting] = value
    end
  end
end

function katvim.is_available(plugin)
  return packer_plugins ~= nil and packer_plugins[plugin] ~= nil
end

return katvim
