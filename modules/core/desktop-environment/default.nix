{ ... }:

{
  imports = [
    ./xserver.nix
    ./display-manager.nix
    ./qt.nix
    ./wayland.nix
  ];
}
