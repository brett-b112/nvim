return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        -- Install parsers for these languages
        local parsers = { "python", "javascript", "c", "lua", "vim", "vimdoc", "query", "vue", "html", "css" }
        local installed = require("nvim-treesitter").get_installed()
        local to_install = vim.tbl_filter(function(p)
            return not vim.tbl_contains(installed, p)
        end, parsers)
        if #to_install > 0 then
            require("nvim-treesitter").install(to_install)
        end
    end,
}
