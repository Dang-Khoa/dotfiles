return { 
	"catppuccin/nvim", 
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme catppuccin")
		require("catppuccin").setup({
			disable_background = true
		})
	end
}
