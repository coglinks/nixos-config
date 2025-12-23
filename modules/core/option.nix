{
  lib,
  config,
  ...
}:

{
  options.consuetudo = {

    wm.enable = lib.mkEnableOption "Desktop environment packages";

    services.enable = lib.mkEnableOption "Service packages";

  };

  config = lib.mkIf config.consuetudo.services.enable {
    virtualisation.docker.enable = true;
    consuetudo.programs.gitolite.enable = true;
    services = {
      davfs2.enable = false;
      gotenberg.enable = true;
      nextcloud.enable = true;
      taskchampion-sync-server.enable = true;
    };
  };
}
