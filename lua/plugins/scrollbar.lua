return {
    --nvim-scrollbar

    {
        "petertriho/nvim-scrollbar",
        event = "VeryLazy",
        config = function()
            require("scrollbar").setup({
                handlers = {
                    search = false,
                    gitsigns = true,
                    diagnostics = true,
                },
                excluded_filetypes = { "cmp_menu", "cmp_docs", "TelescopePrompt" },
            })
        end,
    },
}
