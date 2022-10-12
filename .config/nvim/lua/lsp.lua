-- lsp setup
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local nvim_lsp = require('lspconfig')

nvim_lsp.gopls.setup {
    capabilities = capabilities,
}

nvim_lsp.golangci_lint_ls.setup {
    capabilities = capabilities,
    init_options = {
        command = { "golangci-lint", "run", "--out-format", "json", "--enable-all", "--disable", "forbidigo,wsl,gci" },
    }
}

nvim_lsp.volar.setup {
    capabilities = capabilities,
    filetypes = { "html", "vue", "javascript", "javascriptreact", "typescript", "typescriptreact" },
    init_options = {
        typescript = {
            tsdk = '/usr/lib/node_modules/typescript/lib',
        }
    }
}

nvim_lsp.tsserver.setup {
    capabilities = capabilities,
}

nvim_lsp.tailwindcss.setup {
    capabilities = capabilities,
}

nvim_lsp.sumneko_lua.setup {
    capabilities = capabilities,
    cmd = { "/opt/lua-language-server/bin/lua-language-server" },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                globals = { 'vim' }
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                }
            }
        }
    }
}

vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
nvim_lsp.terraformls.setup {
    capabilities = capabilities,
    filetypes = { 'terraform', 'tf' },
    cmd = { 'terraform-ls', 'serve' }
}

nvim_lsp.tflint.setup {
    capabilities = capabilities,
    filetypes = { 'terraform', 'tf' },
    cmd = { 'tflint', '--langserver' },
}

nvim_lsp.bashls.setup {
    capabilities = capabilities,
}

nvim_lsp.rust_analyzer.setup {}
