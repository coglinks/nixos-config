<<<<<<< HEAD
{ inputs, pkgs, lib, ... }:
||||||| 7b9b95fa
{ inputs, pkgs, ... }:
=======
{ pkgs, ... }:
>>>>>>> refs/remotes/foundation/main
{
  home.packages = with pkgs; [
    swww
<<<<<<< HEAD
    hyprpolkitagent
    inputs.hypr-contrib.packages.${pkgs.stdenv.hostPlatform.system}.grimblast
    inputs.hyprpicker.packages.${pkgs.stdenv.hostPlatform.system}.hyprpicker
    gradia
    # nwg-displays
    copyq
||||||| 7b9b95fa
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    inputs.hyprpicker.packages.${pkgs.system}.hyprpicker
=======
    grimblast
    hyprpicker
>>>>>>> refs/remotes/foundation/main
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
    enable = true;
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
