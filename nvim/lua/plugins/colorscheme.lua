return { 
	"catppuccin/nvim", 
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme catppuccin")
		require("catppuccin").setup({
			disable_background = true,
      cmp = true,
      mason = true,
      native_lsp = {
        enable = true,
        inlay_hints = {
          background = false
        }
      },
      telescope = {
        enable = true,
      }
		})
	end
}
