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

-- lspAttach
local function on_lsp_attach(args)
	local bufnr = args.buf
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
	end

	map("n", "K", vim.lsp.buf.hover, "LSP hover")
	map("n", "gd", vim.lsp.buf.definition, "Go to definition")
	map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
	map("n", "gr", vim.lsp.buf.references, "List references")
	map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
	map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
	map("n", "ge", vim.diagnostic.open_float, "Show diagnostic")
	map("n", "g[", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, "Previous diagnostic")
	map("n", "g]", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, "Next diagnostic")
end

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
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			local group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })
			vim.api.nvim_create_autocmd("LspAttach", {
				group = group,
				callback = on_lsp_attach,
			})

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
