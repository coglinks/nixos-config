{ lib, config, ... }:

{
  options.consuetudo = {
    cli = {
      enable = lib.mkEnableOption "Service packages";
    };

    services = {
      enable = lib.mkEnableOption "Service packages";
    };
  };

  config =
    (lib.mkIf config.consuetudo.cli.enable {
    })
    // (lib.mkIf config.consuetudo.services {
      virtualisation.docker.enable = true;
      # consuetudo.programs.gitolite.enable = true;
      services = {
        davfs2.enable = false;
        gotenberg.enable = true;
        nextcloud.enable = true;
        taskchampion-sync-server.enable = true;
      };
    });
}
