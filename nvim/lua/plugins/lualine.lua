return {
	"nvim-lualine/lualine.nvim",
  dependencies = {
    "folke/noice.nvim"
  },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = {
          {
            'branch',
          }
        },
        lualine_b =  {{ 'diagnostics' }},
        lualine_z = {
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff9e64" },
          }
        },
      }
    }
  end,
}
