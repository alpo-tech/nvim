     
return {     

  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },



    config = function()
        local neotree = require("neo-tree")

        -- NeoTree
        -- vim.keymap.set('n', '<leader>e', ':Neotree float focus<CR>')
        vim.keymap.set('n', '<leader>e', ':Neotree left<CR>')
        vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')


        vim.fn.sign_define("DiagnosticSignError",
        {text = " ", texthl = "DiagnosticSignError"})
      vim.fn.sign_define("DiagnosticSignWarn",
        {text = " ", texthl = "DiagnosticSignWarn"})
      vim.fn.sign_define("DiagnosticSignInfo",
        {text = " ", texthl = "DiagnosticSignInfo"})
      vim.fn.sign_define("DiagnosticSignHint",
        {text = "󰌵", texthl = "DiagnosticSignHint"})

        neotree.setup({
            enable_git_status = true,
            name = {
              trailing_slash = false,
              use_git_status_colors = true,
              highlight = "NeoTreeFileName",
            },
          
            git_status = {
              symbols = {
                added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
                deleted = "✖", -- this can only be used in the git_status source
                renamed = "󰁕", -- this can only be used in the git_status source
              -- Status type
                untracked = "",
                ignored = "",
                unstaged = "󰄱",
                staged = "",
                conflict = "",
              },
            },

            filesystem = {
                follow_current_file = {
                    enabled = true, -- This will find and focus the file in the active buffer every time
                    --               -- the current file is changed while the tree is open.
                    leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
                },

                filtered_items = {
                    visible = true,
                    show_hidden_coutn = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
        })
    end 

}
