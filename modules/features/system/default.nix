{ ... }:
{
  flake.modules.nixos.system = { inputs, ... }: {
    imports = [
      inputs.self.modules.nixos.system-base
      inputs.self.modules.nixos.system-networking
      inputs.self.modules.nixos.system-audio
    ];
  };
}
