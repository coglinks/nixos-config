{
  lib,
  config,
  ...
}:
with lib;
{
  config = mkIf config.consuetudo.programs.waylock.enable {
    security.pam.services.waylock = { };
  };
}
