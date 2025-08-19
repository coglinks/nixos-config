{ ... }:
{
  imports = [
    ./bootloader.nix
    ./display-manager.nix
    ./docker.nix
    ./hardware.nix
    ./xserver.nix
    ./lanzaboote.nix
    ./network.nix
    ./nh.nix
    ./nix.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./steam.nix
    ./system.nix
    ./flatpak.nix
    ./user.nix
    ./wayland.nix
    ./virtualization.nix
  ];
}
