{ ... }:
{
  flake.modules.nixos.hardware-amd-cpu = { config, lib, ... }: {
    hardware.enableRedistributableFirmware = lib.mkDefault true;
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
