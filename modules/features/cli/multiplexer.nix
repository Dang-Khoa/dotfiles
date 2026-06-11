{ pkgs, ... }: {
    flake.modules.homeManager.cli-multiplexer = { pkgs, ... }: {
        programs.tmux = {
            enable = true;

            terminal = "tmux-256color";
            keyMode = "vi";
            mouse = true;
            escapeTime = 0;
            historyLimit = 100000;

            plugins = with pkgs.tmuxPlugins; [
                sensible            # set of basic settings
                jump                # jump vim like
                better-mouse-mode   # mouse scroll
                yank                # yank selected text (prefix + y)
                tmux-fzf            # session switcher (fuzzy find)
                catppuccin           # Catppuccin theme
                dotbar
                {
                    plugin = resurrect;
                    extraConfig = ''
                        set -g @resurrect-strategy-vim "session"
                        set -g @resurrect-strategy-nvim "session"
                        set -g @resurrect-capture-pane-contents "on"
                        '';
                }
                {
                    plugin = continuum;
                    extraConfig = ''
                        set -g @continuum-restore "on"
                        set -g @continuum-save-interval "10"
                        '';
                }
            ];

            extraConfig = ''
                # Copy with vi-like copy mode
                set -g set-clipboard on
                set -g mode-keys vi
                bind-key -T copy-mode-vi v send -X begin-selection
                bind-key -T copy-mode-vi V send -X select-line
                bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel 'pbcopy'

                # Tmux-fingers keybind
                set -g @super-fingers-key "Space"

                # Vim keybindings
                # vim-tmux-naviator plug related stuff
                is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
                | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"

                bind -n 'C-h' if-shell "$is_vim" "send-keys C-h" "select-pane -L"
                bind -n 'C-j' if-shell "$is_vim" "send-keys C-j" "select-pane -D"
                bind -n 'C-k' if-shell "$is_vim" "send-keys C-k" "select-pane -U"
                bind -n 'C-l' if-shell "$is_vim" "send-keys C-l" "select-pane -R"
                bind -n 'C-\' if-shell "$is_vim" "send-keys C-\\" "select-pane -l"

                tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
                if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
                "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
                if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
                "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

                bind-key -T copy-mode-vi 'C-h' select-pane -L
                bind-key -T copy-mode-vi 'C-j' select-pane -D
                bind-key -T copy-mode-vi 'C-k' select-pane -U
                bind-key -T copy-mode-vi 'C-l' select-pane -R
                bind-key -T copy-mode-vi C-\\ select-pane -l

                # Auto renumber windows on close
                set -g renumber-windows on
                '';
        };

        home.packages = with pkgs; [
            wl-clipboard
        ];
    };

    flake.modules.nixos.cli-multiplexer = { pkgs, ... }: {
        environment.systemPackages = [ pkgs.tmux ];
    };
}
