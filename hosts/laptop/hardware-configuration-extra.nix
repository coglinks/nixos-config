{ ... }:

{
  boot.initrd.luks.devices."swap".device = "/dev/disk/by-uuid/4da29f8a-272e-4b96-bd6e-bae78ed5c1e3";
  boot.resumeDevice = "/dev/disk/by-uuid/98fcee9c-36c5-40bf-b35e-5d8fb09f4be8";
}
