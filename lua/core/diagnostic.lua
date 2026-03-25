vim.diagnostic.config({
  virtual_text = {
    spacing = 2,
    source = 'if_many',
  },
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  float = {
    severity_sort = true,
    focusable = true,
    border = 'rounded',
    source = true,
  },
})
