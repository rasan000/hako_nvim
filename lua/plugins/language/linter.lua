return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				lua = { "luacheck" },
				python = { "pylint" },
				sh = { "shellcheck" },
				bash = { "shellcheck" },

				-- web and markup
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				markdown = { "markdownlint" },
				dockerfile = { "hadolint" },
				terraform = { "tflint" },
				-- for cloudformation
				["yaml.cloudformation"] = { "cfn_lint" },
			}

			local group = vim.api.nvim_create_augroup("UserLint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
				group = group,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
