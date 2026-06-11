{ ... }:
{
    flake.modules.homeManager.cli-nvim = { ... }: {
        programs.nvf.settings.vim = {
            lsp.enable = true;
            treesitter = { 
                enable = true;
                indent = { enable = false; };
            };

            languages = {
                nix.enable = true;
                typescript.enable = true;
                python.enable = true;
            };
        };
    };
}
