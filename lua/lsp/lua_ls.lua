vim.lsp.config['lua_ls']={
    cmd = { "lua-language-server"}, -- Language Server Name
    settings={
        Lua={diagnostics={globals={"vim"}}},
    },
}
vim.lsp.enable('lua_ls')
