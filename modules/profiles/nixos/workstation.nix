{ ... }:
{
  flake.modules.nixos.profile-nixos-workstation = { inputs, lib, ... }: {
    imports = [
      inputs.self.modules.nixos.profile-nixos-base
      inputs.self.modules.nixos.hardware-workstation
      inputs.self.modules.nixos.desktop
      inputs.self.modules.nixos.gaming
    ];

    services.printing.enable = lib.mkDefault true;
  };
}
