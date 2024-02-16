local opts = {
    ensure_instaled = {
        "efm",
        "lua_ls",
    },
    automatic_installation = true
}

local config = function()
    local lspconfig = require ("lspconfig")

    lspconfig.lua_ls.setup({
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" }, 
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    }
                }
            }
        }
    })

    local luacheck = require("efmls-configs.linters.luacheck")
    local stylua = require("efmls-configs.formatters.stylua")

    lspconfig.efm.setup({
        filetypes = {
            "lua",
        },
        init_options = {
            documentFormatting = true,
            documentRangeFormatting = true,
            hover = true,
            documentsSymbol = true,
            codeAction = true,
            completion = true
        },
        settings = {
            languages = {
                lua = { luacheck, stylua },
            }
        }
    })

    local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGRoup", {})
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = lsp_fmt_group,
        callback = function()
            local efm = vim.lsp.get_active_clients({ name = "efm" })

            if vim.tbl_isempty(efm) then 
                return 
            end
            vim.lsp.buf.format({ name = "efm" })
        end
    })
end

return {
    "neovim/nvim-lspconfig",
    config = config,
    lazy = false,
    dependencies = {
        "windwp/nvim-autopairs",
        "williamboman/mason.nvim",
        "creativenull/efmls-configs-nvim"
    }
}
