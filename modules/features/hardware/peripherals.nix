{ ... }:
{
    flake.modules.nixos.hardware-peripherals = { ... }: {
        users.groups.plugdev = {};
        users.users.k.extraGroups = [ "plugdev" ];

        services.udev.extraRules = ''
            SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="3710", MODE="0660", GROUP="plugdev"
            SUBSYSTEM=="hidraw*", ATTRS{idVendor}=="3710", MODE="0660", GROUP="plugdev"
            SUBSYSTEM=="hidraw", ATTRS{idVendor}=="45d4", ATTRS{idProduct}=="0428", MODE="0666"
        ''; 
    };
}
