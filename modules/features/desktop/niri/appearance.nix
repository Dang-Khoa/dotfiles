{ ... }: {
  flake.modules.homeManager.desktop-niri =  { config, ... }: {
        programs.niri.settings = {
            layout = {
                focus-ring = {
                    width = 4; 
                    active = { color = "#7fc8ff"; }; 
                    inactive = { color = "#505050"; };
                };
                
                shadow = {
                    softness = 30;
                    spread = 5;
                    offset = { x = 0; y = 5; };
                    color = { color = "#000000"; };
                };
            };

            window-rules = [
                {
                    matches = [ { } ]; # matches all windows
                    clip-to-geometry = true;
                    geometry-corner-radius = {
                        top-left = 8.0;
                        top-right = 8.0;
                        bottom-left = 8.0;
                        bottom-right = 8.0;
                    };                
                }
            ];
        };
    };
}
