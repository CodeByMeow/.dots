local status, number = pcall(require, 'numbertoggle')
if (not status) then return end

number.setup()
