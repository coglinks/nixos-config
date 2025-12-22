{ inputs, pkgs, ... }:

{
  environment.systemPackages = [
    inputs.adw-bluetooth.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
