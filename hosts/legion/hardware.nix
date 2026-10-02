{
  config,
  inputs,
  modulesPath,
  ...
}:
let
  inherit (inputs) nixos-hardware;
in
{
  imports = [
    inputs.self.lib.rootTree.data.modules.nixosHardware.content
    # (modulesPath + "/installer/scan/not-detected.nix")
    (nixos-hardware + "/common/cpu/intel/tiger-lake")
    (nixos-hardware + "/common/gpu/nvidia/ampere")
    (nixos-hardware + "/common/gpu/nvidia/prime.nix")
    (nixos-hardware + "/common/pc/laptop")
    (nixos-hardware + "/common/pc/ssd")
  ];

  boot = {
    kernelParams = [
      "acpi_osi=Linux"
    ];
    initrd.availableKernelModules = [
      "thunderbolt"
      "usb_storage"
    ];
    extraModulePackages = [ config.boot.kernelPackages.lenovo-legion-module ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/91149b90-4b16-4917-87d5-43dd1117f526";
      fsType = "ext4";
      options = [
        "noatime"
        "nodiratime"
      ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/7071-D829";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024;
    }
  ];

  hardware = {
    nvidia.prime = {
      intelBusId = "PCI:00:02:0";
      nvidiaBusId = "PCI:01:00:0";
    };
  };
}
