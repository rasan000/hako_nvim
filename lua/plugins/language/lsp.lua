-- LSP servers
local servers = {
	"lua_ls",
	"ts_ls",
	"yamlls",
	"pyright",
	"jsonls",
	"bashls",
	"rust_analyzer",
	"dockerls",
	"docker_compose_language_service",
	"terraformls",
}

-- lsp
return {
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		cmd = { "Mason", "MasonUpdate", "MasonLog", "MasonInstall", "MasonUninstall", "MasonUninstallAll" },
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
		},
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = servers,
			automatic_enable = servers,
		},
		config = function(_, opts)
			-- complition
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			-- keymap
			local group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })
			vim.api.nvim_create_autocmd("LspAttach", {
				group = group,
				callback = function(args)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, {
						buffer = args.buf,
						silent = true,
						desc = "LSP hover",
					})

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
						buffer = args.buf,
						silent = true,
						desc = "Go to definition",
					})

					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
						buffer = args.buf,
						silent = true,
						desc = "Go to declaration",
					})

					vim.keymap.set("n", "gr", vim.lsp.buf.references, {
						buffer = args.buf,
						silent = true,
						desc = "List references",
					})

					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
						buffer = args.buf,
						silent = true,
						desc = "Rename symbol",
					})

					vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, {
						buffer = args.buf,
						silent = true,
						desc = "Code action",
					})

					vim.keymap.set("n", "ge", vim.diagnostic.open_float, {
						buffer = args.buf,
						silent = true,
						desc = "Show diagnostic",
					})

					vim.keymap.set("n", "g[", function()
						vim.diagnostic.jump({ count = -1, float = true })
					end, {
						buffer = args.buf,
						silent = true,
						desc = "Previous diagnostic",
					})

					vim.keymap.set("n", "g]", function()
						vim.diagnostic.jump({ count = 1, float = true })
					end, {
						buffer = args.buf,
						silent = true,
						desc = "Next diagnostic",
					})
				end,
			})

			-- diagnostic
			vim.diagnostic.config({
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				virtual_text = {
					spacing = 4,
					source = "if_many",
				},
				float = {
					border = "rounded",
					source = "always",
				},
			})

			--cloudformation
			vim.lsp.config("cfn-lsp-extra", {
				cmd = { "mise", "exec", "--", "cfn-lsp-extra" },
				filetypes = { "yaml.cloudformation", "json.cloudformation" },
				root_markers = { ".git" },
				settings = {
					documentFormatting = false,
				},
			})
			vim.lsp.enable("cfn-lsp-extra")

			require("mason-lspconfig").setup(opts)
		end,
	},

	-- tools
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"stylua",
				"isort",
				"black",
				"shfmt",
				"prettierd",
				"luacheck",
				"pylint",
				"shellcheck",
				"eslint_d",
				"markdownlint",
				"cfn-lint",
				"hadolint",
				"tflint",
			},
			run_on_start = true,
			start_delay = 3000,
			debounce_hours = 24,
		},
	},
}
