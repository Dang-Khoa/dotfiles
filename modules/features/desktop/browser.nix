{ ... }:
{
  flake.modules.homeManager.desktop-browser = { inputs, pkgs, ... }: {
    home.packages = with pkgs; [
      firefox
    ];
  };

  flake.modules.nixos.desktop-browser = { ... }: {
    # Browser packages are intentionally user-level. This placeholder lets
    # desktop profiles import the category uniformly for NixOS if needed later.
  };
}
