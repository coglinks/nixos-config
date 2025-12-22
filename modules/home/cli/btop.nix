{ ... }:

{
  programs.btop = {
    enable = true;
    package = null;

    settings = {
      # color_theme = "TTY";
      theme_background = false;
      update_ms = 500;
      rounded_corners = false;
    };
  };
}
