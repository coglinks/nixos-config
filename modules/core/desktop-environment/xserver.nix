{ username, ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us,ara";
    };
    displayManager = {
      enable = true;
      autoLogin = {
        enable = false;
        user = "${username}";
      };
    };
    libinput = {
      enable = true;
    };
  };
  # To prevent getting stuck at shutdown
  systemd.settings.Manager.DefaultTimeoutStopSec = "10s";
}
