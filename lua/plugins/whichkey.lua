return {
  --which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = false
    end,
    config = function()
      require("which-key").setup({
        preset = "classic",
        win = {
          border = "rounded",
          width = { min = 20, max = 50 },
          height = { min = 4, max = 20 },
          padding = { 1, 2 },
          row = -2,
          col = -2,
        },
      })
    end,
  },
}
