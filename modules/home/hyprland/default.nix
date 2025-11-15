{ inputs, ... }:
{
  imports = [
    ./hyprland.nix
    ./config.nix
    ./packages.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./variables.nix
    ./plugins
    inputs.hyprland.homeManagerModules.default
  ];
}
