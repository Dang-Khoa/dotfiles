{ ... }:
{
  flake.modules.nixos.desktop-niri = { inputs, lib, pkgs, ... }: {
    imports = [ inputs.niri.nixosModules.niri ];

    programs.niri.enable = lib.mkDefault true;

    services.greetd = {
      enable = lib.mkDefault true;
      settings.default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
        user = "greeter";
      };
    };

    environment.systemPackages = [ pkgs.tuigreet ];
  };

  flake.modules.homeManager.desktop-niri = { config, pkgs, ... }: { };
}
