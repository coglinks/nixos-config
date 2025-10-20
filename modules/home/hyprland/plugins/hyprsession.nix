{
  inputs,
  lib,
  pkgs,
  ...
}:

{
  home.packages = [
    inputs.hyprsession.packages.${pkgs.system}.hyprsession
  ];

  wayland.windowManager.hyprland.settings = lib.mkOrder 1000 {
    exec-once = [
      "hyprsession"
    ];
  };
}
