{
  inputs,
  pkgs,
  ...
}:
{
  environment.systemPackages = [
    inputs.winapps.packages.${pkgs.stdenv.hostPlatform.system}.winapps
    inputs.winapps.packages.${pkgs.stdenv.hostPlatform.system}.winapps-launcher # optional
    pkgs.curl
    pkgs.dialog
    pkgs.freerdp
    pkgs.git
    pkgs.iproute2
    pkgs.libnotify
    pkgs.nmap
    pkgs.netcat

  ];
}
