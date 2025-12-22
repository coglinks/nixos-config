{
  pkgs,
  inputs,
  username,
  ...
}:
{
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      waypaper
      inputs.adw-bluetooth.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
