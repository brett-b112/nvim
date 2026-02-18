return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        -- Disable treesitter highlighting for all buffers
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function(args)
                pcall(vim.treesitter.stop, args.buf)
            end,
        })

        require("nvim-treesitter").setup({
            ensure_installed = { "python", "javascript", "c", "lua", "vim", "vimdoc", "query", "vue", "html", "css" },
            auto_install = true,
            highlight = { enable = false },
        })
    end,
}
