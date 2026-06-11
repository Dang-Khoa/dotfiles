{ config, ... }:
{
  flake.modules.homeManager.desktop-terminal = { ... }: {
    vars.terminal = [ "alacritty" ];

    programs.alacritty = {
      enable = true;
    };
  };

  flake.modules.nixos.desktop-terminal = {...}: {};
}
