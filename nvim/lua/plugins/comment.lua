return {
	"numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()
      --[[ Keybinds:
      gcc to comment
      gbc for block comment (e.g. for lua)
      gc<motion> also possible ]]
  end,
}
