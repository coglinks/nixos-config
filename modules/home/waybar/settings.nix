{
  lib,
  host,
  config,
  ...
}:

{
  programs.waybar.settings =
    with config.lib.stylix;
    let
      common = {
        start_hidden = true;
        layer = "top";
        height = 5;
        margin-top = 0;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
      };
      # topBar = {
      #   position = "top";
      #   modules-left = [
      #     "hyprland/windowcount"
      #     "hyprland/workspaces#2"
      #   ];
      #   "hyprland/windowcount" = {
      #     format = " W:{}";
      #   };
      #   "hyprland/workspaces#2" = {
      #     active-only = true;
      #     disable-scroll = false;
      #     format = "{icon}: {windows}";
      #     workspace-taskbar = {
      #       enable = true;
      #       update-active-window = true;
      #       format = "{icon} {title:.15}";
      #     };
      #     on-click = "activate";
      #   };
      #
      # };
      bottomBar = {
        position = "bottom";
        layer = "top";
        height = 5;
        margin-top = 0;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
        modules-left = [
          # "hyprland/submap"
          # "hyprland/workspaces"
          "tray"
        ];
        modules-center = [
          "idle_inhibitor"
          "clock"
        ];
        modules-right = [
          "cpu"
          "memory"
          (if (host == "desktop") then "disk" else "")
          "pulseaudio"
          "network"
          "battery"
          "hyprland/language"
          "custom/notification"
        ];
        clock = {
          calendar = {
            format = {
              today = "<span color='#${colors.base0B}'><b>{}</b></span>";
            };
          };
          format = "  {:%H:%M}";
          tooltip = "true";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "  {:%d/%m}";
        };
        "niri/workspaces" = {
          "format" = "{icon}";
          "format-icons" = {
            # Named workspaces
            # (you need to configure them in niri)
            # "browser" = "";
            # "discord" = "";
            # "chat" = "<b></b>";

            # Icons by state
            "active" = "";
            "default" = "";
          };
        };
        "hyprland/workspaces" = {
          active-only = false;
          disable-scroll = false;
          format = "{icon}";
          on-click = "activate";
        };
        cpu = {
          format = "<span foreground='#${colors.base0B}'> </span> {usage}%";
          format-alt = "<span foreground='#${colors.base0B}'> </span> {avg_frequency} GHz";
          interval = 2;
          on-click-right = "hyprctl dispatch exec '[float; center; size 950 650] kitty --override font_size=14 --title float_kitty btop'";
        };
        memory = {
          format = "<span foreground='#${colors.base0C}'>󰟜 </span>{}%";
          format-alt = "<span foreground='#${colors.base0C}'>󰟜 </span>{used} GiB"; # 
          interval = 2;
          on-click-right = "hyprctl dispatch exec '[float; center; size 950 650] kitty --override font_size=14 --title float_kitty btop'";
        };
        disk = {
          # path = "/";
          format = "<span foreground='#${colors.base0A}'>󰋊 </span>{percentage_used}%";
          interval = 60;
          on-click-right = "hyprctl dispatch exec '[float; center; size 950 650] kitty --override font_size=14 --title float_kitty btop'";
        };
        network = {
          format-wifi = "<span foreground='#${colors.base0E}'> </span> {signalStrength}%";
          format-ethernet = "<span foreground='#${colors.base0E}'>󰀂 </span>";
          tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
          format-linked = "{ifname} (No IP)";
          format-disconnected = "<span foreground='#${colors.base0E}'>󰖪 </span>";
        };
        tray = {
          icon-size = 15;
          spacing = 8;
        };
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "<span foreground='#${colors.base0D}'> </span> {volume}%";
          format-icons = {
            default = [ "<span foreground='#${colors.base0D}'> </span>" ];
          };
          scroll-step = 2;
          on-click = "pamixer -t";
          on-click-right = "pavucontrol";
        };
        battery = {
          format = "<span foreground='#${colors.base09}'>{icon}</span> {capacity}%";
          format-icons = [
            " "
            " "
            " "
            " "
            " "
          ];
          format-charging = "<span foreground='#${colors.base09}'> </span>{capacity}%";
          format-full = "<span foreground='#${colors.base09}'> </span>{capacity}%";
          format-warning = "<span foreground='#${colors.base09}'> </span>{capacity}%";
          interval = 5;
          states = {
            warning = 20;
          };
          format-time = "{H}h{M}m";
          tooltip = true;
          tooltip-format = "{time}";
        };
        idle_inhibitor = {
          tooltip = true;
          tooltip-format-activated = "Idle_inhibitor active";
          tooltip-format-deactivated = "Idle_inhibitor not active";
          format = "{icon}";
          format-icons = {
            activated = " ";
            deactivated = " ";
          };
        };
        "hyprland/language" = {
          format = "";
          format-en = "US";
        };
        "custom/notification" = {
          tooltip = false;
          format = "{icon} ";
          format-icons = {
            notification = "<span foreground='#${colors.base0F}'><sup></sup></span>  ";
            none = "  ";
            dnd-notification = "<span foreground='#${colors.base0F}'><sup></sup></span>  ";
            dnd-none = "  ";
            inhibited-notification = "<span foreground='#${colors.base0F}'><sup></sup></span>  ";
            inhibited-none = "  ";
            dnd-inhibited-notification = "<span foreground='#${colors.base0F}'><sup></sup></span>  ";
            dnd-inhibited-none = "  ";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };
      };
    in
    {
      # topBar = (common // topBar);
      bottomBar = (common // bottomBar);
    };
}
