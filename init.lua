-- Use <Space> as a leaaer key
-- 
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.number = true
vim.o.relativenumber = false
vim.o.signcolumn = 'yes'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.wrap = false
vim.o.hlsearch = false
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.mouse = 'nvi'
vim.o.swapfile = false
vim.o.completeopt = 'menu,menuone,noinsert'
-- 设置普通模式、可视模式等为块状光标，插入模式为竖线光标
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

vim.g.mapleader = ' '
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30
vim.g.netrw_liststyle = 0

vim.o.ambiwidth = 'double'
vim.o.termguicolors = true
vim.g.terminal_emulator = 'vterm'
vim.cmd [[set guicursor=]]

vim.g.loaded_netrw=1
vim.g.loaded_netrwPlugin=1


-- ==           KEYMAPS              == --

-- 段落插入
vim.keymap.set({'n', 'x'}, '<leader>v', '<C-v>')
-- Copy/paste using system clipboard
vim.keymap.set({'n', 'x'}, 'gy', '"+y')
vim.keymap.set({'n', 'x'}, 'gp', '"+p')

-- Exit Neovim
vim.keymap.set('n', '<leader>q', '<cmd>quitall<cr>')
vim.keymap.set('n', '<leader>Q', '<cmd>quitall!<cr>')

-- Save file
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')

-- enable diagnostics for inlay hints and stuff
vim.diagnostic.config({
  virtual_text = {
    source = 'if_many',
  },
  float = {
    severity_sort = true,
    focusable = true,
  },
  underline = true,
  signs = true,
  update_in_insert = true,
})

-- ===========
--   Vim.Pack
-- ===========
-- Default Dir: `.local/share/nvim/site/pack/core/opt`

-- == Theme ==
-- Dracula
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

-- == Treesitter ==
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

-- == Mason ==
vim.pack.add({
  {
    src="https://github.com/mason-org/mason.nvim",
    version="main"
  },
})
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}
vim.lsp.config['lua_ls']={
  --root_dir=vim.fn.getcwd(),
  settings={
    Lua={diagnostics={globals={"vim"}}}
  }
}
vim.lsp.enable('lua_ls')

vim.lsp.config['pyright'] = {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_marker = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', 'pyrightconfig.json', '.git' },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = 'openFilesOnly',
        useLibraryCodeForTypes = true,
        reportAttributeAccessIssue = 'none',
      }
    }
  }
}
vim.lsp.enable('pyright')

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


--[[
local opts = { buffer = bufnr, remap = false }
local on_attach = function(client,bufnr)
      vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = bufnr })
      vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Reference" }))
      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Definition" }))
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, vim.tbl_deep_extend("force", opts, { desc = "LSP Hover" }))
      vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, vim.tbl_deep_extend("force", opts, { desc = "LSP Workspace Symbol" }))
      vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.setloclist() end, vim.tbl_deep_extend("force", opts, { desc = "LSP Show Diagnostics" }))
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, vim.tbl_deep_extend("force", opts, { desc = "Next Diagnostic" }))
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, vim.tbl_deep_extend("force", opts, { desc = "Previous Diagnostic" }))
      vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, vim.tbl_deep_extend("force", opts, { desc = "LSP Code Action" }))
      vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, vim.tbl_deep_extend("force", opts, { desc = "LSP References" }))
      vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, vim.tbl_deep_extend("force", opts, { desc = "LSP Rename" }))
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, vim.tbl_deep_extend("force", opts, { desc = "LSP Signature Help" }))
end

vim.lsp.config('*',{
  on_attach=on_attach,
})
]]--


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
        width=30,
        side="left",
        preserve_window_proportions=true,
        number=false,
        relativenumber=false
    },
    actions = {
        open_file={
            quit_on_open=false,
            resize_window=true,
        }
    },
    git = {
        enable = true,
        ignore = false,
    },
    filters = {
        dotfiles = false,
        custom = {"node_modules", ".git"}
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

-- == Lualine ==
vim.pack.add({
    { 
        src = "https://github.com/nvim-lualine/lualine.nvim",
        version = "master"
    }
})
require('lualine').setup({
    options = {
        theme = 'tomorrow_night'
    }
})

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
      fuzzy = true,                    -- 启用模糊匹配
      override_generic_sorter = true,  -- 覆盖通用排序器
      override_file_sorter = true,     -- 覆盖文件排序器
      case_mode = "smart_case",        -- 智能大小写
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
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

