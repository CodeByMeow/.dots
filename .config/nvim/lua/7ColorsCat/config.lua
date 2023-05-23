local M = {}

M.icons = {
    diagnostics = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " ",
    },
    git = {
        added = " ",
        modified = " ",
        removed = " ",
    },
    kind = {
        ["File"] = { ' ', 'Tag' },
        ["Module"] = { ' ', 'Exception' },
        ["Namespace"] = { '👾 ', 'Include' },
        ["Package"] = { '📦 ', 'Label' },
        ["Class"] = { '  ', 'Include' },
        ["Method"] = { ' ', 'Function' },
        ["Property"] = { '🔫 ', '@property' },
        ["Field"] = { ' ', '@field' },
        ["Constructor"] = { '🏗️ ', '@constructor' },
        ["Enum"] = { '🚦 ', '@number' },
        ["Interface"] = { '🏭 ', 'Type' },
        ["Function"] = { '🎒 ', 'Function' },
        ["Variable"] = { '⛺ ', '@variable' },
        ["Constant"] = { '💎 ', 'Constant' },
        ["String"] = { '  ', 'String' },
        ["Number"] = { '  ', 'Number' },
        ["Boolean"] = { '🪤 ', 'Boolean' },
        ["Array"] = { '  ', 'Type' },
        ["Object"] = { '  ', 'Type' },
        ["Key"] = { '🔑 ', '' },
        ["Null"] = { ' ' },
        ["EnumMember"] = { '🚦', 'Number' },
        ["Struct"] = { '🚧 ', 'Number' },
        ["Event"] = { '🎉 ', 'Constant' },
        ["Operator"] = { '🌐 ', 'Operator' },
        ["TypeParameter"] = { 'T📥 ', 'Type' },
        ["TypeAlias"] = { 'T ', 'Type' },
        ["Parameter"] = { '📥 ', '@parameter' },
        ["StaticMethod"] = { '🥶 ', 'Function' },
        ["Macro"] = { '🪄', 'Macro' },
        ["Text"] = { '📔 ', 'String' },
        ["Snippet"] = { '  ', '@variable' },
        ["Folder"] = { ' ', '@parameter' },
        ["Unit"] = { '綠', 'Number' },
        ["Value"] = { ' ', '@variable' },
    }
}

return M
