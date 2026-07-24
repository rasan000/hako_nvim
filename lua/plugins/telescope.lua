return {
    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = { "node_modules", ".git" },
                    sorting_strategy = "ascending",
                    winblend = 4,
                    layout_strategy = "horizontal",
                    layout_config = {
                        height = 0.9,
                        prompt_position = "bottom",
                    },
                    mappings = {
                        n = {
                            ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
                            ["<Esc>"] = actions.close,
                        },
                        i = {
                            ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
                            ["<Esc>"] = actions.close,
                        },
                    },
                },
                extensions = {
                    coc = {
                        prefer_locations = false,
                    },
                },
            })

            vim.keymap.set("n", "<leader>ff",
                "<cmd>Telescope find_files find_command=rg,--files,--hidden,--glob,!*.git <CR>")
            vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
            vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
            vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
        end,
    },
    {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
            require("telescope").load_extension("frecency")
        end,
    },
    {
        "BurntSushi/ripgrep",
    },
    -- telescope option
    {
        "danielfalk/smart-open.nvim",
        branch = "0.2.x",
        config = function()
            require("telescope").load_extension("smart_open")
        end,
        dependencies = {
            "kkharji/sqlite.lua",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            { "nvim-telescope/telescope-fzy-native.nvim" },
        },
    }
}
