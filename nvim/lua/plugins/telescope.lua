return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- for performance
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            }
          }
        }
      })

      telescope.load_extension("fzf");

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
      vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
      vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>pws", function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })
            end)
    end,
  },
}
