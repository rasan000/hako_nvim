return {
    {
        'ixru/nvim-markdown',
        ft = 'markdown',
        config = function()
            -- disable preview
            vim.g.vim_markdown_conceal = 0
        end
    }
}
