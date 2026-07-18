return {

    --barbar
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "nvim-web-devicons"
        },
        opts = {
            auto_hide = true,
            animation = false,
        },
        config = function()
            vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>BufferNext<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>BufferPrevious<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>br", "<cmd>BufferRestore<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>e", "<Cmd>BufferClose!<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>bp", "<Cmd>BufferPin<CR>", { noremap = true, silent = true })
        end,
    },
}
