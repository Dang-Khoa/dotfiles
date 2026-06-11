{ ... }:
{
  flake.modules.nixos.desktop-wayland = { lib, pkgs, ... }: {
    services.dbus.enable = lib.mkDefault true;
    services.upower.enable = lib.mkDefault true;
    services.power-profiles-daemon.enable = lib.mkDefault true;

    xdg.portal = {
      enable = lib.mkDefault true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.common.default = lib.mkDefault [ "gtk" ];
    };

    environment.systemPackages = [ pkgs.xdg-desktop-portal-gtk ];
  };

  flake.modules.homeManager.desktop-wayland = { lib, pkgs, ... }: {
    home.packages = with pkgs; [
      brightnessctl
      grim
      libnotify
      playerctl
      slurp
      wl-clipboard
      xdg-utils
    ];

    services.mako.enable = lib.mkDefault true;
  };
}
