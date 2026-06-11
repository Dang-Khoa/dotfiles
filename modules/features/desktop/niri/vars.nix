{ ... }: {
    flake.modules.homeManager.desktop-niri = { lib, ... }: {
        options.vars = {
            monitor-left = lib.mkOption {
                type = lib.types.str;
                description= "Left monitor in dual-monitor setup";
            };

            monitor-right = lib.mkOption {
                type = lib.types.str;
                description= "Right monitor in dual-monitor setup";
            };
        };
    };
}
