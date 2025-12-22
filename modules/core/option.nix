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

    de = lib.mkOption {
      type = lib.types.enum [
        "gnome"
      ];
      default = null;
      description = "Which desktop environment to use";
    };
    wm = lib.mkOption {
      type = lib.types.enum [
        "hyprlock"
        "niri"
      ];
      default = null;
      description = "Which window manager setup to use";
    };
    lock = lib.mkOption {
      type = lib.types.enum [
        "hyprlock"
        "waylock"
      ];
      default = null;
      description = "Which screenlock to use";
    };

    services = {
      enable = lib.mkEnableOption "Service packages";
    };
  };

  config =
    # Not setup yet
    # (lib.mkIf config.consuetudo.cli.enable {
    # }) //
    lib.mkMerge [
      (lib.mkIf (config.consuetudo.de == "gnome") {
        services.desktopManager.gnome.enable = true;
        services.displayManager.gdm.enable = true;
      })
      (lib.mkIf (config.consuetudo.wm == "niri") {
        programs.niri.enable = true;
        services.displayManager.sddm.enable = true;
      })
      (lib.mkIf (config.consuetudo.wm == "hyprland") {
        programs.hyprland.enable = true;
        services.displayManager.sddm.enable = true;
      })

      (lib.mkIf (config.consuetudo.lock == "hyprlock") {
        programs.hyprlock.enable = true;
        consuetudo.programs.waylock.enable = false;
      })

      (lib.mkIf (config.consuetudo.lock == "waylock") {
        consuetudo.programs.waylock.enable = true;
        programs.hyprlock.enable = false;
      })
    ]
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
