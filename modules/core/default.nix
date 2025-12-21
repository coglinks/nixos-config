{ ... }:
{
  imports = [
    ./lix.nix
    ../secrets
    ./shells
    ./btop.nix
    ./openssh.nix
    ./winapps
    ./fonts.nix
    ./hardware.nix
    ./nh.nix
    ./nix.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./system.nix
    ./flatpak.nix
    ./user.nix
    ./virtualization.nix
  ];
}
