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
      niri.enable = lib.mkEnableOption "Niri setup";
      hyprland.enable = lib.mkEnableOption "Hyprland setup";
    };
  };

  config =
    # Not setup yet
    # (lib.mkIf config.consuetudo.cli.enable {
    # }) //
    (lib.mkIf config.consuetudo.interface.niri.enable {
      programs.niri.enable = true;
      services.hypridle.enable = true;

      consuetudo.programs.waylock.enable = true;
      programs.hyprlock.enable = false;

    })
    // (lib.mkIf config.consuetudo.interface.hyprland.enable {
      wayland.windowManager.hyprland.enable = true;
      services.hypridle.enable = true;

      consuetudo.programs.waylock.enable = true;
      programs.hyprlock.enable = false;

    });
}
