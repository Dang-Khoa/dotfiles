{ ... }:
{
    flake.modules.homeManager.desktop-apps = { pkgs, inputs, lib, ... }: {
        home.packages = with pkgs; [
            google-chrome
            discord
            telegram-desktop
        ];
    };

    flake.modules.nixos.desktop-apps = { ... }: { };
}

