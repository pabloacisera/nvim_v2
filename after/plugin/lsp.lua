-- Mason setup
require("mason").setup()

-- Mason-LSPconfig setup
require("mason-lspconfig").setup({
  ensure_installed = {
    "phpactor",  -- PHP
    "ts_ls",     -- TypeScript y JavaScript
    "html",      -- HTML
    "cssls",     -- CSS
    "sqlls",     -- SQL
    "jsonls",    -- JSON
    "emmet_ls",  -- Emmet
  },
})

-- LSPconfig
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Configuración genérica para todos los servidores
local function on_attach(client, bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap

  -- Atajos básicos (aplicados al buffer actual)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
end

-- Configuración por servidor
local servers = {
  phpactor = {},  -- PHP
  ts_ls = {},     -- TypeScript y JavaScript
  html = {},      -- HTML
  cssls = {},     -- CSS
  sqlls = {},     -- SQL
  jsonls = {},    -- JSON
  emmet_ls={},
}

for server, config in pairs(servers) do
  lspconfig[server].setup(vim.tbl_deep_extend("force", {
    capabilities = capabilities,
    on_attach = on_attach,
  }, config))
end

-- Emmet
lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
})

-- CMP setup (autocompletado)
local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
  }),
  formatting = {
    format = lspkind.cmp_format({ with_text = true, maxwidth = 50 }),
  },
})

