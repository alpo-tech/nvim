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
        vim.keymap.set('n', '<leader>fc', ':Telescope current_buffer_fuzzy_find<CR>', { desc = 'Search in current buffer' })
        -- vim.keymap.set('n', '<Tab>', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
        vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
        vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
        vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {})
        vim.keymap.set('n', '<leader>fx', builtin.treesitter, {})
        vim.keymap.set('n', '<leader>fs', builtin.spell_suggest, {})
--        vim.keymap.set('n', 'gr', builtin.lsp_references,
--                    {noremap = true, silent = true})
        vim.keymap.set('n', 'gd', builtin.lsp_definitions,
                    {noremap = true, silent = true})
    end
}
