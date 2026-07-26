return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			explorer = {
				replace_netrw = true,
			},
			picker = {
				enabled = true,
				sources = {
					explorer = {
						hidden = true,
					},
				},
			},
		},
		keys = {
			{
				"<C-e>",
				function()
					Snacks.explorer()
				end,
				desc = "Open file explorer",
			},
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find files",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Live grep",
			},
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Find buffers",
			},
			{
				"<leader>fh",
				function()
					Snacks.picker.help()
				end,
				desc = "Help tags",
			},
		},
	},
}
