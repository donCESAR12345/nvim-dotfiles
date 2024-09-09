local opt = vim.opt
local g = vim.g

opt.encoding = "utf-8" -- set encoding
opt.number = true -- add line numbers
opt.relativenumber = true -- add relative line numbers
opt.tabstop = 4 -- number of columns occupied by a tab
opt.softtabstop = 4 -- see multiple spaces as tabstops
opt.shiftwidth = 4 -- width for autoindents
opt.expandtab = true -- convert tabs into spaces
opt.autoindent = true -- indent a new line the same as the line just typed

opt.clipboard = 'unnamedplus'
opt.smartindent = true
opt.ignorecase = true
opt.showmatch = true
opt.hlsearch = true
opt.incsearch = true
opt.cc = '80'

g.mapleader = " "

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true

vim.api.nvim_set_hl(0, "Normal", {
  fg = "#bbbbbb",
  bg = "NONE",
  bold = false,
  italic = false,
  underline = false,
  undercurl = false,
})
