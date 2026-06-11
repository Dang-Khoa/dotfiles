{ inputs, ... }:
let
system = "x86_64-linux";
in
{
    flake.modules.homeManager.profile-desktop-full = { inputs, ... }: {
        imports = [
            inputs.self.modules.homeManager.profile-desktop-minimal
                inputs.self.modules.homeManager.desktop
                inputs.self.modules.homeManager.gaming
                inputs.self.modules.homeManager.pentesting
        ];

        fonts.fontconfig.enable = true;
    };

    flake.homeConfigurations.desktop-full =
        inputs.home-manager.lib.homeManagerConfiguration {
            pkgs = inputs.nixpkgs.legacyPackages.${system};

            extraSpecialArgs = {
                inherit inputs;
            };

            modules = [
                inputs.self.modules.homeManager.user-me
                    inputs.self.modules.homeManager.profile-desktop-full
            ];
        };
}
