-- web and markup files
local web_formatter = { "prettierd", "prettier" }

return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            bash = { "shfmt" },

            --web and markup
            typescript = web_formatter,
            javascript = web_formatter,
            typescriptreact = web_formatter,
            javascriptreact = web_formatter,
            vue = web_formatter,
            svelte = web_formatter,
            json = web_formatter,
            jsonc = web_formatter,
            yaml = web_formatter,
            html = web_formatter,
            css = web_formatter,
            scss = web_formatter,
            less = web_formatter,
            markdown = web_formatter,

        },
        default_format_opts = {
            lsp_format = "fallback",
        },

        -- auto format
        format_on_save = { timeout_ms = 500 },
        formatters = {
            shfmt = {
                append_args = { "-i", "2" },
            },
        },
    },
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>i",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
