vim.lsp.config['gopls'] = {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, { 'go.work', 'go.mod', '.git' }) or vim.fn.getcwd()
    on_dir(root)
  end,
  settings = {
    gopls = {
      -- 这些设置主要是增强静态检查/提示；不依赖额外插件。
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
}

vim.lsp.enable('gopls')