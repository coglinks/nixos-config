{ ... }:

{
  boot.initrd.luks.devices."swap".device = "/dev/disk/by-uuid/ac4f82cf-2f7a-4554-a2fd-3c1a4d421c62";
  boot.resumeDevice = "/dev/dm-0";
}
