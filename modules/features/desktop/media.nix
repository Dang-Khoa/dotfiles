{ ... }:
{
  flake.modules.homeManager.desktop-media = { pkgs, ... }: {
    home.packages = with pkgs; [
      imv
      mpv
      pavucontrol
      pulsemixer
    ];
  };

  flake.modules.nixos.desktop-media = { ... }: { };
}
