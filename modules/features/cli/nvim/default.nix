{ ... }:
{
    flake.modules.homeManager.cli-editor = { config, inputs, lib, ... }: {
        imports = [
            inputs.nvf.homeManagerModules.default
        ];

        home.sessionVariables.EDITOR = lib.mkDefault "nvim";

        programs.nvf = {
            enable = true;
            enableManpages = true;

            settings.vim = {
                viAlias = true;
                vimAlias = true;

                clipboard = {
                    enable = true;
                    registers = "unnamedplus";
                };

                options = {
                    termguicolors = true;

                    tabstop = 4;
                    shiftwidth = 4;
                    softtabstop = 4;
                    expandtab = true;
                    smartindent = true;

                    hlsearch = false;
                    incsearch = true;

                    swapfile = false;
                    backup = false;
                    undodir = "${config.home.homeDirectory}/.vim/undodir";  # save undo history in file
                    undofile = true;

                    scrolloff = 8;
                    signcolumn = "yes";
                    updatetime = 200;
                };
            };
        };
    };
}
