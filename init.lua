-- open nvim init.lua file
vim.api.nvim_create_user_command("InitLua", function()
    vim.cmd.edit(vim.fn.stdpath("config") .. "/init.lua")
end, {})


if not vim.g.vscode then
    require("option")
    require("keymap")
    require("plugin")
else
    require("code")
end
