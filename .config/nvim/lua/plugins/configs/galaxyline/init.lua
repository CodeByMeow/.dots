local gl    = require("galaxyline")
local iconz = require("nvim-nonicons")
local gls   = gl.section

gl.short_line_list = { 'plug', 'fugitive', 'NvimTree', 'vista', 'dbui', 'packer', 'startify', 'neo-tree' }

local icons = { sep = {
  right = "",
  left = ""
},
diagnostic = {
  -- error = " ",
  error = iconz.get("x-circle-fill"),
  -- warn = " ",
  warn = iconz.get("alert"),
  -- info = " "
  info = iconz.get("info")
},
diff = { added = iconz.get("diff-added"),
  modified = iconz.get("diff-modified"), removed = iconz.get("diff-removed"),
  -- add = " ",
  -- modified = " ",
  -- remove = " "
},
git = iconz.get("git-branch"),
line_nr = iconz.get("list-ordered"),
file = {
  read_only = '',
  -- modified = '⨁ ',
  -- modified = '✎',
  modified = iconz.get("pencil"),
},
normal = iconz.get("vim-normal-mode"),
insert = iconz.get("vim-insert-mode"),
command = iconz.get("vim-command-mode"),
visual = iconz.get("vim-visual-mode"),
replace = iconz.get("vim-replace-mode"),
selection = iconz.get("vim-select-mode"),
terminal = iconz.get("terminal"),
visual_block = iconz.get("field")
-- terminal  = iconz.get("vim-terminal-mode")
}

local colors = {
  main          = "#ff87ff",
  bg_alt        = "#0B0C15",
  main_bg       = "#262626",
  lightbg       = "#21252B",
  commented     = "#5c6370",
  grey          = "#3c4048",
  line_bg       = "#282c34",
  creamydark    = "#282c34",
  purple        = "#252930",
  cyan          = "#00FFFF",
  nord          = "#81A1C1",
  lightblue     = "#81a1c1",
  darkblue      = "#61afef",
  blue          = "#61afef",
  limegreen     = "#bbe67e",
  green         = "#7ed491",
  fg_green      = "#65a380",
  creamygreen   = "#a3be8c",
  yellow        = "#cccc00",
  creamyorange  = "#ff8800",
  orange        = "#FF8800",
  bg            = "#0B0C15",
  fg            = "#D8DEE9",
  magenta       = "#c678dd",
  red           = "#df8890",
  crimsonRed    = "#990000",
  crimsonRed2   = "#ff4d4d",
  greenYel      = "#EBCB8B",
  white         = "#d8dee9",
  brown         = "#91684a",
  teal          = '#23D4AC',
  blue2         = '#5c5c81',
  icon_inactive = '#9896AA'
}

local mode_map = {
  -- n      = {" NORMAL  ", colors.red},
  -- i      = {" INSERT  ", colors.green},
  -- c      = {" COMMAND ", colors.orange},
  -- v      = {" VISUAL  ", colors.lightblue},
  n      = { icons.normal .. "  NORMAL  ", colors.darkblue },
  no     = { icons.normal .. "  NORMAL  ", colors.darkblue },
  i      = { icons.insert .. "  INSERT  ", colors.green },
  ic     = { icons.insert .. "  INSERT  ", colors.green },
  c      = { icons.command .. "  COMMAND ", colors.orange },
  ce     = { icons.command .. "  COMMAND ", colors.orange },
  cv     = { icons.command .. "  COMMAND ", colors.orange },
  v      = { icons.visual .. "  VISUAL  ", colors.lightblue },
  V      = { icons.visual .. "  VISUAL  ", colors.lightblue },
  [""]  = { icons.visual .. "  VISUAL" .. icons.visual_block .. " ", colors.brown },
  R      = { icons.replace .. "  REPLACE ", colors.crimsonRed2 },
  ['r?'] = { icons.replace .. "  REPLACE ", colors.lightblue },
  Rv     = { icons.replace .. "  REPLACE ", colors.crimsonRed2 },
  r      = { icons.replace .. "  REPLACE ", colors.blue2 },
  rm     = { icons.replace .. "  REPLACE ", colors.blue2 },
  s      = { icons.selection .. "  SELECT  ", colors.greenYelenYel },
  S      = { icons.selection .. "  SELECT  ", colors.greenYelenYel },
  ['']  = { icons.selection .. "  SELECT  ", colors.greenYelenYel },
  t      = { icons.terminal .. "  TERMINAL ", colors.magenta },
  ['!']  = { "  !        ", colors.crimsonred }
}

----------------------------=== Funcs ===--------------------------

local function mode_label() return mode_map[vim.fn.mode()][1] or 'N/A' end

local function mode_hl() return mode_map[vim.fn.mode()][2] or colors.main end

local function highlight1(group, fg, gui)
  local cmd = string.format('highlight %s guifg=%s', group, fg)
  if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
  vim.cmd(cmd)
end

local function highlight2(group, bg, fg, gui)
  local cmd = string.format('highlight %s guibg=%s guifg=%s', group, bg, fg)
  if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
  vim.cmd(cmd)
end

local checkwidth = function()
  local squeeze_width = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

local white_space = function() return ' ' end

local check_git_width = function()
  return checkwidth() and require("galaxyline.condition").check_git_workspace()
end

local check_git_terminal_workspace = function()
  return not (vim.fn.mode() == 't') and require("galaxyline.condition").check_git_workspace()
end

----------------------------=== Components ===--------------------------

----------------------------=== Left ===--------------------------

local i = 1
gls.left[i] = {
  leftRounded = {
    provider = function()
      return "█"
    end,
    highlight = 'GalaxyViModeInv'
  }
}

i = i + 1
gls.left[i] = {
  ViMode = {
    provider = function()
      highlight2('GalaxyViMode', mode_hl(), colors.main_bg)
      highlight1('GalaxyViModeInv', mode_hl(), 'bold')
      return string.format(' %s', mode_label())
    end,
  }
}

i = i + 1
gls.left[i] = {
  WhiteSpace = {
    provider = function()
      highlight2('SecondGalaxyViMode', colors.white, mode_hl(), 'bold')
    end,
    separator = " ",
    separator_highlight = 'SecondGalaxyViMode'
  }
}

i = i + 1
gls.left[i] = {
  FileIcon = {
    provider = "FileIcon",
    separator = " ",
    separator_highlight = { colors.white, colors.white },
    highlight = { colors.creamydark, colors.white }
  }
}

i = i + 1
gls.left[i] = {
  FileName = {
    provider = "FileName",
    condition = require('galaxyline.condition').buffer_not_empty,
    highlight = { colors.creamydark, colors.white },
  }
}

i = i + 1
gls.left[i] = {
  teech = {
    provider = function()
      return ""
    end,
    separator = "",
    highlight = { colors.white, colors.main_bg }
  }
}

i = i + 1
gls.left[i] = {
  Space = {
    provider = white_space,
    highlight = { colors.bg, colors.main_bg }
  }
}


----------------------------=== Right ===--------------------------

i = 1
gls.right[i] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function()
      local tbl = { ['dashboard'] = true, [''] = true }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = ' ',
    highlight = { colors.icon_inactive, colors.main_bg, nil },
  }
}

i = i + 1
gls.right[i] = {
  rightRounded = {
    provider = function()
      return "█"
    end,
    highlight = { colors.main_bg }
  }
}

i = i + 1
gls.right[i] = {
  FileFormat = {
    provider = function() return vim.bo.filetype end,
    highlight = { colors.commented, colors.main_bg },
  }
}

i = i + 1
gls.right[i] = {
  rightRounded = {
    provider = function()
      return "█"
    end,
    highlight = { colors.main_bg }
  }
}

i = i + 1
gls.right[i] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = check_git_width,
    icon = "  " .. icons.diff.added .. " ",
    highlight = { colors.greenYel, colors.main_bg }
  }
}

i = i + 1
gls.right[i] = {
  DiffModified = {
    provider = "DiffModified",
    condition = check_git_width,
    -- icon = "  柳",
    icon = "  " .. icons.diff.modified .. " ",
    highlight = { colors.creamyorange, colors.main_bg }
  }
}

i = i + 1
gls.right[i] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = check_git_width,
    -- icon = "   ",
    icon = "  " .. icons.diff.removed .. " ",
    highlight = { colors.red, colors.main_bg }
  }
}

i = i + 1
gls.right[i] = {
  right_LeftRounded1 = {
    separator = " ",
    separator_highlight = { colors.main_bg, colors.main_bg },
    provider = function()
      return ""
    end,
    condition = require("galaxyline.condition").check_git_workspace,
    highlight = { colors.blue2, colors.main_bg }
  }
}

i = i + 1
gls.right[i] = {
  GitIcon = {
    provider = function()
      return icons.git .. ' '
    end,
    condition = check_git_terminal_workspace,
    highlight = { colors.white, colors.blue2 }
  }
}

i = i + 1
gls.right[i] = {
  GitBranch = {
    provider = "GitBranch",
    condition = require("galaxyline.condition").check_git_workspace,
    highlight = { colors.white, colors.blue2 },
  }
}

i = i + 1
gls.right[i] = {
  Space2 = {
    provider = white_space,
    condition = require("galaxyline.condition").check_git_workspace,
    highlight = { colors.blue2, colors.blue2 },
  }
}

i = i + 1
gls.right[i] = {
  right_LeftRounded = {
    provider = function()
      return ""
    end,
    highlight = function()
      if require("galaxyline.condition").check_git_workspace() then
        return { colors.grey, colors.blue2 }
      else
        return { colors.grey, colors.main_bg }
      end
    end
  }
}

i = i + 1
gls.right[i] = {
  LineInfo = {
    provider = "LineColumn",
    icon = icons.line_nr .. "  ",
    highlight = { colors.white, colors.grey }
  }
}

i = i + 1
gls.right[i] = {
  PerCent = {
    provider = "LinePercent",
    separator = " ",
    separator_highlight = { colors.white, colors.grey },
    highlight = { colors.white, colors.grey }
  }
}
