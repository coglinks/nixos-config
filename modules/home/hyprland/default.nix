{ inputs, ... }:
{
  imports = [
    ./hyprland.nix
    ./config.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./variables.nix
    ./plugins
    inputs.hyprland.homeManagerModules.default
  ];
}
