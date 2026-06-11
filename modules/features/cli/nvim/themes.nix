{ ... }:
{
  flake.modules.homeManager.cli-nvim = { ... }: {
    programs.nvf.settings.vim.theme = {
        enable = true;
        name = "rose-pine";
        style = "main";
    };
  };
}
