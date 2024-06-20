vim.cmd('syntax on')

-- color
vim.opt.termguicolors = true
vim.wo.signcolumn = "yes"


vim.g.did_load_filetypes = 1
vim.g.formatoptions = "qrn1"
vim.opt.showmode = false
vim.opt.updatetime = 100
vim.opt.scrolloff = 8
vim.opt.wrap = false -- Отключает перенос строк
vim.wo.linebreak = true
vim.opt.virtualedit = "block"
vim.opt.undofile = true
vim.opt.shell = "/bin/zsh"
-- vim.opt.cursorline = true -- Выделяет текущую строку курсора, выделяя ее среди других строк в файле
vim.opt.backspace = "indent,eol,start" -- значение "indent,eol,start" позволяет удалить отступ, перейти к предыдущей строке в начале строки и удалить символы в конце строки.


-- Search
vim.opt.ignorecase = true -- Игнорирует чувствительность к регистру при выполнении поиска.
vim.opt.smartcase = true -- Если ваш поисковый запрос содержит какие-либо заглавные буквы, он становится чувствительным к регистру

-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Shorter messages
vim.opt.shortmess:append("c")

-- Indent Settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true

-- Fillchars
vim.opt.fillchars = {
    vert = "│",
    fold = "⠀",
    eob = " ", -- suppress ~ at EndOfBuffer
    -- diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸"
}

vim.cmd([[highlight clear LineNr]])
vim.cmd([[highlight clear SignColumn]])


