{ inputs, ... }:
let
  system = "x86_64-linux";
in
{
  # Import the relevant home-manager modules for a minimal desktop setup
  flake.modules.homeManager.profile-desktop-minimal = { inputs, ... }: {
    imports = [
      inputs.self.modules.homeManager.cli
    ];
  };


  # Expose the minimal desktop setup for home-manager installation 
  flake.homeConfigurations."desktop-minimal" =
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.${system};

      extraSpecialArgs = {
        inherit inputs;
      };

      modules = [
        inputs.self.modules.homeManager.user-me
        inputs.self.modules.homeManager.profile-desktop-minimal
      ];
    };
}
