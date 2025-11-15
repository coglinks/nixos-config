{ inputs, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hyprtasking.packages.${pkgs.stdenv.hostPlatform.system}.hyprtasking
    ];
    settings = {
      hyprtasking = {
        layout = "grid";
        gap_size = 0;
        bg_color = "0xff26233a";
        border_size = 1;
        gestures = {
          enabled = false;
          open_fingers = 3;
          open_distance = 300;
          open_positive = true;
        };
        grid = {
          rows = 3;
          cols = 3;
        };
        linear = {
          height = 400;
          scroll_speed = 1.1;
          blur = 0;
        };
      };
      bind = [
        "SUPER, A, hyprtasking:toggle, cursor"
        "SUPER SHIFT, A, hyprtasking:toggle, all"
        "SUPER SHIFT, H, hyprtasking:move, left"
        "SUPER SHIFT, J, hyprtasking:move, down"
        "SUPER SHIFT, K, hyprtasking:move, up"
        "SUPER SHIFT, L, hyprtasking:move, right"
        "SUPER, X, hyprtasking:killhovered"
      ];
    };
  };
}
