{ ... }:

{
  services.hypridle = {
    enable = true;
    settings = { # Original config submitted by https://github.com/SherLock707, provided by JaKooLit
      general = {
          lock_cmd = "pidof hyprlock || hyprlock"; # runs hyprlock if it is not already running (this is always run when "loginctl lock-session" is called)
          # unlock_cmd = killall hyprlock # kills hyprlock when unlocking (this is always run when "loginctl unlock-session" is called)
          before_sleep_cmd = "loginctl lock-session";    # ensures that the session is locked before going to sleep
          after_sleep_cmd = "hyprctl dispatch dpms on"; # turn of screen after sleep (not strictly necessary, but just in case)
          ignore_dbus_inhibit = false;             # whether to ignore dbus-sent idle-inhibit requests (used by e.g. firefox or steam)
      };
      listener = [
        { # Warn
          timeout = 240; # 4 min
          on-timeout = "notify-send \"You are idle!\""; # command to run when timeout has passed
        }
        { # Screenlock
          timeout = 300; # 5 min
          on-timeout = "loginctl lock-session"; # command to run when timeout has passed
        }
        { # Suspend
          timeout = 600; # 10 min
          on-timeout = "systemctl suspend"; # command to run when timeout has passed
        }
        { # Hibernate
          timeout = 1800; # 30 min
          on-timeout = "systemctl hibernate"; # command to run when timeout has passed
        }
      ];
    };
  };
}
