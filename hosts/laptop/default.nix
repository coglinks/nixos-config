{ pkgs, config, ... }:
{
  imports = [
    ./fixes.nix
    ./hardware-configuration.nix
    ./../hardware-configuration-extra.nix
    ./gpu.nix
    ../../modules
  ];

  consuetudo = {
    interface.niri.enable = true;
    services.enable = true;
  };
}
