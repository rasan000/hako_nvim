-- encoding
vim.opt.fileencoding = "utf-8"
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"

-- menu
vim.opt.wildmenu = true

-- zsh
vim.opt.shell = "/usr/bin/zsh"

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.showtabline = 1

-- auto read
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "WinEnter", "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "checktime",
})

-- Automatically reload files when they change on disk
vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  pattern = "*",
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.WARN)
  end,
})

-- Check for file changes more frequently
vim.opt.updatetime = 1000

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- row number
vim.opt.cursorline = false -- Highlight current line
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.signcolumn = "yes"

-- tab
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.whichwrap = "b,s,h,l,<,>,[,]~"

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

-- use mouse
vim.opt.mouse = "a"
vim.keymap.set("v", "<LeftRelease>", "ygv")

-- scroll settings
vim.opt.scroll = 10 -- number of lines to scroll with Ctrl-u/Ctrl-d
vim.opt.scrolloff = 20

-- split direction (open splits to right and below)
vim.opt.splitright = true -- vertical splits open to the right
vim.opt.splitbelow = true -- horizontal splits open below

-- delete buffa
vim.opt.hidden = true
vim.opt.confirm = false
vim.opt.backup = false
vim.opt.swapfile = false

-- title
vim.opt.title = true

vim.opt.inccommand = "split"

-- wrap and side scroll
vim.opt.wrap = false
vim.opt.sidescroll = 1

-- trail
vim.opt.list = true
vim.opt.listchars:append({
  space = "·",
  tab = "→ ",
  trail = "·",
})
