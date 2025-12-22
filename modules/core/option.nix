{
  lib,
  username,
  config,
  ...
}:

{
  options.consuetudo = {
    # Not setup yet
    # cli = {
    #   enable = lib.mkEnableOption "Service packages";
    # };

    interface = {
      gnome.enable = lib.mkEnableOption "Gnome setup";
      niri.enable = lib.mkEnableOption "Niri setup";
      hyprland.enable = lib.mkEnableOption "Hyprland setup";
    };

    services = {
      enable = lib.mkEnableOption "Service packages";
    };
  };

  config =
    # Not setup yet
    # (lib.mkIf config.consuetudo.cli.enable {
    # }) //
    (lib.mkIf config.consuetudo.interface.gnome.enable {
      services.displayManager.gdm.enable = true;
      services.desktopManager.gnome.enable = true;
    })
    // (lib.mkIf config.consuetudo.interface.niri.enable {
      services.displayManager.sddm.enable = true;
      programs.niri.enable = true;
    })
    // (lib.mkIf config.consuetudo.interface.hyprland.enable {
      services.displayManager.sddm.enable = true;
      programs.hyprland.enable = true;
    })
    // (lib.mkIf config.consuetudo.services.enable {
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
