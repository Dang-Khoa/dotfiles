{ ... }:
{
  flake.modules.nixos.hardware-bluetooth = { lib, ... }: {
    hardware.bluetooth = {
      enable = lib.mkDefault true;
      powerOnBoot = lib.mkDefault true;
      settings.General.Experimental = lib.mkDefault true;
    };

    services.blueman.enable = lib.mkDefault true;
  };
}
