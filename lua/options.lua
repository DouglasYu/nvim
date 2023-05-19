local o = vim.o -- behaves like :set
local go = vim.go -- behaves like :setglobal

-- Change directory as you open a file
o.autochdir = true
-- Set line number
o.number = true
o.relativenumber = false
-- Set tab size
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
-- Use indent from the previous line
o.autoindent = true
-- Default split direction
o.splitright = true
o.splitbelow = true
-- Search setting
o.ignorecase = true
o.smartcase = true
-- Wrap around when exceed the window width
o.wrap = true
-- There will be no --INSERT-- below
o.showmode = false

