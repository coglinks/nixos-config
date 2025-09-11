{
  inputs,
  username,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    inputs.xremap-flake.nixosModules.default
  ];

  services.xremap = {
    withHypr = true;
    userName = "${username}";
    config = {
      keymap = [
        {
          name = "main remaps";
          remap = {
            super-y = {
              # launch = [ "${lib.getExe' pkgs.swaynotificationcenter "swaync-client"} --hide-all" ];
              # launch = [ "${lib.getExe' pkgs.libnotify "notify-send"} xremap" ];
              launch = [ "${pkgs.libnotify}/bin/notify-send xremap" ];
            };
          };
        }
      ];
    };
  };
}
