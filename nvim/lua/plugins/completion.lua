return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "rafamdritz/friendly-snippets",
      }
    }
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    local cmp_mappings = cmp.mapping.preset.insert({
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp.mapping(function (fallback)
          if luasnip.expandable() then
              luasnip.expand()
          elseif cmp.visible() then
              cmp.select_next_item()
          elseif luasnip.jumpable(1) then
              luasnip.jump(1)
          else
              fallback()
          end
      end), 
      ['<S-Tab>'] = cmp.mapping(function (fallback)
          if cmp.visible() then
              cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
          else
              fallback()
          end
      end, {'i', 's'}),
      ['<C-Space>'] =  cmp.mapping.complete(),
    })

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end
      },
      sources = {
        { name = "nvim-lsp" },
        { name = "path" },
        { name = "luasnip" },
        { name = "buffer" },
      },
      mapping = cmp_mappings,
    })

    -- make sure to load plugins ASAP
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
