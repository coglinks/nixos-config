{
  pkgs,
  username,
  lib,
  ...
}:
{
  gtk = {
    enable = true;
    font = {
      name = lib.mkDefault "Maple Mono";
      size = lib.mkForce 12;
    };
    # theme = {
    #   name = "Colloid-Green-Dark-Gruvbox";
    #   package = pkgs.colloid-gtk-theme.override {
    #     colorVariants = [ "dark" ];
    #     themeVariants = [ "green" ];
    #     tweaks = [
    #       "gruvbox"
    #       "rimless"
    #       "float"
    #     ];
    #   };
    # };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}
