local status, delay = pcall(require, 'delaytrain')
if (not status) then return end

delay.setup { delay_ms = 1000, -- How long repeated usage of a key should be prevented
  grace_period = 1, -- How many repeated keypresses are allowed
  keys = { -- Which keys (in which modes) should be delayed
    ['nv'] = { 'h', 'j', 'k', 'l' },
    ['nvi'] = { '<Left>', '<Down>', '<Up>', '<Right>' },
  },
}
