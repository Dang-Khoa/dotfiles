{ ... }: {
    flake.modules.homeManager.gaming = { inputs, ... }: {
        imports = [
            inputs.self.modules.homeManager.gaming-steam
        ];
    };

    flake.modules.nixos.gaming = { inputs, ... }: {
        imports = [
            inputs.self.modules.nixos.gaming-steam
        ];
    };
}
