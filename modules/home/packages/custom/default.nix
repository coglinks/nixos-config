{ ... }:
{
  imports = [
    ./tokei-all.nix
    ./program-chooser/program-chooser.nix
    ./feature-sync-squashed-source.nix
    ./nix-search/nix-search.nix # TUI to search nixpkgs
  ];
}
