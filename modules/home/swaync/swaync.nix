{ config, pkgs, ... }:
{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      layer-shell = "true";
      cssPriority = "user";
      control-center-margin-top = 10;
      control-center-margin-bottom = 10;
      control-center-margin-right = 10;
      control-center-margin-left = 10;
      notification-icon-size = 64;
      notification-body-image-height = 128;
      notification-body-image-width = 200;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = true;
      control-center-width = 400;
      control-center-height = 650;
      notification-window-width = 350;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      widgets = [
        "title"
        "menubar#desktop"
        "volume"
        "backlight#mobile"
        "mpris"
        "dnd"
        "notifications"
      ];
      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = " Clear All ";
        };
        "menubar#desktop" = {
          "menu#powermode-buttons" = {
            label = " 󰌪 ";
            position = "left";
            actions = [
              {
                label = "Performance";
                command = "powerprofilesctl set performance";
              }
              {
                label = "Balanced";
                command = "powerprofilesctl set balanced";
              }
              {
                label = "Power-saver";
                command = "powerprofilesctl set power-saver";
              }
            ];
          };
          "menu#screenshot" = {
            label = "  ";
            position = "left";
            actions = [
              {
                label = "󰹑  Whole screen";
                command = "grimblast --notify --cursor --freeze copy output";
              }
              {
                label = "󰩭  Window / Region";
                command = "grimblast --notify --cursor --freeze copy area";
              }
            ];
          };
          "menu#record" = {
            label = " 󰕧 ";
            position = "left";
            actions = [
              {
                label = "  Record screen";
                command = "record screen & ; swaync-client -t";
              }
              {
                label = "  Record selection";
                command = "record area & ; swaync-client -t";
              }
              {
                label = "  Record GIF";
                command = "record gif & ; swaync-client -t";
              }
              {
                label = "󰻃  Stop";
                command = "record stop";
              }
            ];
          };
          "menu#power-buttons" = {
            label = "  ";
            position = "left";
            actions = [
              {
                label = "  Lock";
                command = "swaylock";
              }
              {
                label = "  Reboot";
                command = "systemctl reboot";
              }
              {
                label = "  Shut down";
                command = "systemctl poweroff";
              }
            ];
          };
        };
        "backlight#mobile" = {
          label = " 󰃠 ";
          device = "panel";
        };
        volume = {
          label = "";
          expand-button-label = "";
          collapse-button-label = "";
          show-per-app = true;
          show-per-app-icon = true;
          show-per-app-label = false;
        };
        dnd = {
          text = " Do Not Disturb";
        };
        mpris = {
          image-size = 85;
          image-radius = 5;
        };
      };
    };
    style =
      # css
      ''
        * {
            font-family: "NotoSansMono Nerd Font";
            background-clip: border-box;
        }

        /* === Progress Bars === */
        progress,
        progressbar,
        trough {
          border: 1px solid @base0D;
        }

        trough {
          background: @base01;
        }

        /* === Notifications === */
        .notification {
          border: 1px solid @base0B;
          box-shadow: none;
          border-radius: 4px;
          background: inherit;
        }

        /* Priority states */
        .notification.low {
          border: 1px solid @base03;
        }
        .notification.low progress {
          background: @base03;
        }

        .notification.normal {
          border: 1px solid @base0D;
        }
        .notification.normal progress {
          background: @base0F;
        }

        .notification.critical {
          border: 1px solid @base08;
        }
        .notification.critical progress {
          background: @base08;
        }

        /* Buttons inside notifications */
        .notification button {
          background: transparent;
          border-radius: 0px;
          border: none;
          margin: 0;
          padding: 0;
        }
        .notification button:hover {
          background: @base01;
        }

        /* Notification actions */
        .notification-default-action,
        .notification-action {
          background: transparent;
          border: none;
          color: @base05;
        }

        .notification-default-action {
          border-radius: 4px;
        }
        .notification-default-action:not(:only-child) {
          border-bottom-left-radius: 0;
          border-bottom-right-radius: 0;
        }

        .notification-action {
          border-radius: 0;
          padding: 2px;
        }
        .notification-action:first-child {
          border-bottom-left-radius: 4px;
        }
        .notification-action:last-child {
          border-bottom-right-radius: 4px;
        }
        .notification-action:hover {
          background: @base01;
          color: @base05;
        }
        .notification-action:active {
          background: @base0F;
          color: @base05;
        }

        /* Close button */
        .close-button {
          color: @base02;
          background: @base08;
        }
        .close-button:hover {
          background: @base09;
          color: @base04;
        }
        .close-button:active {
          background: @base08;
          color: @base00;
        }

        /* Notification content */
        .notification-content {
          background: @base00;
          border: 1px solid @base0D;
          min-height: 64px;
          margin: 10px;
          padding: 0;
          border-radius: 0;
        }

        /* === Text Styling === */
        .summary {
          color: @base05;
          font-size: 16px;
        }
        .body {
          color: @base06;
          font-size: 14px;
          font-weight: 500;
        }
        .time {
          color: @base06;
          font-size: 12px;
        }

        /* === Notification Layout === */
        .notification-row {
          outline: none;
          transition: all 1s ease;
          background: @base00;
          border: 1px solid @base01;
          margin: 10px 5px 0 5px;
          border-radius: 4px;
        }
        .notification-row:hover {
          box-shadow: none;
        }

        /* === Control Center === */
        .control-center {
          background: @base00;
          border: 2px solid @base03;
          border-radius: 0;
          box-shadow: 0 0 2px @base02;
          color: @base05;
        }
        .control-center .notification-row .notification-background {
          background: @base00;
          color: @base05;
        }
        .control-center .notification-row .notification-background:hover {
          background: @base01;
          color: @base05;
        }
        .control-center .notification-row .notification-background:active {
          background: @base0F;
          color: @base05;
        }
        .control-center-list {
          background: @base00;
          border-top: none;
          border-radius: 0 0 4px 4px;
          min-height: 5px;
        }

        /* === Widgets === */

        /* Widget titles */
        .widget-title {
          color: @base05;
          margin: 0.5rem;
          background: inherit;
          border-radius: 4px 4px 0 0;
          padding-bottom: 20px;
        }
        .widget-title > label {
          margin: 18px 10px;
          font-size: 20px;
          font-weight: 500;
        }
        .widget-title > button {
          font-weight: 700;
          padding: 7px 3px;
          margin-right: 10px;
          background: @base01;
          color: @base05;
          border-radius: 4px;
          border: 1px solid @base0D;
        }
        .widget-title > button:hover {
          background: @base02;
        }

        /* DND Widget */
        .widget-dnd {
          margin: 8px;
          font-size: 1.1rem;
          padding-top: 20px;
          color: @base05;
        }
        .widget-dnd > switch {
          background: @base01;
          border: 1px solid @base0B;
          border-radius: 12px;
        }
        .widget-dnd > switch:hover {
          background: @base02;
        }
        .widget-dnd > switch:checked {
          background: @base0F;
        }
        .widget-dnd > switch slider {
          background: @base06;
          border-radius: 12px;
        }

        /* MPRIS Widget */
        .widget-mpris {
          color: @base05;
          padding: 35px 10px 35px 10px;
          margin-bottom: -33px;
        }
        .widget-mpris .widget-mpris-player {
          background: @base01;
          border: 1px solid @base0D;
          border-radius: 0;
          margin: 0;
        }
        .widget-mpris .widget-mpris-player button:hover {
          background: @base02;
        }
        .widget-mpris-title {
          color: @base06;
          font-weight: bold;
          font-size: 1.25rem;
        }
        .widget-mpris-subtitle {
          color: @base05;
          font-size: 1rem;
        }

        /* Backlight & Volume Widgets */
        .widget-backlight,
        .widget-volume {
          background-color: @base00;
          font-size: 13px;
          font-weight: 600;
          margin: 0;
          padding: 0;
        }
        .widget-volume > box {
          background: @base01;
          border-radius: 4px;
          margin: 5px 10px;
          min-height: 50px;
        }
        .widget-volume > box > button:hover {
          background: @base02;
        }

        /* === Sliders === */
        scale {
          padding: 0;
          margin: 0 10px;
        }
        scale trough {
          border-radius: 4px;
          background: @base01;
        }
        scale highlight {
          border-radius: 5px;
          min-height: 10px;
          margin-right: -5px;
          background: @base0D;
        }
        scale slider {
          margin: -10px;
          min-width: 10px;
          min-height: 10px;
          background: transparent;
          box-shadow: none;
          padding: 0;
        }

        /* === Misc === */
        .blank-window {
          background: transparent;
        }
        .right.overlay-indicator {
          all: unset;
        }
      '';
  };
}
