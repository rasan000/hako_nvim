return {
	-- git signs
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	--git blame
	{
		"f-person/git-blame.nvim",
		config = function()
			vim.g.gitblame_enabled = false
			vim.api.nvim_set_keymap("n", "<leader>gb", "<Cmd>GitBlameToggle<CR>", {})
		end,
	},
}
