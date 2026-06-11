{ ... }:
{
  flake.modules.nixos.system-networking = { lib, ... }: {
    networking.networkmanager.enable = lib.mkDefault true;
    networking.useDHCP = lib.mkDefault true;

    services.resolved.enable = lib.mkDefault true;
  };
}
