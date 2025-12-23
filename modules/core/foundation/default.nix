{ ... }:

{
  imports = [
    ./package-manager
    ./bluetooth.nix
    ./bootloader.nix
    ./hardware.nix
    ./gpu.nix
    ./lanzaboote.nix
    ./misc.nix
    ./network.nix
    ./security.nix
    ./system.nix
    ./stylix
    ./user.nix
  ];
}
