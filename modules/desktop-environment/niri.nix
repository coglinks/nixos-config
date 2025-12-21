{
  pkgs,
  username,
  lib,
  config,
  ...
}:

{
  config = lib.mkIf config.consuentudo.interface.niri.enable {
    environment.systemPackages = with pkgs; [
      xwayland-satellite # xwayland support
    ];

    home-manager.users.${username} = {
      xdg.configFile = {
        "niri/design/colors.kdl" = {
          text = with config.lib.stylix.colors.withHashtag; ''
            layout {
              focus-ring {
                // Color of the ring on the active monitor.
                active-color "${base0D}"

                // Color of the ring on inactive monitors.
                inactive-color "${base03}"
              }
              border {
                active-color "${base0D}"
                inactive-color "${base03}"
              }
              shadow {
                color "${base01}"
              }
            }
          '';
        };
      };
    };
  };
}
