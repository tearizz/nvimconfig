vim.pack.add({
    {
        src="https://github.com/lewis6991/gitsigns.nvim",
        version="main"
    }
})

require('gitsigns').setup({
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '│' },
    topdelete    = { text = 'x ' }, -- 文件顶部的删除会显示在第一行
    changedelete = { text = '~ ' }, -- 同一个hunk内，既有被删除的行，也有被替换的行
    untracked    = { text = '┆' },
  },
  numhl = false,
  -- blame infovim.keymap.set
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 500,
    ignore_whitespace = false,
  },
  --
  update_debounce = 100,
  max_file_length = 40000,
  preview_config = {
    border = 'single',  -- preview blame style
  },

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- show diff
    map('n', '<leader>hp', gs.preview_hunk, 'Preview Hunk') -- show diff in a small window
    map('n', '<leader>hd', gs.diffthis, 'Diff This')    -- show diff in new file
    map('n', '<leader>hs', gs.toggle_deleted, 'Toggle Deleted') -- show diff on screen

    -- show blame
    map('n', '<leader>bw', function() gs.blame_line({ full = true }) end, 'Blame Line')
    map('n', '<leader>bf', gs.blame, 'Blame Buffer')
    map('n', '<leader>bl', gs.toggle_current_line_blame, 'Toggle Line Blame')   -- 在行后显示blame
  end,
})

