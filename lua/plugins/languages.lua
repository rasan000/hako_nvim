return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
        ["cfn-lsp-extra"] = {
          mason = false,
          cmd = { "mise", "exec", "--", "cfn-lsp-extra" },
          filetypes = { "yaml.cloudformation", "json.cloudformation" },
          root_markers = { ".git" },
          settings = {
            documentFormatting = false,
          },
        },
      },
    },
  },
}
