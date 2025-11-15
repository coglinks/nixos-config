{ inputs, ... }:

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
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://nix-community.cachix.org"
      "https://nix-gaming.cachix.org"
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
    extra-substituters = [ "https://devenv.cachix.org" ];
    extra-trusted-public-keys = [ "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=" ];
  };
  nixpkgs = {
    overlays = [ inputs.nur.overlays.default ];
  };
}
