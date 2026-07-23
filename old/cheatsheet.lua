return {
    'sirasagi62/toggle-cheatsheet.nvim',
    config = function()
        -- loading the plugin
        local tcs = require('toggle-cheatsheet').setup(true)

        -- make your own cheat sheet
        local cs1 = tcs.createCheatSheetFromSubmodeKeymap(
            tcs.conf {
                { "cs",           "change surround symbol" },
                { "ds",           "delete surround symbol" },
                { "ys",           "surround selection/motion" },
                { "ysiw",         "surround word" },
                { "gd",           "go to definition" },
                { "gr",           "go to references" },
                { "gD",           "go to declaration" },
                { "<C-o>",        "jump back" },
                { "<C->",         "jump forward" },
                { "<leader>rn",   "rename symbol" },
                { "<leader>xx",   "check error list" },
                { "q",            "record macro" },
                { "@",            "play macro" },
                { "e@",           "edit macro" },
                { "m",            "record mark" },
                { "<leader>m",    "jump first mark" },
                { '"{register}y', "yank register" },
                { '"{register}p', "paste register" },
            }
        )

        vim.keymap.set({ "n", "v", "c" }, "<F1>", function()
            tcs.toggle(cs1)
        end)
    end,

}
