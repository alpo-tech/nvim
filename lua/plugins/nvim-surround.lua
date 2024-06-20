return {
    "kylechui/nvim-surround",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-treesitter/nvim-treesitter-textobjects"
    },
    event = "VeryLazy",
    version = "v2.1.7",
    config = function() require("nvim-surround").setup() end
}
