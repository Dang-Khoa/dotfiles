{ ... }:
{
    flake.modules.homeManager.cli-nvim =
    { ... }:
    {
        programs.nvf = {
            settings.vim = {
                globals = {
                    mapleader = " ";
                };

                keymaps = [
                    # Copy/Paste mechanics
                        {
                        key = "<leader>y";
                        mode = [ "v" ];
                        action = "\"+y";
                        desc = "Copy visual selection to system clipboard";
                    }
                    {
                        key = "<leader>Y";
                        mode = [ "v" ];
                        action = "\"+Y";
                        desc = "Copy line to system clipboard";
                    }
                    {
                        key = "<leader>p";
                        mode = [ "x" ];
                        action = "\"_dP";
                        desc = "Pasting without deleting from register";
                    }
                    {
                        key = "<leader>d";
                        mode = [ "n" "v" ];
                        action = "\"_d";
                        desc = "Deleting without saving to register";
                    }

                    # QoL adjustments to basic keybindings
                    {
                        key = "J";
                        mode = [ "n" ];
                        action = "mzJ`z";
                        desc = "Join lines while preserving cursor position";
                    }
                    {
                        key = "J";
                        mode = [ "v" ];
                        action = ":m '>+1<CR>gv=gv";
                        desc = "Move selected lines down";
                    }
                    {
                        key = "K";
                        mode = [ "v" ];
                        action = ":m '<-2<CR>gv=gv";
                        desc = "Move selected lines up";
                    }
                    {
                        key = "<C-d>";
                        mode = [ "n" ];
                        action = "<C-d>zz";
                        desc = "Page down + center screen";
                    }
                    {
                        key = "<C-u>";
                        mode = [ "n" ];
                        action = "<C-u>zz";
                        desc = "Page up + center screen";
                    }
                    {
                        key = "n";
                        mode = [ "n" ];
                        action = "nzzzv";
                        desc = "Next search result and center it + open fold";
                    }
                    {
                        key = "N";
                        mode = [ "n" ];
                        action = "Nzzzv";
                        desc = "Previous search result and center it + open fold";
                    }

                    # QoL adjustments
                    {
                        key = "Q";
                        mode = [ "n" ];
                        action = "<nop>";
                        desc = "Disable Ex mode (nobody wants that ancient vim mode)";
                    }
                    {
                        key = "<C-c";
                        mode = [ "i" ];
                        action = "<Esc>";
                        desc = "Ctr+C to exit insert mode";
                    }
                    {
                        key = "-";
                        mode = [ "n" ];
                        action = ":Ex<CR>";
                        desc = "Go to folder view";
                    }

                    # Additional functionalities
                    { 
                        key = "<leader>f";
                        mode = [ "n" ];
                        action = "vim.lsp.buf.format";
                        desc = "Format current buffer using the active LSP";
                    }
                    { 
                        key = "<leader>x";
                        mode = [ "n" ];
                        action = "<cmd>!chmod +x %<CR>";
                        silent = true;
                        desc = "Make current file executable";
                    }
                    {
                        key = "<leader>s";
                        mode = [ "n" ];
                        action = ":%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>";
                        desc = "Search and replace for current word"; 
                    }
                    {
                        key = "<leader>u";
                        mode = [ "n" ];
                        action = "require('undetree')().toggle()";
                        desc = "Search and replace for current word"; 
                    }
                ];
            };
        };
    };
}
