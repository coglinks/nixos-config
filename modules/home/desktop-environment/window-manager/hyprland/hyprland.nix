{
  pkgs,
  config,
  lib,
  username,
  inputs,
  ...
}:

let
  browser = "firefox";
  terminal = "kitty";
  screenLock = "hyprlock";
in
{
  config = lib.mkIf config.consuetudo.interface.hyprland.enable {

    home.packages = with pkgs; [
      inputs.hypr-contrib.packages.${pkgs.stdenv.hostPlatform.system}.grimblast
      inputs.hyprpicker.packages.${pkgs.stdenv.hostPlatform.system}.hyprpicker
      swww
      nwg-displays
      hyprpolkitagent
      gradia
      copyq
      grim
      slurp
      wlogout
      wl-clip-persist
      cliphist
      wf-recorder
      glib
      wayland
      direnv
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      package = null;
      portalPackage = null;

      xwayland = {
        enable = true;
        # hidpi = true;
      };
      # enableNvidiaPatches = false;
      systemd.enable = true;
      # monitor-rules
      extraConfig = lib.mkOrder 1500 ''
        source = ./monitors.conf
        source = ./workspaces.conf
      '';
    };

    xdg.configFile = {
      "hypr/scripts" = {
        source = config.lib.file.mkOutOfStoreSymlink ./scripts;
        recursive = true;
      };
      "hypr/UserScripts" = {
        source = config.lib.file.mkOutOfStoreSymlink ./UserScripts;
        recursive = true;
      };
    };
    wayland.windowManager.hyprland = {
      settings = lib.mkOrder 1000 {
        # autostart
        exec-once = [
          # "hash dbus-update-activation-environment 2>/dev/null"
          "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

          "[workspace 1] ${browser}"
          "[workspace 8 silent ] ${terminal}"
          "[workspace 9 silent ] kitty sh -c 'btop'"

          "gnome-keyring-daemon --start --components=secrets,ssh"
          "systemctl --user start hyprpolkitagent"
          "nm-applet &"
          "blueman-applet &"
          "poweralertd &"
          "wl-clip-persist --clipboard both &"
          "wl-paste --watch cliphist store &"
          "waybar &"
          "swaync &"
          "hyprctl setcursor Bibata-Modern-Ice 24 &"
          "swww-daemon &"

          "hypridle &"
        ];

        # refer to Hyprland wiki for more info https://wiki.hyprland.org/Configuring/Variables/

        input = {
          kb_layout = "us,ara";
          kb_options = "grp:alt_caps_toggle";
          repeat_rate = 50;
          numlock_by_default = true;
          repeat_delay = 300;
          follow_mouse = 1;
          float_switch_override_focus = 0;
          mouse_refocus = 0;
          sensitivity = 0;
          touchpad = {
            natural_scroll = false;
            disable_while_typing = true;
          };
          touchdevice.enabled = false;
        };

        general = {
          "$mainMod" = "SUPER";
          "$scripts" = "~/.config/hypr/scripts";
          "$UserScripts" = "~/.config/hypr/UserScripts";
          layout = "dwindle";
          gaps_in = 0;
          gaps_out = 0;
          border_size = 2;
          resize_on_border = true;
          no_border_on_floating = false;
        };

        gesture = [
          "3, horizontal, workspace"
        ];

        misc = {
          disable_autoreload = false;
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          vfr = true;
          vrr = 2;
          initial_workspace_tracking = 0;
          mouse_move_enables_dpms = true;
          always_follow_on_dnd = true;
          layers_hog_keyboard_focus = true;
          animate_manual_resizes = false;
          enable_swallow = true;
          focus_on_activate = true;
          new_window_takes_over_fullscreen = 2;
          middle_click_paste = false;
        };

        opengl = {
          nvidia_anti_flicker = true; # Enable anti-flicker for NVIDIA (if using NVIDIA GPU)
        };

        render.direct_scanout = 2;

        dwindle = {
          force_split = 2;
          special_scale_factor = 1.0;
          split_width_multiplier = 1.0;
          use_active_for_splits = true;
          pseudotile = true;
          preserve_split = true;
        };

        master = {
          new_status = "master";
          special_scale_factor = 1;
        };

        decoration = {
          rounding = 0;
          blur = {
            enabled = lib.mkForce false;
          };
          shadow = {
            enabled = lib.mkForce false;
          };
        };

        animations = {
          enabled = lib.mkForce false;
        };

        binds = {
          movefocus_cycles_fullscreen = true;
          workspace_back_and_forth = true;
        };

        bind = [
          # show keybinds list
          "$mainMod, F1, exec, show-keybinds"

          # keybindings
          "$mainMod, Return, exec, ${terminal}"
          "ALT, Return, exec, [float; size 1111 700] ${terminal}"
          "$mainMod SHIFT, Return, exec, [fullscreen] ${terminal}"
          "$mainMod, B, exec,  ${browser}"
          "$mainMod, Q, killactive,"
          "$mainMod SHIFT, Q, exec, $scripts/KillActiveProcess.sh"
          "$mainMod, F, fullscreen, 0"
          "$mainMod SHIFT, F, fullscreen, 1"
          "$mainMod ALT, F, exec, hyprctl dispatch workspaceopt allfloat"
          "$mainMod, D, exec, toggle-float"
          "$mainMod, Space, exec, rofi -show drun || pkill rofi"
          "$mainMod SHIFT, S, exec, hyprctl dispatch exec '[workspace 5 silent] SoundWireServer'"
          "$mainMod, Escape, exec, ${screenLock}"
          "$mainMod, Z, exec, $scripts/Wlogout.sh"
          "$mainMod, S, exec, hyprlock & sleep 0.5; systemctl suspend"
          "$mainMod, P, pseudo,"
          "$mainMod, X, togglesplit,"
          "$mainMod, E, exec, nemo"
          "ALT, E, exec, hyprctl dispatch exec '[float; size 1111 700] nemo'"
          "$mainMod SHIFT, B, exec, pkill -SIGUSR1 waybar"
          "$mainMod, C ,exec, hyprpicker -a"
          "$mainMod, W,exec, wallpaper-picker"
          "$mainMod SHIFT, W,exec, hyprctl dispatch exec '[float; size 925 615] waypaper'"
          "$mainMod, N, exec, swaync-client -t -sw"
          "CTRL SHIFT, Escape, exec, hyprctl dispatch exec '[workspace 9] missioncenter'"
          "$mainMod, equal, exec, woomer"
          # "$mainMod SHIFT, W, exec, vm-start"

          # screenshot
          "SUPER SHIFT, S, exec, screenshot --copy"
          ", Print, exec, gradia --screenshot=INTERACTIVE" # screenshot area
          "SHIFT, Print, exec, gradia --screenshot=FULL" # screenshot full desktop

          # switch focus
          "$mainMod, left,  movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up,    movefocus, u"
          "$mainMod, down,  movefocus, d"
          "$mainMod, h, movefocus, l"
          "$mainMod, j, movefocus, d"
          "$mainMod, k, movefocus, u"
          "$mainMod, l, movefocus, r"

          "$mainMod, left,  alterzorder, top"
          "$mainMod, right, alterzorder, top"
          "$mainMod, up,    alterzorder, top"
          "$mainMod, down,  alterzorder, top"
          "$mainMod, h, alterzorder, top"
          "$mainMod, j, alterzorder, top"
          "$mainMod, k, alterzorder, top"
          "$mainMod, l, alterzorder, top"

          "CTRL ALT, up, exec, hyprctl dispatch focuswindow floating"
          "CTRL ALT, down, exec, hyprctl dispatch focuswindow tiled"

          #NOTE: WORKSPACE MOVE BINDS

          # The following mappings use the key codes to better support various keyboard layouts
          # 1 is code:10, 2 is code 11, etc
          # switch workspace
          "$mainMod, code:10, workspace, 1"
          "$mainMod, code:11, workspace, 2"
          "$mainMod, code:12, workspace, 3"
          "$mainMod, code:13, workspace, 4"
          "$mainMod, code:14, workspace, 5"
          "$mainMod, code:15, workspace, 6"
          "$mainMod, code:16, workspace, 7"
          "$mainMod, code:17, workspace, 8"
          "$mainMod, code:18, workspace, 9"
          "$mainMod, code:19, workspace, 10"
          "$mainMod, mouse_down, workspace, e-1"
          "$mainMod, mouse_up, workspace, e+1"
          "$mainMod, comma, workspace, e-1"
          "$mainMod, period, workspace, e+1"

          # Move active window and follow to workspace mainMod + SHIFT [0-9]
          "$mainMod SHIFT, code:10, movetoworkspace, 1" # movetoworkspacesilent
          "$mainMod SHIFT, code:11, movetoworkspace, 2"
          "$mainMod SHIFT, code:12, movetoworkspace, 3"
          "$mainMod SHIFT, code:13, movetoworkspace, 4"
          "$mainMod SHIFT, code:14, movetoworkspace, 5"
          "$mainMod SHIFT, code:15, movetoworkspace, 6"
          "$mainMod SHIFT, code:16, movetoworkspace, 7"
          "$mainMod SHIFT, code:17, movetoworkspace, 8"
          "$mainMod SHIFT, code:18, movetoworkspace, 9"
          "$mainMod SHIFT, code:19, movetoworkspace, 10"
          "$mainMod SHIFT, comma, movetoworkspace, -1"
          "$mainMod SHIFT, period, movetoworkspace, +1"

          # Move active window to a workspace silently mainMod + CTRL [0-9]
          "$mainMod CTRL, code:10, movetoworkspacesilent, 1"
          "$mainMod CTRL, code:11, movetoworkspacesilent, 2"
          "$mainMod CTRL, code:12, movetoworkspacesilent, 3"
          "$mainMod CTRL, code:13, movetoworkspacesilent, 4"
          "$mainMod CTRL, code:14, movetoworkspacesilent, 5"
          "$mainMod CTRL, code:15, movetoworkspacesilent, 6"
          "$mainMod CTRL, code:15, movetoworkspacesilent, 7"
          "$mainMod CTRL, code:17, movetoworkspacesilent, 8"
          "$mainMod CTRL, code:18, movetoworkspacesilent, 9"
          "$mainMod CTRL, code:19, movetoworkspacesilent, 10"
          "$mainMod CTRL, comma, movetoworkspacesilent, -1"
          "$mainMod CTRL, period, movetoworkspacesilent, +1"

          "$mainMod CTRL, c, movetoworkspace, empty"

          ##################################
          # Keybindings for Second Monitor (HDMI-A-5)
          ##################################
          # Switch workspaces with $mainMod + [F1-F9]
          "$mainMod, F1, workspace, 11"
          "$mainMod, F2, workspace, 12"
          "$mainMod, F3, workspace, 13"
          "$mainMod, F4, workspace, 14"
          "$mainMod, F5, workspace, 15"
          "$mainMod, F6, workspace, 16"
          "$mainMod, F7, workspace, 17"
          "$mainMod, F8, workspace, 18"
          "$mainMod, F9, workspace, 19"

          # Move active window and follow to workspace $mainMod + SHIFT + [F1-F9]
          "$mainMod SHIFT, F1, movetoworkspace, 11"
          "$mainMod SHIFT, F2, movetoworkspace, 12"
          "$mainMod SHIFT, F3, movetoworkspace, 13"
          "$mainMod SHIFT, F4, movetoworkspace, 14"
          "$mainMod SHIFT, F5, movetoworkspace, 15"
          "$mainMod SHIFT, F6, movetoworkspace, 16"
          "$mainMod SHIFT, F7, movetoworkspace, 17"
          "$mainMod SHIFT, F8, movetoworkspace, 18"
          "$mainMod SHIFT, F9, movetoworkspace, 19"

          # Move active window silently to workspace $mainMod + CTRL + [F1-F9]
          "$mainMod CTRL, F1, movetoworkspacesilent, 11"
          "$mainMod CTRL, F2, movetoworkspacesilent, 12"
          "$mainMod CTRL, F3, movetoworkspacesilent, 13"
          "$mainMod CTRL, F4, movetoworkspacesilent, 14"
          "$mainMod CTRL, F5, movetoworkspacesilent, 15"
          "$mainMod CTRL, F6, movetoworkspacesilent, 16"
          "$mainMod CTRL, F7, movetoworkspacesilent, 17"
          "$mainMod CTRL, F8, movetoworkspacesilent, 18"
          "$mainMod CTRL, F9, movetoworkspacesilent, 19"

          # window control
          "$mainMod SHIFT, left, movewindow, l"
          "$mainMod SHIFT, right, movewindow, r"
          "$mainMod SHIFT, up, movewindow, u"
          "$mainMod SHIFT, down, movewindow, d"
          "$mainMod SHIFT, h, movewindow, l"
          "$mainMod SHIFT, j, movewindow, d"
          "$mainMod SHIFT, k, movewindow, u"
          "$mainMod SHIFT, l, movewindow, r"

          "$mainMod CTRL, left, resizeactive, -80 0"
          "$mainMod CTRL, right, resizeactive, 80 0"
          "$mainMod CTRL, up, resizeactive, 0 -80"
          "$mainMod CTRL, down, resizeactive, 0 80"
          "$mainMod CTRL, h, resizeactive, -80 0"
          "$mainMod CTRL, j, resizeactive, 0 80"
          "$mainMod CTRL, k, resizeactive, 0 -80"
          "$mainMod CTRL, l, resizeactive, 80 0"

          "$mainMod ALT, left, moveactive,  -80 0"
          "$mainMod ALT, right, moveactive, 80 0"
          "$mainMod ALT, up, moveactive, 0 -80"
          "$mainMod ALT, down, moveactive, 0 80"
          "$mainMod ALT, h, moveactive,  -80 0"
          "$mainMod ALT, j, moveactive, 0 80"
          "$mainMod ALT, k, moveactive, 0 -80"
          "$mainMod ALT, l, moveactive, 80 0"

          # media and volume controls
          ",XF86AudioMute,exec, pamixer -t"
          ",XF86AudioPlay,exec, playerctl play-pause"
          ",XF86AudioNext,exec, playerctl next"
          ",XF86AudioPrev,exec, playerctl previous"
          ",XF86AudioStop,exec, playerctl stop"

          # clipboard manager
          "$mainMod, V, exec, cliphist list | rofi -dmenu -theme-str 'window {width: 50%;} listview {columns: 1;}' | cliphist decode | wl-copy"
        ];

        bindn = [
          ",Escape,exec, swaync-client --close-latest"
          "SHIFT,Escape,exec, swaync-client --close-all"
          "ALT, Escape,exec, swaync-client --hide-all"
        ];
        binde = [
          ",XF86AudioRaiseVolume,exec, pamixer -i 2"
          ",XF86AudioLowerVolume,exec, pamixer -d 2"
        ];

        # laptop brigthness
        bindel = [
          ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
          ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ];
        bindl = [
          "$mainMod, XF86MonBrightnessUp, exec, brightnessctl set 100%+"
          "$mainMod, XF86MonBrightnessDown, exec, brightnessctl set 100%-"
        ];

        # mouse binding
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        # windowrule
        windowrule = [
          "float,class:^(Viewnior)$"
          "float,class:^(imv)$"
          "float,class:^(mpv)$"
          "tile,class:^(Aseprite)$"
          "float,class:^(Audacious)$"
          "pin,class:^(rofi)$"
          "pin,class:^(waypaper)$"
          # "idleinhibit focus,mpv"
          # "float,udiskie"
          "float,title:^(Transmission)$"
          "float,title:^(Volume Control)$"
          "float,title:^(Firefox — Sharing Indicator)$"
          "move 0 0,title:^(Firefox — Sharing Indicator)$"
          "size 700 450,title:^(Volume Control)$"
          "move 40 55%,title:^(Volume Control)$"

          "float, title:^(Picture-in-Picture)$"
          "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$"
          "pin, title:^(Picture-in-Picture)$"
          "opacity 1.0 override 1.0 override, title:^(.*imv.*)$"
          "opacity 1.0 override 1.0 override, title:^(.*mpv.*)$"
          "opacity 1.0 override 1.0 override, class:(Aseprite)"
          "opacity 1.0 override 1.0 override, class:(Unity)"
          "opacity 1.0 override 1.0 override, class:(zen)"
          "opacity 1.0 override 1.0 override, class:(evince)"
          "workspace 3, class:^(evince)$"
          "workspace 4, class:^(Gimp-2.10)$"
          "workspace 5, class:^(Spotify)$"
          "workspace 8, class:^(com.obsproject.Studio)$"
          "workspace 10, class:^(discord)$"
          "idleinhibit focus, class:^(mpv)$"
          "idleinhibit fullscreen, class:^(firefox)$"
          "float,class:^(org.gnome.Calculator)$"
          "float,class:^(waypaper)$"
          "float,class:^(zenity)$"
          "size 850 500,class:^(zenity)$"
          "size 725 330,class:^(SoundWireServer)$"
          "float,class:^(org.gnome.FileRoller)$"
          "float,class:^(org.pulseaudio.pavucontrol)$"
          "float,class:^(SoundWireServer)$"
          "float,class:^(.sameboy-wrapped)$"
          "float,class:^(file_progress)$"
          "float,class:^(confirm)$"
          "float,class:^(dialog)$"
          "float,class:^(download)$"
          "float,class:^(notification)$"
          "float,class:^(error)$"
          "float,class:^(confirmreset)$"
          "float,title:^(Open File)$"
          "float,title:^(File Upload)$"
          "float,title:^(branchdialog)$"
          "float,title:^(Confirm to replace files)$"
          "float,title:^(File Operation Progress)$"

          "opacity 0.0 override,class:^(xwaylandvideobridge)$"
          "noanim,class:^(xwaylandvideobridge)$"
          "noinitialfocus,class:^(xwaylandvideobridge)$"
          "maxsize 1 1,class:^(xwaylandvideobridge)$"
          "noblur,class:^(xwaylandvideobridge)$"

          # No gaps when only
          "bordersize 0, floating:0, onworkspace:w[t1]"
          "rounding 0, floating:0, onworkspace:w[t1]"
          "bordersize 0, floating:0, onworkspace:w[tg1]"
          "rounding 0, floating:0, onworkspace:w[tg1]"
          "bordersize 0, floating:0, onworkspace:f[1]"
          "rounding 0, floating:0, onworkspace:f[1]"

          # "maxsize 1111 700, floating: 1"
          # "center, floating: 1"

          # Remove context menu transparency in chromium based apps
          "opaque,class:^()$,title:^()$"
          "noshadow,class:^()$,title:^()$"
          "noblur,class:^()$,title:^()$"
        ];

        # No gaps when only
        workspace = [
          "w[t1], gapsout:0, gapsin:0"
          "w[tg1], gapsout:0, gapsin:0"
          "f[1], gapsout:0, gapsin:0"
        ];

        monitor = [ "=,preferred,auto,auto" ];

        xwayland = {
          force_zero_scaling = true;
        };
      };
    };

  };

}
