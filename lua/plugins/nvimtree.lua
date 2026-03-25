vim.pack.add({
    {
        src = "https://github.com/nvim-tree/nvim-tree.lua",
        version = "master"
    },
    {
        src = "https://github.com/nvim-tree/nvim-web-devicons",
        version = "master"
    }
})

require('nvim-tree').setup({
    disable_netrw = true,
    hijack_netrw = true,
    view = {
        width = 30,
        side = "left",
        preserve_window_proportions = true,
        number = false,
        relativenumber = false
    },
    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = true,
        }
    },
    git = {
        enable = true,
        ignore = false,          -- 是否忽略 .gitignore 中的文件
    },
    filters = {
        dotfiles = false,        -- false 表示显示所有点文件
        custom = {"node_modules"} -- 只隐藏 node_modules 目录
    }
})

local tree = require('nvim-tree.api').tree

vim.keymap.set('n', '<leader>e', function()
  if tree.is_visible() then
    local tree_win = tree.winid()
    if vim.api.nvim_get_current_win() == tree_win then
      tree.close()   -- nvim-tree exists and in, close
    else
      tree.focus()   -- nvim-tree exists and not in, focus
    end
  else
    tree.open()      -- nvim-tree not exists
  end
end, { desc = "Toggle or focus file tree" })
