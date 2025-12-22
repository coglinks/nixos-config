{ pkgs, config, ... }:
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

  services.displayManager.sddm.enable = true;
  programs.niri.enable = true;
  consuetudo.programs.waylock.enable = true;
}
