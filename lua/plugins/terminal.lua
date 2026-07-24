return {
    --terminal
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup({
                size = 30,
                open_mapping = [[<c-t>]],
                direction = "float",
                float_opts = {
                    border = "curved",
                },
                shade_terminals = true,
            })
            vim.api.nvim_create_user_command("Term", function()
                require("toggleterm").toggle()
            end, {})
            local opts = { noremap = true, silent = true }

            vim.api.nvim_set_keymap("t", "<esc>", [[<C-\><C-n>]], opts)
        end,
    },
}
