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
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mpaleader = " "

-- This highlights the current line in vim
-- The underline for the current line is in files
vim.opt.cursorline = true
