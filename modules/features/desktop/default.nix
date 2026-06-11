{ ... }:
{
  flake.modules.homeManager.desktop = { inputs, ... }: {
    imports = [
      inputs.self.modules.homeManager.desktop-vars

      inputs.self.modules.homeManager.desktop-wayland
      inputs.self.modules.homeManager.desktop-niri
      inputs.self.modules.homeManager.desktop-browser
      inputs.self.modules.homeManager.desktop-terminal
      inputs.self.modules.homeManager.desktop-media
      inputs.self.modules.homeManager.desktop-noctalia
      inputs.self.modules.homeManager.desktop-apps
    ];
  };

  flake.modules.nixos.desktop = { inputs, ... }: {
    imports = [
      inputs.self.modules.nixos.desktop-wayland
      inputs.self.modules.nixos.desktop-niri
      inputs.self.modules.nixos.desktop-browser
      inputs.self.modules.nixos.desktop-terminal
      inputs.self.modules.nixos.desktop-media
      inputs.self.modules.nixos.desktop-noctalia
      inputs.self.modules.nixos.desktop-apps
    ];
  };
}
