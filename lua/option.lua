local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.clipboard = "unnamedplus"
opt.wildmenu = true
opt.completeopt = { "menuone", "noselect", "popup" }
opt.showcmd = true
opt.showmatch = true
opt.hidden = true
opt.title = true
opt.laststatus = 2
opt.autoread = true

-- ファイル
opt.fileencoding = "utf-8"
opt.encoding = "utf-8"
opt.swapfile = false
opt.backup = false

-- 表示
opt.cursorline = true
opt.hlsearch = true

-- インデント
opt.tabstop = 4
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- 検索
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- undo
opt.undofile = true

-- シェル
opt.shell = "/usr/bin/zsh"

-- hilight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 500
    })
  end
})
