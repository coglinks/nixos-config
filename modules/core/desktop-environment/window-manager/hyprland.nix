{ inputs, pkgs, ... }:

{
  programs.hyprland = {
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.default;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  xdg.portal.config.hyprland.default = [
    "gtk"
    "hyprland"
  ];
}
