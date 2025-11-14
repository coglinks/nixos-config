{ ... }:
{
<<<<<<< HEAD
  security.rtkit.enable = true;
  security.sudo.enable = true;
  security.pam.services.hyprlock = { };
||||||| 7b9b95fa
  security.rtkit.enable = true;
  security.sudo.enable = true;
  security.pam.services.swaylock = { };
  security.pam.services.hyprlock = { };
=======
  security = {
    rtkit.enable = true;
    sudo.enable = true;

    pam.services = {
      swaylock = { };
      hyprlock = { };
    };
  };
>>>>>>> refs/remotes/foundation/main
}
