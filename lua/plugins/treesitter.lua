return { -- treesitter
{
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local languages = {"c", "yaml", "toml", "xml", "sql", "java", "bash", "json", "fish", "markdown", "c_sharp",
                           "html", "css", "python", "kotlin", "lua", "dockerfile", "vim", "vimdoc", "javascript",
                           "typescript", "terraform"}

        local treesitter = require("nvim-treesitter")
        treesitter.install(languages)

        local enabled = {}
        for _, language in ipairs(languages) do
            enabled[language] = true
        end

        local group = vim.api.nvim_create_augroup("treesitter", {
            clear = true
        })
        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            callback = function(args)
                local language = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
                if not language or not enabled[language] then
                    return
                end

                local started = pcall(vim.treesitter.start, args.buf, language)
                if started then
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end
        })
    end
}, -- ts-autotag
{
    "windwp/nvim-ts-autotag",
    ft = {"html", "xml", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "vue", "tsx", "jsx"},
    config = function()
        require('nvim-ts-autotag').setup({
            enable_close = true, -- Auto close tags
            enable_rename = true, -- Auto rename pairs of tags
            enable_close_on_slash = false -- Auto close on trailing </
        })
    end
}, -- context
{
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        multiwindow = false, -- Enable multiwindow support.
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
        on_attach = nil -- (fun(buf: integer): boolean) return false to disable attaching
    }
}}
