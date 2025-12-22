{ ... }:
{
  imports = [
    ./tokei-all.nix
    ./program-chooser/program-chooser.nix
    ./nix-search/nix-search.nix # TUI to search nixpkgs
  ];
}
