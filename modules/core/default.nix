{ ... }:
{
  imports = [
    ../secrets
    ./winapps
    ./gotenberg.nix
    ./fonts.nix
    ./docker.nix
    ./hardware.nix
    ./xserver.nix
    ./network.nix
    ./nh.nix
    # ./nix.nix
    ./qt.nix
    ./pipewire.nix
    ./program.nix
    ./taskchampion.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./flatpak.nix
    ./user.nix
    ./styling
    ./wayland.nix
    ./virtualization.nix
  ];
}
