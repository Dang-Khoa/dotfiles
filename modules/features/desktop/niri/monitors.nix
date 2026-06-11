{ ... }: {
    flake.modules.homeManager.desktop-niri =  { config, ... }: {
        vars.monitor-left = "DP-1";
        vars.monitor-right = "DP-2";

        programs.niri.settings = {
            outputs = {
                "${config.vars.monitor-left}" = {
                    mode = { width = 2560; height = 1440; refresh = 144.000; };
                    position = { x = 0; y = 0; };
                    scale = 1.0;
                };

                "${config.vars.monitor-right}" = {
                    mode = { width = 2560; height = 1440; refresh = 164.999; };
                    position = { x = 2560; y = 0; };
                    scale = 1.0;
                };
            };
        };
    };
}
