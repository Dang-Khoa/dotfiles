{ config, lib, modulesPath, ... }: {
		flake.modules.nixos.hosts-amd-desktop = { lib, modulesPath, config, ... }: {
		imports = [
			(modulesPath + "/installer/scan/not-detected.nix")
		];

		boot = {
			loader = {
				systemd-boot.enable = true;
				efi.canTouchEfiVariables = true;
			};

			initrd = {
				availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
				kernelModules = [ ];
			};

			kernelModules = [ "kvm-amd" ];
			extraModulePackages = [ ];
		};
	
		fileSystems."/" = { 
			device = "/dev/disk/by-uuid/a570e807-51b6-4296-936d-88c76589900f";
			fsType = "ext4";
		};

		fileSystems."/boot" = { 
			device = "/dev/disk/by-uuid/E12E-CDDA";
			fsType = "vfat";
			options = [ "fmask=0077" "dmask=0077" ];
		};

		swapDevices = [ 
			{ device = "/dev/disk/by-uuid/0e093d51-805a-418a-bc8d-75075005268b"; }
		];

		nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
		hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
	};
}
