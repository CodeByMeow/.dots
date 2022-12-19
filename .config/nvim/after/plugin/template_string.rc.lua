local status, template_str = pcall(require, 'template-string')
if (not status) then return end

template_str.setup()
