{ ... }:
{
    flake.modules.homeManager.cli-nvim = { pkgs, ... }: {
        programs.nvf.settings.vim = {
            lazy.plugins = {
# Hide .env content with * (:CloakDisable to disable)
                "cloak.nvim" = {
                    package = pkgs.vimPlugins.cloak-nvim;
                };

                "vim-fugitive" = {
                    package = pkgs.vimPlugins.vim-fugitive;
                };

                "harpoon" = 
                {
                    package = pkgs.vimPlugins.harpoon;
                    keys = [
                        {
                            key = "<leader>ha";
                            mode = [ "n" ];
                            action = ":lua require('harpoon.mark').add_file()<CR>"; 
                        }
                        {
                            key = "<leader>he";
                            mode = [ "n" ];
                            action = ":lua require('harpoon.ui').toggle_quick_menu()<CR>";
                        }
                        {
                            key = "<leader>hh";
                            mode = [ "n" ];
                            action = ":lua require('harpoon.ui').nav_file(1)<CR>";
                        }
                        {
                            key = "<leader>ht";
                            mode = [ "n" ];
                            action = ":lua require('harpoon.ui').nav_file(2)<CR>";
                        }
                        {
                            key = "<leader>hn";
                            mode = [ "n" ];
                            action = ":lua require('harpoon.ui').nav_file(3)<CR>";
                        }
                        {
                            key = "<leader>hs";
                            mode = [ "n" ];
                            action = ":lua require('harpoon.ui').nav_file(4)<CR>";
                        }
                    ];
                };

                "telescope.nvim" = {
                    package = pkgs.vimPlugins.telescope-nvim;
                    keys = [
                        {
                            key = "<leader>ff";
                            mode = [ "n" ];
                            action = ":lua require('telescope.builtin').find_files()<CR>";
                        }
                        {
                            key = "<leader>fg";
                            mode = [ "n" ];
                            action = ":lua require('telescope.builtin').git_files()<CR>";
                        }
                        {
                            key = "<leader>fs";
                            mode = [ "n" ];
                            action = ":lua require('telescope.builtin').grep_string()<CR>";
                        }
                    ];
                };

                "trouble.nvim" = {
                    package = pkgs.vimPlugins.trouble-nvim;
                };
            };
        };
    };
}

