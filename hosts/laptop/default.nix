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
    interface.niri.enable = true;
    services.enable = true;
  };

  home-manager.users.${username} = {
    consuetudo = {
      interface.niri.enable = true;
    };
  };
}
