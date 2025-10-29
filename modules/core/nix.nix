{ ... }:

{
  # Disabled as it's not needed for now
  # this allows you to access `pkgs-stable` anywhere in your config
  #_module.args.pkgs-stable = import inputs.nixpkgs-stable {
  #  inherit (pkgs.stdenv.hostPlatform) system;
  #  inherit (config.nixpkgs) config;
  #};
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  nix.settings = {
    # max-jobs = 3;
    # cores = 4;
    extra-substituters = [ "https://devenv.cachix.org" ];
    extra-trusted-public-keys = [ "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=" ];
  };
}
