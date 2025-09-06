{ config, ... }:

{
  programs.waybar.style =
    #css
    ''
      * {
        border: none;
        border-radius: 0px;
        padding: 0;
        margin: 0;
        font-family: ${config.stylix.fonts.monospace.name};
        font-weight: bold;
        /* opacity: opacity; */
        /* font-size: font_size; */
      }

      window#waybar {
        background: #${config.lib.stylix.colors.base01};
        border-top: 1px solid #${config.lib.stylix.colors.base0D};
      }

      tooltip {
        background: #${config.lib.stylix.colors.base00};
        border: 1px solid #${config.lib.stylix.colors.base0D};
      }
      tooltip label {
        margin: 5px;
        color: #${config.lib.stylix.colors.base05};
      }

      #workspaces {
        padding-left: 15px;
      }
      #workspaces button {
        color: #${config.lib.stylix.colors.base03};
        padding-left:  5px;
        padding-right: 5px;
        margin-right: 10px;
      }
      #workspaces button.empty {
        color: #${config.lib.stylix.colors.base0D};
      }
      #workspaces button.active {
        color: #${config.lib.stylix.colors.base0B};
      }

      #clock {
        color: #${config.lib.stylix.colors.base05};
      }

      #tray {
        margin-left: 10px;
        color: #${config.lib.stylix.colors.base05};
      }
      #tray menu {
        background: #${config.lib.stylix.colors.base00};
        border: 1px solid #${config.lib.stylix.colors.base0D};
        padding: 6px;
      }
      #tray menuitem {
        padding: 1px;
      }

      #pulseaudio, #network, #cpu, #memory, #disk, #battery, #language, #custom-notification {
        padding-left: 5px;
        padding-right: 5px;
        margin-right: 10px;
        color: #${config.lib.stylix.colors.base05};
      }

      #pulseaudio, #language {
        margin-left: 15px;
      }

      #custom-notification {
        margin-left: 15px;
        padding-right: 2px;
        margin-right: 5px;
      }

      #custom-launcher {
        font-size: 15px;
        color: #${config.lib.stylix.colors.base05};
        font-weight: bold;
        margin-left: 15px;
        padding-right: 10px;
      }
    '';
}
