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
        -- markdown = { "markdownlint" },
        -- json = { "eslint_d" },
        -- for cloudformation
        yaml = { "cfn_lint" },
      }

      -- luacheck setup
      lint.linters.luacheck = {
        cmd = "luacheck",
        args = { "--formatter", "plain", "--codes", "--ranges", "--filename", "$FILENAME", "-" },
        stdin = true,
        stream = "stdout",
        ignore_exitcode = true,
        parser = require("lint.parser").from_pattern(
          [[^(%S+):(%d+):(%d+): (%w+) (.+)$]],
          { "filename", "line", "column", "code", "message" }
        ),
      }

      vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
