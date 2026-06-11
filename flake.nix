{
    description = "Dendritic NixOS + Home Manager configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        flake-parts = {
            url = "github:hercules-ci/flake-parts";
            inputs.nixpkgs-lib.follows = "nixpkgs";
        };

        # Imports every .nix file below ./modules as a flake-parts module.
        # Files/directories starting with _ are ignored by import-tree.
        import-tree.url = "github:denful/import-tree";

        systems.url = "github:nix-systems/default-linux";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        niri = {
            url = "github:sodiboo/niri-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        noctalia = {
            url = "github:noctalia-dev/noctalia-shell";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        niri-float-sticky.url = "github:probeldev/niri-float-sticky";
        nvf.url = "github:notashelf/nvf";
    };

    outputs = inputs:
        inputs.flake-parts.lib.mkFlake { inherit inputs; } {
            imports = [
                # Required for flake.modules.nixos.* and flake.modules.homeManager.*.
                inputs.flake-parts.flakeModules.modules
                    (inputs.import-tree ./modules)
            ];

            systems = import inputs.systems;
        };
}
