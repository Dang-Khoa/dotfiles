return {
  "akinsho/toggleterm.nvim",
  opts = {
    size = vim.o.lines *  0.2,
    open_mapping = [[<leader>tt]],
    hide_numbers = true,
    shade_terminals = false,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell,
    autochdir = true,
    highlights = {
      NormalFloat = {
        link = "Normal",
      },
      FloatBorder = {
        link = "FloatBorder",
      },
    },
    float_opts = {
      border = "rounded",
      height = math.ceil(vim.o.lines * 1.0 - 4),
      width = math.ceil(vim.o.columns * 1.0),
      winblend = 0,
    },
  },
}
