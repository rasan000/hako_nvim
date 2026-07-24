return {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    config = function()
        require("no-neck-pain").setup({
            buffers = {
                right = {
                    enabled = true,
                },
                scratchPad = {
                    enabled = false,
                    -- location = "~/notes",
                },
                bo = {
                    filetype = "md",
                },
            },
            autocmds = {
                enableOnVimEnter = true,
                enableOnTabEnter = true,
            },
            width = 150
        })
        vim.keymap.set("n", "<leader>z", "<cmd>NoNeckPain<CR>")
    end,
}
