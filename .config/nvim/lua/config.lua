local noremap = { noremap = true }
local silent_noremap = { noremap = true, silent = true }

-- treesitter setuo
require('nvim-treesitter.configs').setup {
    auto_install = true,
    highlight = {
        enable = true,
    }
}

-- lsp setup
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local nvim_lsp = require('lspconfig')

local custom_on_attach = function()
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "<leader>dn", vim.lsp.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dp", vim.lsp.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
    vim.api.nvim_set_keymap("n", "<space>f", ":lua vim.lsp.buf.format()<cr>", silent_noremap)
end

nvim_lsp.gopls.setup {
    capabilities = capabilities,
    on_attach = custom_on_attach
}

nvim_lsp.volar.setup {
    capabilities = capabilities,
    filetypes = { "html", "vue", "javascript", "javascriptreact", "typescript", "typescriptreact" },
    on_attach = custom_on_attach,
    init_options = {
        typescript = {
            tsdk = '/usr/lib/node_modules/typescript/lib',
        }
    }
}

nvim_lsp.tsserver.setup {
    capabilities = capabilities,
    on_attach = custom_on_attach,
}

nvim_lsp.tailwindcss.setup {
    capabilities = capabilities,
    on_attach = custom_on_attach,
}

nvim_lsp.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = custom_on_attach,
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
    on_attach = custom_on_attach,
    filetypes = { 'terraform', 'tf' },
    cmd = { 'terraform-ls', 'serve' }
}

nvim_lsp.tflint.setup {
    capabilities = capabilities,
    on_attach = custom_on_attach,
    filetypes = { 'terraform', 'tf' },
    cmd = { 'tflint', '--langserver' },
}


require("luasnip.loaders.from_snipmate").load()

-- setup nvim-cmp
local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'copilot' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})


-- setup nvim-tree
require("nvim-tree").setup()

-- setup telescope
require("telescope").setup()

-- setup true-zen
require("true-zen").setup()

-- setup toto-comments
require("todo-comments").setup()

-- setup command_center
require("telescope").load_extension("command_center")

local command_center = require("command_center")

-- open command_center on F1
vim.api.nvim_set_keymap("n", "<c-P>", ":Telescope command_center<CR>", silent_noremap)

-- command_center keymaps
command_center.add({
    {
        desc = "Git add current file",
        cmd = "<CMD>Git add %<CR>",
        keys = {},
    },
    {
        desc = "Git commit",
        cmd = "<CMD>Git commit<CR>",
        keys = {},
    },
    {
        desc = "Git push",
        cmd = "<CMD>Git push<CR>",
        keys = {},
    },
    {
        desc = "npm run dev",
        cmd = "<CMD>NpmRun dev<CR>",
        keys = {},
    },
    {
        desc = "source current file",
        cmd = "<CMD>source %<CR>",
        keys = {},
    },
})

-- run command in background
local Job = require("plenary.job")

-- run npm run dev with plenary job
local function NpmRunAsync(cmd)
    local job = Job:new({
        command = "npm",
        args = { "run", cmd },
    })
    job:start()
end

return {
    NpmRunAsync = NpmRunAsync,
}
