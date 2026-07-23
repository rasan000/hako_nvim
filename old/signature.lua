return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
        require("lsp_signature").setup({
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            floating_window = true,
            hint_enable = false,
            handler_opts = {
                border = "rounded",
            },
        })
    end,
}
