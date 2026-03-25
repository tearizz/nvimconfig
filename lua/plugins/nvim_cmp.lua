-- nvim-cmp completion (LuaSnip snippets + LSP completion)
-- Keeping your LSP keymaps separate via insert-mode cmp mappings only.

vim.pack.add({
  { src = "https://github.com/hrsh7th/nvim-cmp", version = "main" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp", version = "main" },
  { src = "https://github.com/hrsh7th/cmp-buffer", version = "main" },
  { src = "https://github.com/L3MON4D3/LuaSnip", version = "main" },
  { src = "https://github.com/saadparwaiz1/cmp_luasnip", version = "main" },
  { src = "https://github.com/rafamadriz/friendly-snippets", version = "main" },
})

-- If cmp dependencies aren't installed yet, don't break startup/LSP.
local ok_cmp, cmp_mod = pcall(require, "cmp")
local ok_cmp_lsp, cmp_nvim_lsp_mod = pcall(require, "cmp_nvim_lsp")
local ok_luasnip, luasnip_mod = pcall(require, "luasnip")
if not (ok_cmp and ok_cmp_lsp and ok_luasnip) then
  vim.schedule(function()
    vim.notify("nvim-cmp deps not ready; skipping cmp setup", vim.log.levels.WARN)
  end)
  return
end

cmp = cmp_mod
cmp_nvim_lsp = cmp_nvim_lsp_mod
luasnip = luasnip_mod

pcall(function()
  require("luasnip.loaders.from_vscode").lazy_load()
end)

-- Inject cmp capabilities into your LSP wrapper (vim.lsp._set_defaults must be called early).
pcall(function()
  local base = vim.lsp.protocol.make_client_capabilities()
  local capabilities = cmp_nvim_lsp.default_capabilities(base)
  vim.lsp._set_defaults({ capabilities = capabilities })
end)

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
  }),
})

