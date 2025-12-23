{ lib, ... }:

{
  imports = [
    ./display-manager.nix
    ./sddm.nix
  ];

  services.xserver.displayManager.lightdm.enable = lib.mkForce false;
  programs.nano.enable = lib.mkForce false;
}
