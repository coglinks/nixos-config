{ config, ... }:

{
  xdg.configFile = {
    "niri/theme.kdl" = {
      text = with config.lib.stylix.colors.withHashTag; ''
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
        }
      '';
    };
  };
}
