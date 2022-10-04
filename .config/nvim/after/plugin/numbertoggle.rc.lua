local status, toggle = pcall(require, 'numbertoggle')
if (not status) then return end

toggle.setup()
