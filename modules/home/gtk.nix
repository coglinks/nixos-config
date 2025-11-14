{ pkgs, lib, ... }:
{
<<<<<<< HEAD
||||||| 7b9b95fa
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-cove
    nerd-fonts.symbols-only
    twemoji-color-font
    noto-fonts-emoji
    fantasque-sans-mono
    maple-mono.truetype-autohint
  ];

=======
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-cove
    nerd-fonts.symbols-only
    twemoji-color-font
    noto-fonts-color-emoji
    fantasque-sans-mono
    maple-mono-custom
  ];

>>>>>>> refs/remotes/foundation/main
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
<<<<<<< HEAD
      package = pkgs.papirus-icon-theme;
||||||| 7b9b95fa
      package = pkgs.papirus-icon-theme.override { color = "black"; };
=======
      package = pkgs.papirus-icon-theme.override { color = "green"; };
>>>>>>> refs/remotes/foundation/main
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
