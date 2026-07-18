-- clipboard
vim.opt.clipboard = "unnamedplus"
-- IME(must be zenhan installed)
-- 
--  
local zenhan = "DISPLAY=:0 /usr/local/bin/zenhan"

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	callback = function()
		vim.fn.system(zenhan .. " 0")
	end,
})

vim.api.nvim_crate_autocmd("CmdlineLeave", {
	pattern = "*",
	callback = function()
		vim.fn.system(zenhan .. " 0")
	end,
})

-- keymap
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("v", "x", '"_x')
vim.keymap.set("n", "X", '"_X')
vim.keymap.set("v", "X", '"_X')
