{
  lib,
  config,
  username,
  ...
}:

{
  config = lib.mkIf config.home-manager.users.${username}.programs.hyprlock.enable {
    security.pam.services.hyprlock = { };
  };
}
