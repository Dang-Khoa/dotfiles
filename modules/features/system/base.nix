{ ... }:
{
  flake.modules.nixos.system-base = { lib, pkgs, ... }: {
    imports = [
      # Keep the NixOS profile self-contained: importing this feature enables
      # the Home Manager NixOS integration, but users are configured by hosts.
    ];

    nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };

    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };

    boot.loader.systemd-boot.enable = lib.mkDefault true;
    boot.loader.efi.canTouchEfiVariables = lib.mkDefault true;

    time.timeZone = lib.mkDefault "Europe/Berlin";
    i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";

    console.keyMap = lib.mkDefault "de";

    security.sudo.wheelNeedsPassword = lib.mkDefault false;

    programs.zsh.enable = true;

    users.defaultUserShell = pkgs.zsh;

    environment.systemPackages = with pkgs; [
      curl
      git
      vim
      wget
    ];
  };
}
