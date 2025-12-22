{
  pkgs,
  inputs,
  username,
  ...
}:
{
  home.packages = with pkgs; [
    waypaper
    inputs.adw-bluetooth.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
