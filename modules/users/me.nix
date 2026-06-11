{ ... }:
let
  username = builtins.getEnv "USER";
in
{
  flake.modules.homeManager.user-me = {
    home.username = username;
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "25.05";
  };
}
