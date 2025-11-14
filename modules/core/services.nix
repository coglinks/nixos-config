{ pkgs, ... }:
{
  services = {
    scanservjs.enable = true;
    jellyfin = {
      enable = true;
      openFirewall = true;
    };
    gvfs.enable = true;

    gnome = {
      tinysparql.enable = true;
      gnome-keyring.enable = true;
    };

    dbus.enable = true;
    fstrim.enable = true;

    # needed for GNOME services outside of GNOME Desktop
    dbus.packages = with pkgs; [
      gcr
      gnome-settings-daemon
    ];
<<<<<<< HEAD
    tailscale = {
      enable = true;
      useRoutingFeatures = "both";
    };
||||||| 7b9b95fa
=======

    logind.settings.Login = {
      # don’t shutdown when power button is short-pressed
      HandlePowerKey = "ignore";
    };

    udisks2.enable = true;
>>>>>>> refs/remotes/foundation/main
  };
}
