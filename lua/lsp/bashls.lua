-- need shellcheck by mason
vim.lsp.config['bashls'] = {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'sh', 'bash', 'zsh' },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, { '.git', '.bashrc', '.shellcheckrc' }) or vim.fn.getcwd()
    on_dir(root)
  end,
  single_file_support = true,
  settings = {
    bashIde = {
      globPattern = '**/*@(.sh|.inc|.bash|.command)',
      enableSourceErrorDiagnostics = true,
      highlightParsingErrors = true,
      includeAllWorkspaceSymbols = true,
      shellcheckPath = 'shellcheck',
      explainshellEndpoint = '',
    }
  }
}
vim.lsp.enable('bashls')

