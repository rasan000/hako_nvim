return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      vim.keymap.set("n", "<leader>dn",
        function()
          require("notify").dismiss({ silent = true })
        end,
        { desc = "Dismiss notifications" })

      require("noice").setup({
        -- classic cmdline
        cmdline = {
          view = "cmdline",
        },
        messages = {
          enabled = true,
          view = "mini",
          view_error = "mini",
          view_warn = "mini",
          view_history = "messages",
          view_search = "virtualtext",
        },
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = false,
          long_message_to_split = false,
          inc_rename = false,
          lsp_doc_border = true,
        },
        -- hidden messages
        routes = {
          {
            filter = {
              any = {
                { event = "msg_show", kind = "emsg",      find = "E486:" },
                { event = "msg_show", kind = "emsg",      find = "E492:" },
                { event = "msg_show", kind = "emsg",      find = "end_col" },
                { event = "msg_show", kind = "",          find = "written" },
                { event = "notify",   kind = "warn",      find = "Config" },
                -- deprecated message
                { event = "msg_show", kind = "",          find = "vim%.tbl_islist" },
                { event = "msg_show", kind = "warn",      find = "vim%.tbl_islist" },
                { event = "msg_show", kind = "echo",      find = "tbl_islist" },
                { event = "msg_show", find = "deprecated" },
              }
            },
            opts = { skip = true },
          },
        },
      })
      -- noice keymaps
      vim.keymap.set("n", "<leader>nl", "<cmd>Noice last<cr>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>nh", "<cmd>Noice history<cr>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>ne", "<cmd>Noice errors<cr>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<cr>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>nt", "<cmd>Noice telescope<cr>", { noremap = true, silent = true })
    end,
  },
}
