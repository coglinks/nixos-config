{ pkgs, ... }:

{
  services.activitywatch = {
    enable = true;
    watchers = {
      # NOTE:
      /*
        The following are not in nixpkgs:
          aw-watcher-utilization
          aw-watcher-steam
          aw-import-ical
          aw-watcher-tmux
          aw-watcher-web
          aw-watcher-media-player
      */
      awatcher = {
        package = pkgs.awatcher;
        executable = "awatcher";
      };
    };
  };

  home.file."~/.config/awatcher".text =
    #yaml
    ''
      [server]
      port = 5600
      host = "127.0.0.1"

      [awatcher]
      idle-timeout-seconds=180
      poll-time-idle-seconds=4
      poll-time-window-seconds=1

      [[awatcher.filters]]
      # match only "navigator"
      match-app-id = "navigator"
      # match any title which contains "Secret" or "secret" 
      match-title = ".*[sS]ecret.*"
      replace-app-id = "firefox"
      replace-title = "Unknown"
    '';
}
