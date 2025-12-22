{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  config = lib.mkIf (config.consuetudo.wm == "hyprland") {

    programs.hyprland = {
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.default;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    xdg.portal.config.hyprland.default = [
      "gtk"
      "hyprland"
    ];

  };
}
