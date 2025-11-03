{ ... }:
{
  imports = [
    ./../../modules/core/loq-default.nix
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  powerManagement.cpuFreqGovernor = "performance";
}
