
return {
    "ray-x/navigator.lua",
    dependencies = {
        {"hrsh7th/nvim-cmp"},
        {"ray-x/guihua.lua", run = "cd lua/fzy && make"}, {
            "ray-x/go.nvim",
            event = {"CmdlineEnter"},
            ft = {"go", "gomod"},
            build = ':lua require("go.install").update_all_sync()'
        }, {
            "ray-x/lsp_signature.nvim", -- Show function signature when you type
            event = "VeryLazy",
            config = function() require("lsp_signature").setup() end
        }
    },
    config = function()
        require("go").setup()
        require("navigator").setup({
            lsp_signature_help = true, -- enable ray-x/lsp_signature
            lsp = {format_on_save = true},
            keymaps = {
                { key = '<leader>fm', func = vim.lsp.buf.format, desc = 'Format code' }, -- Новая комбинация для форматирования
                { key = '<leader>td', func = require('navigator.diagnostics').toggle_diagnostics, desc = 'Toggle Diagnostics' }, -- новая комбинация
            },
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = {"go"},
            callback = function(ev)
                -- CTRL/control keymaps
                vim.api
                    .nvim_buf_set_keymap(0, "n", "<C-i>", ":GoImports<CR>", {})
                vim.api.nvim_buf_set_keymap(0, "n", "<C-b>", ":GoBuild %:h<CR>",
                                            {})
                vim.api.nvim_buf_set_keymap(0, "n", "<C-t>", ":GoTestPkg<CR>",
                                            {})
                vim.api.nvim_buf_set_keymap(0, "n", "<C-c>",
                                            ":GoCoverage -p<CR>", {})

                -- Opens test files
                --vim.api.nvim_buf_set_keymap(0, "n", "A",
                --                            ":lua require('go.alternate').switch(true, 'vsplit')<CR>",
                --                            {}) -- Test
                vim.api.nvim_buf_set_keymap(0, "n", "T",
                                            ":lua require('go.alternate').switch(true, '')<CR>",
                                            {}) -- Test Vertical
                vim.api.nvim_buf_set_keymap(0, "n", "S",
                                            ":lua require('go.alternate').switch(true, 'split')<CR>",
                                            {}) -- Test Split
            end,
            group = vim.api.nvim_create_augroup("go_autocommands",
                                                {clear = true})
        })
    end
}
