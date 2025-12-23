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

  consuetudo = {
    # gpu.name = "hybrid-intel-nvidia";

    wm = {
      enable = true;
    };
    services.enable = true;

  };

  home-manager.users.${username} = {
    consuetudo = {
      wm = {
        enable = true;
      };
    };

    programs.niri.enable = true;
    wayland.windowManager.hyprland.enable = false;

  };

  programs.niri.enable = true;
  programs.hyprland.enable = false;

  services.displayManager.sddm.enable = true;
}
