-- Sets numbers and relative numbers
vim.opt.nu = true
vim.opt.relativenumber = true
-- Sets tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
-- This turns off wrapping
vim.opt.wrap = false

-- This allows undo tree to access old undos
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true


vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- This is right side column
vim.opt.colorcolumn = "100"

vim.g.mpaleader = " "

-- This highlights the current line in vim
-- The underline for the current line is in files
vim.opt.cursorline = true

-- Enable copying form vim to system-clipboard 
vim.opt.clipboard = unnamedplus

-- Auto reload the buffer when saving
vim.opt.autoread = true

-- This ensures that it is the correct python
vim.g.python3_host_prog = "/usr/local/bin/python3"

-- Update the PATH so that Neovim uses the right Python version
vim.env.PATH = "/usr/local/bin:" .. vim.env.PATH

