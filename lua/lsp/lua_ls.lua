vim.lsp.config['lua_ls']={
    --on_attach = on_attach,
    settings={
        Lua={diagnostics={globals={"vim"}}},
    },
}
vim.lsp.enable('lua_ls')
