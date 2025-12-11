{ inputs, system, ... }:

{
  environment.systemPackages = [
    inputs.adw-bluetooth.packages.${system}.default
  ];
}
