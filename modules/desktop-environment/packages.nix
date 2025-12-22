{
  pkgs,
  inputs,
  username,
  ...
}:
{
  home-manager.users.${username} = {
    home.packages = [ inputs.adw-bluetooth.packages.${pkgs.stdenv.hostPlatform.system}.default ];
  };
}
