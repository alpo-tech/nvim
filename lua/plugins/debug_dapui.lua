return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",  -- основной DAP
            "nvim-neotest/nvim-nio",  -- для интеграции тестов (если нужно)
        },
        config = function()
            require("dapui").setup()
            vim.keymap.set('n', '<leader>dt', ':DapUiToggle<CR>', {noremap=true})
            vim.keymap.set('n', '<leader>db', ':DapToggleBreakpoint<CR>', {noremap=true})
            vim.keymap.set('n', '<leader>dc', ':DapContinue<CR>', {noremap=true})
            vim.keymap.set('n', '<leader>dr', ":lua require('dapui').open({reset = true})<CR>", {noremap=true})
       
            vim.keymap.set('n', '<F10>', ":lua require'dap'.step_over()<CR>")

       
        end,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = {
            "mfussenegger/nvim-dap",  -- требуется для работы
        },
        config = function()
            require("nvim-dap-virtual-text").setup({
                virt_text_pos = 'eol', -- показывает виртуальный текст в конце строки
                all_frames = true,     -- отображает информацию для всех кадров          
            })
        end,
    },
    {
        "leoluz/nvim-dap-go",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("dap-go").setup()
            vim.keymap.set('n', '<leader>sd', ":lua require('dap-go').debug_test()<CR>")
        end,
    },
}
