# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:
let
  common = import ../../common/variables.nix;
in {
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "uhci_hcd" "ehci_pci" "ata_piix" "megaraid_sas" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/753b1b37-a04b-4808-862e-a6116b02b48a";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/712eeccf-195e-4fda-b717-9882ac1848dc";
      fsType = "ext4";
    };

  fileSystems."/gstorage/brick1/gvhomes" = common.zfsMountConfig "zbrick1/gvhomes";
  fileSystems."/gstorage/brick2/gvhomes" = common.zfsMountConfig "zbrick2/gvhomes";
  fileSystems."/gstorage/brick3/gvhomes" = common.zfsMountConfig "zbrick3/gvhomes";

  fileSystems."/gstorage/brick1/gvwebtree" = common.zfsMountConfig "zbrick1/gvwebtree";
  fileSystems."/gstorage/brick2/gvwebtree" = common.zfsMountConfig "zbrick2/gvwebtree";
  fileSystems."/gstorage/brick3/gvwebtree" = common.zfsMountConfig "zbrick3/gvwebtree";

  swapDevices =
    [ { device = "/dev/disk/by-uuid/66307090-88b1-4467-acfe-a22c2a06e2ce"; }
    ];

  nix.maxJobs = lib.mkDefault 8;
}
