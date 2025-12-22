{
  pkgs,
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.consuetudo.interface.niri.enable {
    environment.systemPackages = with pkgs; [
      xwayland-satellite # xwayland support
    ];
  };
}
