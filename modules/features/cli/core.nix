{ ... }:
{
  flake.modules.homeManager.cli-core = { lib, pkgs, ... }: {
    home.packages = with pkgs; [
      bat
      btop
      curl
      dust
      eza
      fd
      file
      fzf
      htop
      jq
      less
      ripgrep
      tree
      unzip
      wget
      yq
      zip
      zoxide
    ];

    home.sessionVariables = {
      PAGER = lib.mkDefault "less";
    };

    programs.home-manager.enable = true;
    xdg.enable = true;
  };

  flake.modules.nixos.cli-core = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      curl
      git
      vim
      wget
    ];
  };
}
