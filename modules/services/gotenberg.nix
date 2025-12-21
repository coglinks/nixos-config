{
  pkgs,
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.services.gotenberg.enable {
    services.gotenberg = {
      extraFontPackages = with pkgs; [
        corefonts
        vista-fonts
      ];
    };
  };
}
