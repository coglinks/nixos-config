{
  pkgs,
  lib,
  config,
  ...
}:

{
  config = lib.mkIf (config.consuetudo.wm == "niri") {
    environment.systemPackages = with pkgs; [
      xwayland-satellite # xwayland support
    ];
  };
}
