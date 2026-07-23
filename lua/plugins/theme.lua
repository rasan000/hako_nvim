return {
    -- color scheme
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
      config = function()
        require("tokyonight").setup({
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        })
        vim.cmd([[colorscheme tokyonight-moon]])
      end,
    },
    -- nvim-web-devicons (use basic ASCII icons for compatibility)
    {
        "nvim-tree/nvim-web-devicons",
        opts = {
            color_icons = true,
            default = true,
            strict = false,
        },
    },
}
