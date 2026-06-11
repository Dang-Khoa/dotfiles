# Dendritic NixOS + Home Manager configuration

This layout follows the dendritic pattern:

```text
modules/
  features/
    cli/          # CLI feature leaves + category module: modules.{nixos,homeManager}.cli
    desktop/      # Desktop feature leaves + category module: modules.{nixos,homeManager}.desktop
    hardware/     # Hardware feature leaves + category module: modules.nixos.hardware-*
    system/       # Base OS feature leaves + category module: modules.nixos.system
  profiles/
    nixos/        # NixOS profiles: compose OS/system/hardware modules
    desktop/      # Home Manager profiles: compose user desktop/tool modules
  hosts/
    amd-desktop/  # Concrete host: chooses one NixOS profile + one desktop profile
```

## Design rules

- A feature file owns its capability and package list.
- Category modules expose submodule groups such as `self.modules.nixos.cli` and `self.modules.homeManager.cli`.
- NixOS profiles compose system, hardware, and NixOS desktop capabilities.
- Desktop profiles compose Home Manager capabilities and are installable standalone.
- Hosts select exactly one NixOS profile and one desktop/Home Manager profile.
- There is no `meta` module. Host-specific values live in the host module; standalone HM profile values live in the HM profile output.

## Build the NixOS host

```sh
sudo nixos-rebuild switch --flake .#amd-desktop
```

The `amd-desktop` host uses:

- `self.modules.nixos.profile-nixos-workstation`
- `self.modules.homeManager.profile-desktop-full`

The workstation NixOS profile includes AMD CPU microcode and AMDGPU/Mesa graphics defaults.

## Build only Home Manager

Minimal desktop/tool profile:

```sh
home-manager switch --flake .#k@desktop-minimal
```

Full desktop/tool profile:

```sh
home-manager switch --flake .#k@desktop-full
```

## Cleanup
Delete all older generations
```sh
sudo nix-collect-garbage -d
```

Optimize store
```sh
sudo nix-store --optimise
```

