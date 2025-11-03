{ lib, ... }:

{
  qt = {
    enable = true;
    style = "adwaita";
    platformTheme = lib.mkForce "gnome";
  };
}
