{ lib, config, ... }:

{
  options.consuetudo.services = {
    enable = lib.mkEnableOption "Service packages";
  };

  config = lib.mkIf config.options.consuetudo.services {
    imports = [
      ./services
    ];
  };
}
