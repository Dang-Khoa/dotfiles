{ ... }:
{
  flake.modules.nixos.hardware-amd = { inputs, ... }: {
    imports = [
      inputs.self.modules.nixos.hardware-amd-cpu
      inputs.self.modules.nixos.hardware-amd-gpu
      inputs.self.modules.nixos.hardware-peripherals
    ];
  };

  flake.modules.nixos.hardware-workstation = { inputs, ... }: {
    imports = [
      inputs.self.modules.nixos.hardware-amd
      inputs.self.modules.nixos.hardware-bluetooth
    ];
  };
}
