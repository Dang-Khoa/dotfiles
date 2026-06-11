{ ... }:
{
  flake.modules.nixos.hardware-amd-gpu = { lib, pkgs, ... }: {
    hardware.graphics = {
      enable = lib.mkDefault true;
      enable32Bit = lib.mkDefault true;

      extraPackages = with pkgs; [
        mesa
        libva
        libva-vdpau-driver
        libvdpau-va-gl
        usbutils
      ];
    };

    services.xserver.videoDrivers = lib.mkDefault [ "amdgpu" ];

    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = lib.mkDefault "radeonsi";
      VDPAU_DRIVER = lib.mkDefault "radeonsi";
    };
  };
}
