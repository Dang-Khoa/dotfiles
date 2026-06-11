{ ... }: {
    flake.modules.homeManager.desktop-niri = { inputs, pkgs, lib, ... }: {
        home.packages = [
            inputs.niri-float-sticky.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];

        vars.startups = lib.mkAfter [
            [
                "niri-float-sticky"
                "-app-id" "^firefox$"
                "-title" "^Picture-in-Picture$"
            ]
        ];

        programs.niri.settings = {
            window-rules = [
                {
                    matches = [
                        { app-id = "dev.noctalia.Noctalia.Settings"; }
                    ];
                    open-floating = true;
                    default-column-width  = { fixed = 1080; };
                    default-window-height  = { fixed = 920; };
                }
                {
                    matches = [
                        { app-id = "^firefox$"; title="^Picture-in-Picture$"; }
                    ];
                    open-floating = true;
                }
                {
                    matches = [
                        { app-id = "^steam_app_[0-9]+$"; }
                    ];
                    open-fullscreen = true;
                }
                {
                   matches = [
                        { app-id = "^Alacritty$"; }
                   ];
                   default-column-width = { proportion = 0.5; };
                }
            ];
        };
    };
}
