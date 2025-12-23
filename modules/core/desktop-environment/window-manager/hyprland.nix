{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  hyprland-pkgs = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  config = lib.mkIf (config.programs.hyprland.enable) {

    programs.hyprland = {
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.default;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    xdg.portal.config.hyprland.default = [
      "gtk"
      "hyprland"
    ];

    hardware.graphics = {
      package = hyprland-pkgs.mesa;
    };

  };
}
