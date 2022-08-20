local present, template_string = pcall(require, 'template-string')
if not present then return end

local options = {
   filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }, -- filetypes where the plugin is active
   jsx_brackets = true, -- must add brackets to jsx attributes
   remove_template_string = false, -- remove backticks when there are no template string
   restore_quotes = {
      -- quotes used when "remove_template_string" option is enabled
      normal = [[']],
      jsx = [["]],
   },
}

template_string.setup(options)
