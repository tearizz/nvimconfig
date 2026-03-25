-- lua/core/lsp_keymaps.lua
local function map(bufnr, mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local client_id = args.data.client_id
    local client = client_id and vim.lsp.get_client_by_id(client_id) or nil

    -- 如果你想用内置 LSP 补全（不依赖 cmp），建议打开 omnifunc
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

    map(bufnr, 'n', 'K', vim.lsp.buf.hover, 'LSP: Hover')

    map(bufnr, 'n', 'gd', vim.lsp.buf.definition, 'LSP: Goto definition')
    map(bufnr, 'n', 'gr', vim.lsp.buf.references, 'LSP: Goto references')
    map(bufnr, 'n', 'gI', vim.lsp.buf.implementation, 'LSP: Goto implementation')
    map(bufnr, 'n', 'gt', vim.lsp.buf.type_definition, 'LSP: Goto type definition')

    map(bufnr, 'n', '<leader>rn', function()
      vim.lsp.buf.rename()
    end, 'LSP: Rename')

    map(bufnr, 'n', '<leader>ca', function()
      vim.lsp.buf.code_action()
    end, 'LSP: Code action')

    -- 诊断信息（不依赖具体 LSP）
    map(bufnr, 'n', '[d', vim.diagnostic.goto_prev, 'Diag: Prev')
    map(bufnr, 'n', ']d', vim.diagnostic.goto_next, 'Diag: Next')
    map(bufnr, 'n', '<leader>ds', vim.diagnostic.open_float, 'Diag: Show')

    -- 只有当 server 提供格式化能力时才绑定 format，避免“看似可用但实际失败”
    if client and client.server_capabilities
      and client.server_capabilities.documentFormattingProvider then
      map(bufnr, 'n', '<leader>f', function()
        vim.lsp.buf.format({ async = true })
      end, 'LSP: Format')
    end
  end,
})
