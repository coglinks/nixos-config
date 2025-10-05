{
  inputs,
  pkgs,
  system,
  ...
}:
{
  environment.systemPackages = [
    inputs.winapps.packages.${system}.winapps
    inputs.winapps.packages.${system}.winapps-launcher # optional
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
