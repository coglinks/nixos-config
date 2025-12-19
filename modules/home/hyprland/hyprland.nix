{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    swww
    hyprpolkitagent
    inputs.hypr-contrib.packages.${pkgs.stdenv.hostPlatform.system}.grimblast
    inputs.hyprpicker.packages.${pkgs.stdenv.hostPlatform.system}.hyprpicker
    gradia
    # nwg-displays
    copyq
    grim
    slurp
    wlogout
    wl-clip-persist
    cliphist
    wf-recorder
    glib
    wayland
    direnv
  ];
  wayland.windowManager.hyprland = {
    enable = false;
    package = null;
    portalPackage = null;

    xwayland = {
      enable = true;
      # hidpi = true;
    };
    # enableNvidiaPatches = false;
    systemd.enable = true;
    # monitor-rules
    extraConfig = lib.mkOrder 1500 ''
      source = ./monitors.conf
      source = ./workspaces.conf
    '';
  };
}
