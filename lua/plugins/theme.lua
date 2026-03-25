vim.pack.add({
  {
    src="https://github.com/Mofiqul/dracula.nvim",
    name="dracula",
    version="main"
  },
})
require('dracula').setup({
    transparent_bg=true
})

-- set theme
local ok_theme = pcall(function()
  vim.cmd('colorscheme dracula-soft')
  --vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
end)
if not ok_theme then
  vim.o.termguicolors = false
  vim.cmd('colorscheme defaulat')
end
