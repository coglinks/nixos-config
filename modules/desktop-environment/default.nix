{ ... }:

{
  imports = [
    ./variables.nix
    ./packages.nix
    ./xdg.nix
    ./xserver.nix
    ./window-manager
    ./lockscreen
  ];
}
