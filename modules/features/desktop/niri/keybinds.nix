{ ... }: {
  flake.modules.homeManager.desktop-niri =  { config, lib, ... }: {
        programs.niri.settings = {
            workspaces = {
                "left-1".open-on-output = config.vars.monitor-left;
                "left-2".open-on-output = config.vars.monitor-left;
                "left-3".open-on-output = config.vars.monitor-left;
                "left-4".open-on-output = config.vars.monitor-left;
                "left-5".open-on-output = config.vars.monitor-left;
                "right-1".open-on-output = config.vars.monitor-right;
                "right-2".open-on-output = config.vars.monitor-right;
                "right-3".open-on-output = config.vars.monitor-right;
                "right-4".open-on-output = config.vars.monitor-right;
                "right-5".open-on-output = config.vars.monitor-right;
            };

            hotkey-overlay.skip-at-startup = true;

            binds = {
                # Spawn applications
                "Mod+Return".action.spawn = config.vars.terminal; 
                "Mod+Space".action.spawn = config.vars.launcher;
                "Mod+Comma".action.spawn = config.vars.settings;
                "Alt+Shift+L".action.spawn = config.vars.screen-lock;
                "Mod+Shift+S".action.spawn = [ "niri" "msg" "action" "screenshot" ];

                # Window manipulation
                "Mod+F".action.maximize-column = {};
                "Mod+Shift+F".action.fullscreen-window = {};
                "Mod+Ctrl+F".action.expand-column-to-available-width = {};
                "Mod+V".action.toggle-window-floating = {};
                "Mod+CTRL+V".action.switch-focus-between-floating-and-tiling = {};
                "Mod+C".action.center-column = {};
                "Mod+Minus".action.set-column-width = "-10%";
                "Mod+Plus".action.set-column-width = "+10%";
                "Mod+Q".action.close-window = {};
                "Mod+O" = {
                    repeat = false;
                    action.toggle-overview = {};
                };
                "Mod+Escape" = { # Escape hatch (for applications inhibit keyboard) 
                    allow-inhibiting = false;
                    action.toggle-keyboard-shortcuts-inhibit = {}; 
                };

                # Window Focus
                "Mod+H".action.focus-column-or-monitor-left = {};
                "Mod+L".action.focus-column-or-monitor-right = {};
                "Mod+J".action.focus-window-or-workspace-down = {};
                "Mod+K".action.focus-window-or-workspace-up = {};

                # Window Movement
                "Mod+Shift+H".action.move-column-left-or-to-monitor-left = {};
                "Mod+Shift+L".action.move-column-right-or-to-monitor-right = {};
                "Mod+Shift+J".action.move-window-up-or-to-workspace-up = {};
                "Mod+Shift+K".action.move-window-down-or-to-workspace-down = {};


                # Workspace Focus
                "Mod+1".action.focus-workspace = "left-1";
                "Mod+3".action.focus-workspace = "left-2";
                "Mod+5".action.focus-workspace = "left-3";
                "Mod+7".action.focus-workspace = "left-4";
                "Mod+9".action.focus-workspace = "left-5";

                "Mod+0".action.focus-workspace = "right-1";
                "Mod+2".action.focus-workspace = "right-2";
                "Mod+4".action.focus-workspace = "right-3";
                "Mod+6".action.focus-workspace = "right-4";
                "Mod+8".action.focus-workspace = "right-5";

                # Workspace Movement
                "Mod+Shift+1".action.move-window-to-workspace = "left-1";
                "Mod+Shift+3".action.move-window-to-workspace = "left-2";
                "Mod+Shift+5".action.move-window-to-workspace = "left-3";
                "Mod+Shift+7".action.move-window-to-workspace = "left-4";
                "Mod+Shift+9".action.move-window-to-workspace = "left-5";

                "Mod+Shift+0".action.move-window-to-workspace = "right-1";
                "Mod+Shift+2".action.move-window-to-workspace = "right-2";
                "Mod+Shift+4".action.move-window-to-workspace = "right-3";
                "Mod+Shift+6".action.move-window-to-workspace = "right-4";
                "Mod+Shift+8".action.move-window-to-workspace = "right-5";

                # Media/Audio controls
                "XF86AudioRaiseVolume" = {
                  allow-when-locked = true;
                  action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+ -l 1.0";
                };

                "XF86AudioLowerVolume" = {
                  allow-when-locked = true;
                  action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
                };

                "XF86AudioMute" = {
                  allow-when-locked = true;
                  action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                };

                "XF86AudioMicMute" = {
                  allow-when-locked = true;
                  action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
                };

                "XF86AudioPlay" = {
                  allow-when-locked = true;
                  action.spawn-sh = "playerctl play-pause";
                };

                "XF86AudioPause" = {
                  allow-when-locked = true;
                  action.spawn-sh = "playerctl play-pause";
                };

                "XF86AudioStop" = {
                  allow-when-locked = true;
                  action.spawn-sh = "playerctl stop";
                };

                "XF86AudioPrev" = {
                  allow-when-locked = true;
                  action.spawn-sh = "playerctl previous";
                };

                "XF86AudioNext" = {
                  allow-when-locked = true;
                  action.spawn-sh = "playerctl next";
                };
            };
        };
    };
}
