{ pkgs, ... }:

{
# Disabled as it's not needed for now 
  # this allows you to access `pkgs-stable` anywhere in your config
  #_module.args.pkgs-stable = import inputs.nixpkgs-stable {
  #  inherit (pkgs.stdenv.hostPlatform) system;
  #  inherit (config.nixpkgs) config;
  #};

  nix.settings = {
    max-jobs = 3;
    cores = 4;
  };
}
