return {
    -- color scheme
    {
        "EdenEast/nightfox.nvim",
        opts = {
            options = {
                transparent = false,
                styles = {
                    comments = "italic",
                    keywords = "bold",
                    type = "italic,bold",
                },
            },
        },
        config = function()
            vim.cmd("colorscheme carbonfox") -- or any other nightfox variant
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
