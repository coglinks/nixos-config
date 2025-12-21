{ ... }:

{
  imports = [
    ./docker.nix
    ./davfs2.nix
    ./gitolite.nix
    ./gotenberg.nix
    ./services.nix
    ./taskchampion.nix
  ];
}
