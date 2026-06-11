{ config, ... }: {
    flake.modules.homeManager.desktop-niri =  { config, ... }: {
        programs.niri.settings = {
            spawn-at-startup =  
                map (cmd: { command = cmd; }) config.vars.startups;
        };
    };
}
