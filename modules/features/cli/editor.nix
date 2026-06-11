{ ... }:
{
  flake.modules.homeManager.cli-editor = { inputs, lib, pkgs, ... }: {
    imports = [
        inputs.self.modules.homeManager.cli-nvim
    ];
  };

  flake.modules.nixos.cli-editor = { ... }: {
    environment.systemPackages = [ ];
  };
}
