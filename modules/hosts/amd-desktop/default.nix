{ inputs, ... }:
let
  hostname = "amd-desktop";
  username = "k";
  fullName = "K";
  system = "x86_64-linux";
  stateVersion = "25.05";

  nixosProfile = inputs.self.modules.nixos.profile-nixos-workstation;
  desktopProfile = inputs.self.modules.homeManager.profile-desktop-full;
in
{
  flake.nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
    inherit system;

    specialArgs = {
      inherit inputs;
    };

    modules = [
      inputs.home-manager.nixosModules.home-manager
      inputs.self.modules.nixos.hosts-amd-desktop

      nixosProfile

      {
        networking.hostName = hostname;
        system.stateVersion = stateVersion;

        nixpkgs.config.allowUnfree = true;

        users.users.${username} = {
          isNormalUser = true;
          description = fullName;
          extraGroups = [
            "audio"
            "networkmanager"
            "video"
            "wheel"
          ];
        };

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs; };

          users.${username} = {
            imports = [ desktopProfile ];

            home.username = username;
            home.homeDirectory = "/home/${username}";
            home.stateVersion = stateVersion;
          };
        };
      }
    ];
  };
}
