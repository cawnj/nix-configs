# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "uhci_hcd" "ehci_pci" "ata_piix" "mptsas" "usbhid" "sd_mod" "sr_mod" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "zroot/nixos";
      fsType = "zfs";
    };

  fileSystems."/nix" =
    { device = "zroot/nixos/store";
      fsType = "zfs";
    };

  # zfs create -o dedup=off -o mountpoint=legacy -o recordsize=4K  zroot/postgres
  fileSystems."/zroot/postgres" =
    { device = "zroot/postgres";
      fsType = "zfs";
    };

  # zfs create -o mountpoint=legacy  zroot/git
  fileSystems."/zroot/git" =
    { device = "zroot/git";
      fsType = "zfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/0b075b97-42b6-4444-a16f-8f0e86aae318";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/ef73ba2c-7169-4b77-aa5b-7b9f31f21a3f"; }
    ];

  nix.maxJobs = lib.mkDefault 16;
}
