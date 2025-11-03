{ ... }:
{
  imports = [
    ../secrets
    ./fish.nix
    ./btop.nix
    ./openssh.nix
    ./winapps
    ./gotenberg.nix
    ./fonts.nix
    ./docker.nix
    ./hardware.nix
    ./network.nix
    ./nh.nix
    ./nix.nix
    ./pipewire.nix
    ./gitolite.nix
    ./program.nix
    ./taskchampion.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./flatpak.nix
    ./user.nix
    ./styling
    ./virtualization.nix
  ];
}
