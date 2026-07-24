return {
	--barbar
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"nvim-mini/mini.icons",
		},
		opts = {
			auto_hide = true,
			animation = false,
		},
		config = function()
			vim.api.nvim_set_keymap("n", "L", "<cmd>BufferNext<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "H", "<cmd>BufferPrevious<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>br", "<cmd>BufferRestore<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>e", "<Cmd>BufferClose!<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>bp", "<Cmd>BufferPin<CR>", { noremap = true, silent = true })
		end,
	},
}
