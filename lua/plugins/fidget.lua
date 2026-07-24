return {
    -- Fidget - LSP progress notifications
    {
        "j-hui/fidget.nvim",
        event = "LspAttach",
        config = function()
            require("fidget").setup({})
        end,
    },
}
