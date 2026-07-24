return {
    -- Harpoon - File bookmarks for quick navigation
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()

            vim.keymap.set("n", "<leader>a", function()
                harpoon:list():add()
            end, { desc = "Add current file to Harpoon" })
            vim.keymap.set("n", "<C-h>", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = "Toggle Harpoon quick menu" })
        end,
    }
}
