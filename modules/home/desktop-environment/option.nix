{ lib, ... }:

{
  options.consuetudo = {
    wm.enable = lib.mkEnableOption "Additional setup for window managers";
  };
}
