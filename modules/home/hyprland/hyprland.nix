{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    swww
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    inputs.hyprpicker.packages.${pkgs.system}.hyprpicker
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
  };
}
