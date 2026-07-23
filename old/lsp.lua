return
{
    'neovim/nvim-lspconfig',
    dependencies = { "saghen/blink.cmp" },
    config = function()
        -- default lsp config(use blink.cmp to set capabilities)
        vim.lsp.config('*', {
            capabilities = require("blink.cmp").get_lsp_capabilities({
                textDocument = {
                    completion = {
                        completionItem = {
                            snippetSupport = true,
                        }
                    }
                },
                foldingRange = {
                    dynamicRegistration = false,
                    lineFoldingOnly = true,
                }
            })
        })

        --lsp setup
        vim.lsp.enable({
            'lua_ls',
            'ts_ls',
            'yamlls',
            'pyright',
            'jsonls',
            'bashls',
            'rust_analyzer',
            'cfn-lsp-extra'
        })

        -- cfn-lsp-extra configuration
        vim.lsp.config('cfn-lsp-extra', {
            cmd = { 'mise', 'exec', '--', 'cfn-lsp-extra' }, -- mise経由で実行
            filetypes = { 'yaml.cloudformation', 'json.cloudformation' },
            root_markers = { '.git' },
            settings = {
                documentFormatting = false,
            },
        })


        -- LSP attach configuration (v0.11 style)
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local bufnr = ev.buf

                -- Custom keymaps
                local opts = { buffer = bufnr, silent = true }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "gf", vim.lsp.buf.format, opts)
                vim.keymap.set("n", "ge", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "g]", vim.diagnostic.goto_next, opts)

                -- Auto show diagnostics on cursor hold
                vim.api.nvim_create_autocmd("CursorHold", {
                    buffer = bufnr,
                    callback = function()
                        local diagnostic_opts = {
                            focusable = false,
                            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                            border = "rounded",
                            source = "always",
                            prefix = " ",
                            scope = "cursor",
                        }
                        vim.diagnostic.open_float(nil, diagnostic_opts)
                    end,
                })
            end,
        })

        -- Configure diagnostics
        vim.diagnostic.config({
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            virtual_text = {
                spacing = 4,
                source = "if_many",
                prefix = function(diagnostic)
                    if diagnostic.severity == vim.diagnostic.severity.ERROR then
                        return " "
                    elseif diagnostic.severity == vim.diagnostic.severity.WARN then
                        return " "
                    elseif diagnostic.severity == vim.diagnostic.severity.INFO then
                        return " "
                    elseif diagnostic.severity == vim.diagnostic.severity.HINT then
                        return ""
                    end
                end,
            },
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
