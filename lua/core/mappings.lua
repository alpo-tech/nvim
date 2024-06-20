-- set leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>") -- выйти из режима вставки, быстро набрав jk.


-- привязки клавиши Esc для выхода из терминала в нормальный режим
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })