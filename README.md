# NeoVim: настройка и использование

- [Официальная документация](https://neovim.io/)

## Установка

Я уверен, что вы сможете найти способ установки NeoVim для своей операционной системы и менеджера пакетов. Это самая простая часть настройки.

Пример установки для MacOS с помощью Homebrew:
```sh
brew install nvim
```

После установки проверяем версию:
```sh
nvim -v
```
Если увидите нечто подобное, можно переходить к настройке:
```sh
NVIM v0.10.4
Build type: Release
LuaJIT 2.1.1736781742
Run "nvim -V1 -v" for more info
```

## Моя конфигурация плагинов

### Структура конфигурации

Одна из причин популярности NeoVim — это гибкость в настройке. Но именно из-за этого множества возможностей и инструментов бывает сложно разобраться, с чего начать. Вот моя структура конфигурации, которую вы легко сможете расширять под себя:

```
├── init.lua
└── lua
    ├── core
    │   ├── colors.lua
    │   ├── configs.lua
    │   ├── mappings.lua
    │   └── plugins.lua
    └── plugins
        ├── autoclose.lua
        ├── barbar.lua
        ├── cmp.lua
        ├── colors
        │   ├── catppucchin-theme.lua
        │   ├── kanagawa-theme.lua
        │   └── onedark-theme.lua
        ├── debug_dapui.lua
        ├── lualine.lua
        ├── navigator.lua
        ├── neotree.lua
        ├── noice.lua
        ├── nvim-surround.lua
        ├── telescope.lua
        ├── treesitter.lua
        └── window.lua
```
За исключением navigator.lua ее можно назвать базированной 

Файл `init.lua` загружает модули в определённом порядке:
```lua
require('core.mappings')
require('core.plugins')
require('core.colors')
require('core.configs')
```

### Базовые настройки (core.configs.lua)
часть стандартных настроек
```lua
-- Поиск
vim.opt.ignorecase = true -- Игнорирует регистр при поиске
vim.opt.smartcase = true -- Если есть заглавные буквы, поиск становится чувствительным к регистру

-- Мышь
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- Нумерация строк
vim.opt.number = true
vim.opt.relativenumber = true
```

### Кастомные сочетания клавиш (core.mappings.lua)
```lua
vim.keymap.set("i", "jk", "<ESC>")
```
Это позволяет например выйти из режима вставки, набрав `jk`.

### Темы (core.colors.lua)
тут думаю все понятно
```lua
function SetColor(color)
    color = color or "onedark"
    vim.cmd.colorscheme(color)
end

SetColor("kanagawa")
```

### Менеджер плагинов (core.plugins.lua)
Используем современный менеджер плагинов - больше информации 
https://www.barbarianmeetscoding.com/notes/neovim-lazyvim
```lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "plugins" },
    { import = "plugins.colors" },
    checker = {
        enabled = false -- отключить автообновление плагинов
    }
})
```
введите команду 
```
:Lazy
```
для доступа к функциональному пользовательскому интерфейсу, где вы можете устанавливать, обновлять, отлаживать, настраивать, удалять и просматривать последние версии ваших любимых плагинов. 

Одним из главных преимуществ такой структуры конфигурации является удобство и модульность: для добавления нового плагина достаточно просто создать отдельный файл в папке plugins/ и описать в нем конфигурацию. Это позволяет легко управлять плагинами, быстро отключать ненужные или тестировать альтернативные решения, не затрагивая остальные настройки.
### Примеры конфигурации плагинов

#### Автоматическое закрытие скобок (plugins/autoclose.lua)
```lua
return {
    'm4xshen/autoclose.nvim',
    config = function()
        require("autoclose").setup({})
    end
}
```

#### Neo-tree — файловый менеджер (plugins/neotree.lua)
```lua
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        local neotree = require("neo-tree")
        vim.keymap.set('n', '<leader>e', ':Neotree left<CR>')
        vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')
        neotree.setup({
            filesystem = {
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = false,
                },
                filtered_items = {
                    visible = true,
                    show_hidden_count = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                }
            }
        })
    end
}
```

#### Telescope — поисковой менеджер (plugins/telescope.lua)
```lua
return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            enabled = true
        }, {"nvim-telescope/telescope-file-browser.nvim", enabled = true}
    },
    branch = "0.1.x",
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '-', ":Telescope file_browser<CR>")
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
        vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
        vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
        vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {})
        vim.keymap.set('n', '<leader>fx', builtin.treesitter, {})
        vim.keymap.set('n', '<leader>fs', builtin.spell_suggest, {})
        vim.keymap.set('n', 'gd', builtin.lsp_definitions,
                    {noremap = true, silent = true})
    end
}
```
Структура всех плагинов в конфигурации остается одинаковой, указывается репозиторий, ветка, зависимости и дальше сама конфигурация с горячими клавишами и доп функционалом. Все примеры и объяснения  смотрите на странице плагина на гитхабе 
## Траблшутинг

### 1. Фиксация версий плагинов
Чтобы избежать проблем с обновлениями, фиксируйте версии плагинов в файле:
```
~/.config/nvim/lazy-lock.json
```
Если что-то сломалось, можно удалить и перекачать плагины:
```sh
rm -rf ~/.local/share/nvim/lazy/<plagin_name>
```

### 2. Просмотр логов
При возникновении ошибок первым делом смотрите логи:
```
~/.local/state/nvim/log/<plagin_name>
```

### 3. Проверка привязок клавиш
Если комбинации клавиш не работают, можно посмотреть их привязки:
```sh
:nmap  # Normal mode
:vmap  # Visual mode
:imap  # Insert mode
```
или можете использовать 
```
:Telescope keymaps
```

### 4. Ошибки при запуске NeoVim
Если NeoVim не запускается или работает некорректно, попробуйте:
```sh
nvim --clean  # Запуск без пользовательской конфигурации
```

### 5. Совет от себя - vimtutor
Открой терминал и запусти команду:
```sh
vimtutor
```
Это встроенный обучающий курс, который пошагово знакомит с основами Vim. Сюда наверно также добавлю развитие скилла "слепая печать" иначе толко от всего вышеописанного мало.


