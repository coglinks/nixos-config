{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
{
  options.consuetudo.programs.waylock = {
    enable = mkEnableOption "the foo program";

    package = mkOption {
      type = types.package;
      default = pkgs.waylock;
      defaultText = literalExpression "pkgs.waylock";
      description = "Waylock package";
    };
  };

  config = mkIf config.consuetudo.programs.waylock.enable {
    environment.systemPackages = with pkgs; [ waylock ];
  };
}
