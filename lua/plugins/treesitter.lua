vim.pack.add({
  {
    src="https://github.com/nvim-treesitter/nvim-treesitter.git",
    name="nvim-treesitter",
    version="master"
  }
})

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    'lua','go','c','python','bash'
  },
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})
