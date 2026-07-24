return {
    -- Dressing - Better UI for vim.ui.select and vim.ui.input
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        config = function()
            require("dressing").setup({
                input = {
                    enabled = true,
                    default_prompt = "Input: ",
                    title_pos = "left",
                    insert_only = true,
                    start_in_insert = true,
                    border = "rounded",
                    relative = "cursor",
                    prefer_width = 40,
                    width = nil,
                    max_width = { 140, 0.9 },
                    min_width = { 20, 0.2 },
                },
                select = {
                    enabled = true,
                    backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
                    trim_prompt = true,
                    telescope = function()
                        local ok, themes = pcall(require, "telescope.themes")
                        if ok then
                            return themes.get_ivy()
                        end
                        return {}
                    end,
                },
            })
        end,
    }
}
