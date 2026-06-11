{ ... }:
{
    flake.modules.homeManager.desktop-noctalia = { pkgs, inputs, lib, ... }: {
        vars.launcher = [ "noctalia" "msg" "panel-toggle" "launcher" ];
        vars.screen-lock = [ "sh" "-c" "playerctl pause; noctalia msg session lock" ];
        vars.settings = [ "noctalia" "msg" "settings-toggle" ];
        vars.startups = lib.mkAfter [ 
            [ "noctalia" ]
        ];

        home.packages = [
            inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
    };

    flake.modules.nixos.desktop-noctalia = { ... }: { };
}
