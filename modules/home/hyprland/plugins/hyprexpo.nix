{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [ inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo ];

    settings = {
      plugin.hyprexpo = {
        rows = 3;
        columns = 3;

        gap_size = 0;
        bg_col = "rgb(a89984)";
        workspace_method = "first 1";
        enable_gesture = true; # laptop touchpad
        gesture_fingers = 3; # 3 or 4
        gesture_distance = 300; # how far is the "max"
        gesture_positive = false; # positive = swipe down. Negative = swipe up.
      };
    };

    extraConfig = ''
      # hyprlang noerror true
      bind=$mainMod, tab, hyprexpo:expo, toggle
      # hyprlang noerror false
    '';
  };
}
