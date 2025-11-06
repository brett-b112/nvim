-- =========================
-- LSP Zero + Mason + CMP Setup
-- =========================

local lsp_zero = require('lsp-zero')

-- Attach function for LSP keymaps
lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  -- LSP keymaps
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- Customize diagnostic signs
lsp_zero.set_sign_icons({
  error = '✘',
  warn  = '▲',
  hint  = '⚑',
  info  = '»'
})

-- =========================
-- Mason Setup
-- =========================
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'ts_ls', 'rust_analyzer', 'pyright', 'pylsp', 'clangd', 'eslint'},
})

-- =========================
-- LSP Config using new API
-- =========================
local servers = {
  -- key = server_name, value = optional config table
  lua_ls = lsp_zero.nvim_lua_ls(),  -- special lua setup
  pyright = {
    settings = {
      python = {
        pythonPath = "/usr/local/bin/python3"
      }
    }
  },
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = { "W291", "W391", "E501" },
            maxLineLength = 120,
          },
          flake8 = { ignore = { "W291", "W391", "E501" } },
          mccabe = { enabled = false },
          pyflakes = { enabled = true },
          pylsp_mypy = { enabled = true },
        }
      }
    }
  },
  tsserver = {},
  rust_analyzer = {},
  clangd = {},
  eslint = {},
}

-- Apply the configuration and enable servers
for server, config in pairs(servers) do
  vim.lsp.config(server, vim.tbl_extend("force", {
    on_attach = lsp_zero.on_attach,
  }, config))
end

-- Enable all servers
vim.lsp.enable(vim.tbl_keys(servers))

-- =========================
-- CMP Setup
-- =========================
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})

