{ ... }:
{
  imports = [
    ./bootloader.nix
    ./gotenberg.nix
    ./fonts.nix
    ./gaming.nix
    ./display-manager.nix
    ./docker.nix
    ./hardware.nix
    ./xserver.nix
    ./lanzaboote.nix
    ./network.nix
    ./nh.nix
    # ./nix.nix
    ./qt.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./steam.nix
    ./printer.nix
    ./system.nix
    ./flatpak.nix
    ./user.nix
    ./styling
    ./wayland.nix
    ./virtualization.nix
  ];
}
