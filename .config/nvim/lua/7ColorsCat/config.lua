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
        ['File'] = { ' ', 'Tag' },
        ['Module'] = { ' ', 'Exception' },
        ['Namespace'] = { ' ', 'Include' },
        ['Package'] = { ' ', 'Label' },
        ['Class'] = { ' ', 'Include' },
        ['Method'] = { ' ', 'Function' },
        ['Property'] = { ' ', '@property' },
        ['Field'] = { ' ', '@field' },
        ['Constructor'] = { ' ', '@constructor' },
        ['Enum'] = { ' ', '@number' },
        ['Interface'] = { ' ', 'Type' },
        ['Function'] = { ' ', 'Function' },
        ['Variable'] = { ' ', '@variable' },
        ['Constant'] = { ' ', 'Constant' },
        ['String'] = { ' ', 'String' },
        ['Number'] = { ' ', 'Number' },
        ['Boolean'] = { ' ', 'Boolean' },
        ['Array'] = { ' ', 'Type' },
        ['Object'] = { ' ', 'Type' },
        ['Key'] = { ' ', 'Constant' },
        ['Null'] = { ' ', 'Constant' },
        ['EnumMember'] = { ' ', 'Number' },
        ['Struct'] = { ' ', 'Type' },
        ['Event'] = { ' ', 'Constant' },
        ['Operator'] = { ' ', 'Operator' },
        ['TypeParameter'] = { ' ', 'Type' },
        -- ccls
        ['TypeAlias'] = { ' ', 'Type' },
        ['Parameter'] = { ' ', '@parameter' },
        ['StaticMethod'] = { ' ', 'Function' },
        ['Macro'] = { ' ', 'Macro' },
        -- for completion sb microsoft!!!
        ['Text'] = { ' ', 'String' },
        ['Snippet'] = { ' ', '@variable' },
        ['Folder'] = { ' ', 'Title' },
        ['Unit'] = { ' ', 'Number' },
        ['Value'] = { ' ', '@variable' },
    }
}

return M
