return { -- color scheme
{
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require("tokyonight").setup({
            transparent = true,
            -- styles = {
            --     sidebars = "transparent",
            --     floats = "transparent"
            -- }
        })
        vim.cmd([[colorscheme tokyonight-moon]])
    end
}, -- nvim-web-devicons (use basic ASCII icons for compatibility)
{
    "nvim-tree/nvim-web-devicons",
    opts = {
        color_icons = true,
        default = true,
        strict = false
    }
}, -- lualine
{
    "nvim-lualine/lualine.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    opts = {
        options = {
            theme = "tokyonight",
            globalstatus = true
        },
        sections = {
            lualine_a = {"mode"},
            lualine_b = {"branch"},
            lualine_c = {"filename"},
            lualine_x = {"encoding", "fileformat", "filetype", {
                require("noice").api.statusline.mode.get,
                cond = require("noice").api.statusline.mode.has,
                color = {
                    fg = "#ff9e64"
                }
            }},
            lualine_y = {"progress"},
            lualine_z = {"location"}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {"filename"},
            lualine_x = {"location"},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    }
}}
