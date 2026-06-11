{ config, ... }:
{
    flake.modules.homeManager.cli-shell = { config, pkgs, ...}: {
        programs.zsh = {
            enable = true;

            dotDir = config.home.homeDirectory;

            enableCompletion = true;
            autosuggestion.enable = true;
            syntaxHighlighting.enable = true;

            history = {
                size = 10000;
                path = "$HOME/.zsh_history";
            };

            shellAliases = {
                ll = "eza -lah";
                ls = "eza";
                cat = "bat";
                v = "nvim";
            };

            initContent = ''
                bindkey '^[[A' history-search-backward
                bindkey '^[[B' history-search-forward

                eval "$(zoxide init zsh)"
            '';
        };

        programs.fzf = {
            enable = true;
            enableZshIntegration = true;
        };

        programs.zoxide.enable = true;

        home.packages = with pkgs; [
            eza
            bat
        ];
    };

    flake.modules.nixos.cli-shell = { pkgs, ... }: {
        environment.systemPackages = [ pkgs.zsh ];
    };
}
