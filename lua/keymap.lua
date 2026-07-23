local map = vim.keymap.set
local opts = { noremap = true, silent = true }
-- leader key をスペースに設定
vim.g.mapleader = " "

-- d/c はヤンクさせない
map({ "n", "x" }, "d", '"_d', opts)
map({ "n" }, "dd", '"_dd', opts)
map({ "n", "x" }, "D", '"_D', opts)
map({ "n", "x" }, "c", '"_c', opts)
map({ "n" }, "C", '"_C', opts)

-- normalモードでのxは削除
-- visualモードでのxは切り取り
map({ "n" }, "x", '"_x', opts)
map({ "n" }, "X", '"_X', opts)

-- ; と : の入れ替え
map({ "n", "v" }, ";", ":", opts)
map({ "n", "v" }, ":", ";", opts)

-- row select
map("n", "vv", "<S-v>", opts)

-- disable hilihgt
map({ "n", "x" }, "<leader>n", ":noh<CR>", opts)

-- replace
map("n", "<C-g>", ":%s///g<left><left><Left>", opts)

-- paste
map("i", "<C-v>", "<C-r>+", opts)

-- mark key bindings
map("n", "ml", "<Cmd>marks<CR>", opts)
map("v", "ml", "<Cmd>marks<CR>", opts)

-- funcitonkey bindings
map("n", "<F2>", ":set wrap!<CR>", opts)
map("n", "<F3>", ":set relativenumber!<CR>", opts)

-- no hilight
map("n", "<leader>n", "<Cmd>noh<CR>", opts)

-- comment
map("n", "<leader>/", "gcc", { remap = true, silent = true })
map("v", "<leader>/", "gc", { remap = true, silent = true })

-- explorer
map("n", "<C-e>", "<Cmd>Ex<CR>")
