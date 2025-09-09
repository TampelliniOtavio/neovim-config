-- Usability
vim.opt.foldlevelstart = 99
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.termguicolors = true
vim.o.expandtab = true

-- Using System Clipboard
vim.opt.clipboard = "unnamedplus"

-- File type recognition
vim.cmd("filetype on")
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")

-- Syntax highlighting
vim.cmd("syntax on")

-- Scroll a bit horizontally when at the end of the line
vim.opt.sidescroll = 6

-- Make it easier to work with buffers
vim.opt.hidden = true
vim.opt.confirm = true
vim.opt.autowriteall = true
vim.opt.wildmenu = true
vim.opt.wildmode = "full"

-- Keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- j/k will move virtual lines (lines that wrap)
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, silent = true, expr = true })

-- Interface
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Line number settings
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.statuscolumn = "%!v:lua.require('utils.statuscolumn').status()"

-- Make comments italic
vim.cmd("highlight Comment cterm=italic gui=italic")

-- Remove Text wrap
vim.o.wrap = false
