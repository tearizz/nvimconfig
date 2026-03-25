vim.pack.add({
    {
        src = "https://github.com/nvim-telescope/telescope.nvim",
        version = "master"
    },
    {
        src = "https://github.com/nvim-lua/plenary.nvim",
        version = "master"
    },
    {
        src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
        version = "master"
    }
})

require('telescope').setup({
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
})

-- Compile in local first
-- cd ~/.local/share/nvim/site/pack/*/start/telescope-fzf-native.nvim
-- make
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
-- Install ripgrep first: sudo apt install ripgrep
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = 'Telescope grep string' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

