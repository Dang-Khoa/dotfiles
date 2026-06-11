{ ... }:
{
  flake.modules.nixos.profile-nixos-base = { inputs, lib, ... }: {
    imports = [
      inputs.self.modules.nixos.system
      inputs.self.modules.nixos.cli
    ];

    nixpkgs.config.allowUnfree = lib.mkDefault true;
  };
}
