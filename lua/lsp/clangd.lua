-- clangd for C/C++
-- Requires `clangd` binary in $PATH.
vim.lsp.config['clangd'] = {
  cmd = { 'clangd', '--background-index' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  root_dir = function(bufnr, on_dir)
    -- Prefer CMake build artifacts when available.
    local root = vim.fs.root(bufnr, {
      'compile_commands.json',
      'compile_flags.txt',
      '.git',
    }) or vim.fn.getcwd()
    on_dir(root)
  end,
  single_file_support = true,
}

vim.lsp.enable('clangd')

