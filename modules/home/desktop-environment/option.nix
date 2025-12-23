{ lib, ... }:

{
  options.consuetudo = {
    wm = lib.mkOption {
      enable = lib.mkEnableOption "Additional setup for window managers";
    };
  };
}
