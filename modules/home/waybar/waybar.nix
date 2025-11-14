{ ... }:
{
  programs.waybar = {
    enable = true;
<<<<<<< HEAD
    package = inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.waybar;
||||||| 7b9b95fa
    package = inputs.waybar.packages.${pkgs.system}.waybar;
=======
>>>>>>> refs/remotes/foundation/main
  };
}
