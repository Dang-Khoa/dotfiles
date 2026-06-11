{ ... }:
{
    flake.modules.homeManager.cli = { inputs, ... }: {
        imports = [
            inputs.self.modules.homeManager.cli-core
            inputs.self.modules.homeManager.cli-git
            inputs.self.modules.homeManager.cli-shell
            inputs.self.modules.homeManager.cli-editor
            inputs.self.modules.homeManager.cli-multiplexer
        ];
    };

    flake.modules.nixos.cli = { inputs, ... }: {
        imports = [
            inputs.self.modules.nixos.cli-core
                inputs.self.modules.nixos.cli-git
                inputs.self.modules.nixos.cli-shell
                inputs.self.modules.nixos.cli-editor
                inputs.self.modules.nixos.cli-multiplexer
        ];
    };
}
