local gl = require('galaxyline')
local condition = require('galaxyline.condition')

-- onedark
local colors = {
  bg = '#282828',
  bg_dim = '#3C3836',
  bg_light = '#444b59',
  black = '#222222',
  white = '#abb2bf',
  gray = '#868c96',
  orange = '#D65D0E',
  green = '#A9B665',
  yellow = '#d79921',
  blue = '#458588',
  cyan = '#689d6a',
  teal = '#56b6c2',
  red = '#EC98A0',
}

local function mode_alias(m)
  local alias = {
    n = ' NORMAL',
    i = ' INSERT',
    c = ' COMMAND',
    R = ' REPLACE',
    t = ' TERMINAL',
    [''] = ' V-BLOCK',
    V = ' V-LINE',
    v = ' VISUAL',
  }

  return alias[m] or ''
end

local function mode_color(m)
  local mode_colors = {
    normal = colors.green,
    insert = colors.blue,
    visual = colors.cyan,
    replace = colors.orange,
  }

  local color = {
    n = mode_colors.normal,
    i = mode_colors.insert,
    c = mode_colors.replace,
    R = mode_colors.replace,
    t = mode_colors.insert,
    [''] = mode_colors.visual,
    V = mode_colors.visual,
    v = mode_colors.visual,
  }

  return color[m] or colors.bg_light
end

-- disable for these file types
gl.short_line_list = { 'startify', 'term', 'fugitive', 'neo-tree' }

gl.section.left[1] = {
  ViMode = {
    icon = '   ',
    separator = ' ',
    separator_highlight = function()
      local m = vim.fn.mode() or vim.fn.visualmode()
      local color = mode_color(m)
      return { color, colors.bg_light }
    end,
    highlight = { colors.bg, mode_color() },
    provider = function()
      local m = vim.fn.mode() or vim.fn.visualmode()
      local mode = mode_alias(m)
      local color = mode_color(m)
      vim.api.nvim_command('hi GalaxyViMode guibg=' .. color)
      vim.api.nvim_command('hi GalaxyViModeReverse guifg=' .. color)
      return ' ' .. mode .. ' '
    end,
  }
}

gl.section.left[2] = {
  CWD = {
    separator = ' ',
    separator_highlight = function()
      return { colors.bg_light, condition.buffer_not_empty() and colors.bg_dim or colors.bg }
    end,
    highlight = { colors.white, colors.bg_light },
    provider = function()
      local dirname = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
      return ' ' .. dirname .. ' '
    end,
  },
}

gl.section.left[3] = {
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = { colors.gray, colors.bg_dim },
  }
}

gl.section.left[4] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = { colors.gray, colors.bg_dim },
    separator_highlight = { colors.bg_dim, colors.bg },
    separator = '',
  },
}

gl.section.left[5] = {
  DiffAdd = {
    icon = '  ',
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    highlight = { colors.green, colors.bg },
  }
}

gl.section.left[6] = {
  DiffModified = {
    icon = '  ',
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    highlight = { colors.yellow, colors.bg },
  }
}

gl.section.left[7] = {
  DiffRemove = {
    icon = '  ',
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    highlight = { colors.red, colors.bg },
  }
}

gl.section.right[1] = {
  GitBranch = {
    icon = ' ',
    separator = ' ',
    condition = condition.check_git_workspace,
    highlight = { colors.green, colors.bg_dim },
    separator_highlight = { colors.bg_dim, colors.bg },
    provider = 'GitBranch',
  }
}

gl.section.right[2] = {
  FileLocation = {
    icon = ' ',
    separator = ' ',
    separator_highlight = { colors.bg_light, colors.bg_dim },
    highlight = { colors.gray, colors.bg_light },
    provider = function()
      local current_line = vim.fn.line('.')
      local total_lines = vim.fn.line('$')

      if current_line == 1 then
        return 'Top' .. '  '
      elseif current_line == total_lines then
        return 'Bot' .. '  '
      end

      local percent, _ = math.modf((current_line / total_lines) * 100)
      return '' .. percent .. '%' .. '  '
    end,
  }
}

vim.api.nvim_command('hi GalaxyViModeReverse guibg=' .. colors.bg_dim)
