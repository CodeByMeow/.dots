local present, aerial = pcall(require, "aerial")
if not present then
  return
end

local options = {
  close_behavior = "global",
  backends = { "lsp", "treesitter", "markdown" },
  min_width = 28,
  show_guides = true,
  filter_kind = false,
  icons = {
    Array = "",
    Boolean = "⊨",
    Class = "",
    Constant = "",
    Constructor = "",
    Key = "",
    Function = "󰊕",
    Method = "",
    Namespace = "",
    Null = "NULL",
    Number = "#",
    Object = "⦿",
    Property = "",
    TypeParameter = "𝙏",
    Variable = "",
    Enum = "ℰ",
    Package = "",
    EnumMember = "",
    File = "",
    Module = "",
    Field = "󰽏",
    Interface = "",
    String = "𝓐",
    Struct = "𝓢",
    Event = "󰛢",
    Operator = "󰆖",
  },
  guides = {
    mid_item = "├ ",
    last_item = "└ ",
    nested_top = "│ ",
    whitespace = "  ",
  },
}

aerial.setup(options)
