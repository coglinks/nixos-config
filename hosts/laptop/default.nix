{
  pkgs,
  config,
  username,
  ...
}:
{
  imports = [
    ./fixes.nix
    ./hardware-configuration.nix
    ../../modules/core
  ];

  services.displayManager.sddm.enable = true;
  services.desktopManager.gnome.enable = true;

  consuetudo = {
    wm = "niri";
    lock = "hyprlock";
    services.enable = true;
  };

  home-manager.users.${username} = {
    consuetudo = {
      wm = "niri";
      lock = "hyprlock";
    };
  };
}
