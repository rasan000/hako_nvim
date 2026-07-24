return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            local highlight = {
                "Whitespace",
            }
            local hooks = require("ibl.hooks")
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "Whitespace", { fg = "#363a42" })
            end)
            require("ibl").setup({
                indent = {
                    char = "│",
                    highlight = highlight,
                },
                whitespace = {
                    highlight = highlight,
                    remove_blankline_trail = false,
                },
                scope = {
                    enabled = true,
                },
                exclude = {
                    filetypes = {},
                    buftypes = {},
                },
            })
        end,
    }
}
