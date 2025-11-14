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

<<<<<<< HEAD
      window#waybar {
        background: #${config.lib.stylix.colors.base01};
        border-top: 1px solid #${config.lib.stylix.colors.base0D};
      }
||||||| 7b9b95fa
    window#waybar {
      background: #282828;
      border-top: 1px solid ${border_color};
    }
=======
    window#waybar {
      background: ${background_1};
      border-top: 1px solid ${border_color};
    }
>>>>>>> refs/remotes/foundation/main

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

      #idle_inhibitor {
        color: #${config.lib.stylix.colors.base05};
        padding-left:  5px;
        padding-right: 5px;
        margin-right: 10px;
      }
      #idle_inhibitor.activated {
        color: #${config.lib.stylix.colors.base0B};
        padding-left:  5px;
        padding-right: 5px;
        margin-right: 10px;
      }

<<<<<<< HEAD
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
||||||| 7b9b95fa
    #pulseaudio, #network, #cpu, #memory, #disk, #battery, #language, #custom-notification {
      padding-left: 5px;
      padding-right: 5px;
      margin-right: 10px;
      color: ${text_color};
    }
=======
    #pulseaudio, #network, #cpu, #memory, #disk, #battery, #language, #custom-notification, #custom-power-menu {
      padding-left: 5px;
      padding-right: 5px;
      margin-right: 10px;
      color: ${text_color};
    }
>>>>>>> refs/remotes/foundation/main

<<<<<<< HEAD
      #pulseaudio, #network, #cpu, #memory, #disk, #battery, #language, #custom-notification {
        padding-left: 5px;
        padding-right: 5px;
        margin-right: 10px;
        color: #${config.lib.stylix.colors.base05};
      }
||||||| 7b9b95fa
    #pulseaudio, #language {
      margin-left: 15px;
    }
=======
    #pulseaudio, #language, #custom-notification {
      margin-left: 15px;
    }
>>>>>>> refs/remotes/foundation/main

<<<<<<< HEAD
      #pulseaudio, #language {
        margin-left: 15px;
      }
||||||| 7b9b95fa
    #custom-notification {
      margin-left: 15px;
      padding-right: 2px;
      margin-right: 5px;
    }
=======
    #custom-power-menu {
      padding-right: 2px;
      margin-right: 5px;
    }
>>>>>>> refs/remotes/foundation/main

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
