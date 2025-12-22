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
    ./../hardware-configuration-extra.nix
    ./gpu.nix
    ../../modules/core
  ];

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
