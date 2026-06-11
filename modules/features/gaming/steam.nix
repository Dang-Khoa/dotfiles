{ ... }: {
    flake.modules.nixos.gaming-steam = { pkgs, ... }: {
        hardware = {
            steam-hardware.enable = true;
        };

        programs.steam = {
            enable = true;
        };

        environment.systemPackages = with pkgs; [
            mangohud
            protonup-qt
        ];
    };

    flake.modules.homeManager.gaming-steam = { pkgs, lib, ... }: {
        vars.startups = lib.mkAfter [
            [ "xwayland-satellite" ":0" ]
        ];

        home.packages = with pkgs; [
            mangohud
            protonup-qt
            protontricks
            xwayland-satellite
        ];

        home.sessionVariables = {
            STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
        };
    };
 }
